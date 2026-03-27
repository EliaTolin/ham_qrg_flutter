import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    /// 0=welcome, 1=location, 2=userType, 3=callsign, 4=discovery, 5=telegram
    @Default(0) int currentStep,
    @Default(0) int welcomeCardIndex,
    UserType? selectedUserType,
    @Default('') String callsign,

    /// For SWL users: whether they have a callsign (null = not yet chosen)
    bool? hasSwlCallsign,
    @Default(false) bool isSubmitting,
    @Default(false) bool locationGranted,

    /// Nearest repeater for the discovery step
    Repeater? nearestRepeater,
    @Default(false) bool isLoadingDiscovery,
  }) = _OnboardingState;
}
