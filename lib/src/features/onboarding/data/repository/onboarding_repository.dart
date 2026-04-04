import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_datasource.dart';
import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_repository.g.dart';

class OnboardingRepository {
  OnboardingRepository(this._datasource);
  final OnboardingDatasource _datasource;

  Future<bool> hasCompletedOnboarding() {
    return _datasource.hasCompletedOnboarding();
  }

  Future<void> setOnboardingCompleted() {
    return _datasource.setOnboardingCompleted();
  }

  Future<UserType?> getUserType() {
    return _datasource.getUserType();
  }

  Future<void> setUserType(UserType type) {
    return _datasource.setUserType(type);
  }

  Future<String?> getCallsign() {
    return _datasource.getCallsign();
  }

  Future<void> setCallsign(String callsign) {
    return _datasource.setCallsign(callsign);
  }

  Future<bool> hasTelegramInviteBeenShown() {
    return _datasource.hasTelegramInviteBeenShown();
  }

  Future<void> setTelegramInviteShown() {
    return _datasource.setTelegramInviteShown();
  }

  Future<bool> didJoinTelegram() {
    return _datasource.didJoinTelegram();
  }

  Future<void> setJoinedTelegram() {
    return _datasource.setJoinedTelegram();
  }

  Future<bool> didDeclineTelegram() {
    return _datasource.didDeclineTelegram();
  }

  Future<void> setDeclinedTelegram() {
    return _datasource.setDeclinedTelegram();
  }

  Future<int> getSessionCount() {
    return _datasource.getSessionCount();
  }

  Future<void> incrementSessionCount() {
    return _datasource.incrementSessionCount();
  }
}

@riverpod
Future<OnboardingRepository> onboardingRepository(Ref ref) async {
  final datasource = await ref.watch(onboardingLocalDatasourceProvider.future);
  return OnboardingRepository(datasource);
}
