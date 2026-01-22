import 'package:ham_qrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:ham_qrg/src/features/post_login_onboarding/presentation/post_login_onboarding/controller/state/post_login_onboarding_state.dart';
import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:ham_qrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_login_onboarding_controller.g.dart';

@riverpod
class PostLoginOnboardingController extends _$PostLoginOnboardingController {
  @override
  PostLoginOnboardingState build() {
    return const PostLoginOnboardingState();
  }

  void selectUserType(UserType userType) {
    state = state.copyWith(selectedUserType: userType);
    if (userType == UserType.licensed) {
      state = state.copyWith(currentStep: 1);
    }
  }

  void updateCallsign(String callsign) {
    state = state.copyWith(callsign: callsign.toUpperCase());
  }

  void goBack() {
    state = state.copyWith(currentStep: 0);
  }

  Future<bool> submitCallsign() async {
    final callsign = state.callsign.trim();
    if (callsign.isEmpty) {
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final profile = await ref.read(getProfileProvider.future);
      final updatedProfile = profile.copyWith(callsign: callsign);
      await ref.read(updateProfileProvider(updatedProfile).future);
      ref.invalidate(getProfileProvider);
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
      return false;
    }
  }

  bool get isListener => state.selectedUserType == UserType.listener;
}
