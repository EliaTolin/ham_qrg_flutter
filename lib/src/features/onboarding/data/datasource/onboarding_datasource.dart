import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';

abstract class OnboardingDatasource {
  Future<bool> hasCompletedOnboarding();
  Future<void> setOnboardingCompleted();

  Future<UserType?> getUserType();
  Future<void> setUserType(UserType type);

  Future<String?> getCallsign();
  Future<void> setCallsign(String callsign);

  Future<bool> hasTelegramInviteBeenShown();
  Future<void> setTelegramInviteShown();

  Future<bool> didJoinTelegram();
  Future<void> setJoinedTelegram();

  Future<bool> didDeclineTelegram();
  Future<void> setDeclinedTelegram();

  Future<int> getSessionCount();
  Future<void> incrementSessionCount();
}
