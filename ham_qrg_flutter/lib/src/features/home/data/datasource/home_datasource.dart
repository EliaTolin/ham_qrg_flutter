import 'package:ham_qrg/src/features/home/data/model/home_statistics/home_statistics.dart';

abstract class HomeDatasource {
  Future<bool> isTelegramGroupMember();
  Future<void> setTelegramGroupMember();
  Future<DateTime?> getTelegramInviteLastShownDate();
  Future<void> setTelegramInviteLastShownDate(DateTime time);
  Future<HomeStatisticsModel> getHomeStatistics();
}
