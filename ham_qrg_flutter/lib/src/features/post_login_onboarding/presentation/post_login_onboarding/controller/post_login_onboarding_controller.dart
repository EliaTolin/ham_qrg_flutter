import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/controller/state/post_login_onboarding_state.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_login_onboarding_controller.g.dart';

@riverpod
class PostLoginOnboardingController extends _$PostLoginOnboardingController {
  @override
  PostLoginOnboardingState build() {
    return const PostLoginOnboardingState();
  }

  void selectUserType(UserType userType) {
    state = state.copyWith(
      selectedUserType: userType,
      currentStep: 1,
      // Reset SWL-specific state when changing user type
      hasSwlCallsign: null,
      callsign: '',
    );
  }

  void updateCallsign(String callsign) {
    state = state.copyWith(callsign: callsign.toUpperCase());
  }

  void setHasSwlCallsign({required bool hasCallsign}) {
    state = state.copyWith(
      hasSwlCallsign: hasCallsign,
      // Clear callsign if user selects "No"
      callsign: hasCallsign ? state.callsign : '',
    );
  }

  void goBack() {
    if (state.currentStep > 0) {
      state = state.copyWith(
        currentStep: state.currentStep - 1,
        // Reset SWL state when going back from SWL step
        hasSwlCallsign: null,
        callsign: '',
      );
    }
  }

  /// Submit the onboarding data (callsign and userType)
  Future<bool> submitOnboarding() async {
    final userType = state.selectedUserType;
    if (userType == null) return false;

    // Determine the callsign to save
    String? callsignToSave;
    if (userType == UserType.licensed) {
      // Licensed user must have a callsign
      callsignToSave = state.callsign.trim();
      if (callsignToSave.isEmpty) return false;
    } else {
      // SWL user
      if (state.hasSwlCallsign ?? false) {
        // SWL with callsign
        callsignToSave = state.callsign.trim();
        if (callsignToSave.isEmpty) return false;
      }
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final profile = await ref.read(getProfileProvider.future);
      final updatedProfile = profile.copyWith(
        callsign: callsignToSave,
        userType: userType,
      );
      await ref.read(updateProfileProvider(updatedProfile).future);
      ref.invalidate(getProfileProvider);
      state = state.copyWith(isSubmitting: false);
      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
      return false;
    }
  }

  bool get isSwl => state.selectedUserType == UserType.swl;
}
