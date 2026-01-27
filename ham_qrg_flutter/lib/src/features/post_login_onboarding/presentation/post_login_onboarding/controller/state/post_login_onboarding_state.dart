import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';

part 'post_login_onboarding_state.freezed.dart';

@freezed
abstract class PostLoginOnboardingState with _$PostLoginOnboardingState {
  const factory PostLoginOnboardingState({
    @Default(0) int currentStep,
    UserType? selectedUserType,
    @Default('') String callsign,
    @Default(false) bool isSubmitting,

    /// For SWL users: whether they have a callsign (null = not yet chosen)
    bool? hasSwlCallsign,
  }) = _PostLoginOnboardingState;
}
