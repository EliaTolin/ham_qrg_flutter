abstract class HomeDatasource {
  Future<bool> isTelegramGroupMember();
  Future<void> setTelegramGroupMember();
  Future<DateTime?> getTelegramInviteLastShownDate();
  Future<void> setTelegramInviteLastShownDate(DateTime time);
  Future<bool> hasSeenDisclaimer();
  Future<void> setDisclaimerSeen();
}
