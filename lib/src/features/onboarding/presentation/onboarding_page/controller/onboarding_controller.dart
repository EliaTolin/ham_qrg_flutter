import 'dart:developer';

import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/controller/state/onboarding_state.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

/// Total number of onboarding steps:
/// 0=welcome, 1=location, 2=userType, 3=discovery, 4=telegram
const _totalSteps = 5;

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  int get totalSteps => _totalSteps;

  // -- Welcome screens --

  void setWelcomeCardIndex(int index) {
    state = state.copyWith(welcomeCardIndex: index);
  }

  void finishWelcome() {
    state = state.copyWith(currentStep: 1);
  }

  // -- Location --

  Future<void> requestLocation() async {
    try {
      final locationService = ref.read(locationServiceProvider);
      final position = await locationService.getCurrentPositionOrDefault();
      // If we got a non-default position, location is granted
      state = state.copyWith(
        locationGranted: true,
        currentStep: 2,
      );
      log('Onboarding: location granted ($position)');
    } catch (e) {
      log('Onboarding: location request failed: $e');
      state = state.copyWith(currentStep: 2);
    }
  }

  void skipLocation() {
    state = state.copyWith(currentStep: 2);
  }

  // -- User type --

  Future<void> selectUserType(UserType userType) async {
    state = state.copyWith(
      selectedUserType: userType,
      isSubmitting: true,
    );
    try {
      final datasource =
          await ref.read(onboardingLocalDatasourceProvider.future);
      await datasource.setUserType(userType);

      state = state.copyWith(
        isSubmitting: false,
        currentStep: 3,
        isLoadingDiscovery: true,
      );

      // Load discovery data
      await _loadDiscoveryData();
    } catch (e) {
      log('Onboarding: user type save failed: $e');
      state = state.copyWith(isSubmitting: false);
    }
  }

  // -- Discovery --

  Future<void> _loadDiscoveryData() async {
    try {
      if (state.locationGranted) {
        final locationService = ref.read(locationServiceProvider);
        final position =
            await locationService.getCurrentPositionOrDefault();
        final repeaters = await ref.read(
          getRepeatersNearbyProvider(
            latitude: position.latitude,
            longitude: position.longitude,
          ).future,
        );
        state = state.copyWith(
          nearestRepeater: repeaters.isNotEmpty ? repeaters.first : null,
          isLoadingDiscovery: false,
        );
      } else {
        state = state.copyWith(isLoadingDiscovery: false);
      }
    } catch (e) {
      log('Onboarding: discovery load failed: $e');
      state = state.copyWith(isLoadingDiscovery: false);
    }
  }

  void finishDiscovery() {
    state = state.copyWith(currentStep: 4);
  }

  // -- Telegram --

  Future<void> joinTelegram() async {
    final datasource =
        await ref.read(onboardingLocalDatasourceProvider.future);
    await datasource.setJoinedTelegram();
    await datasource.setTelegramInviteShown();
  }

  Future<void> declineTelegram() async {
    final datasource =
        await ref.read(onboardingLocalDatasourceProvider.future);
    await datasource.setDeclinedTelegram();
    await datasource.setTelegramInviteShown();
  }

  Future<void> alreadyTelegramMember() async {
    final datasource =
        await ref.read(onboardingLocalDatasourceProvider.future);
    await datasource.setJoinedTelegram();
    await datasource.setTelegramInviteShown();
  }

  // -- Complete --

  Future<void> completeOnboarding() async {
    final datasource =
        await ref.read(onboardingLocalDatasourceProvider.future);
    await datasource.setOnboardingCompleted();
  }
}
