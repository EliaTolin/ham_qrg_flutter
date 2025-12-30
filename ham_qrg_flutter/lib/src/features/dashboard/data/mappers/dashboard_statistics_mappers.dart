import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/dashboard/data/model/dashboard_statistics/dashboard_statistics.dart';
import 'package:ham_qrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';

class DashboardStatisticsMapper
    implements Mapper<DashboardStatistics, DashboardStatisticsModel> {
  @override
  DashboardStatistics fromModel(DashboardStatisticsModel model) {
    return DashboardStatistics(
      totalRepeaters: model.totalRepeaters,
      favoritesCount: model.favoritesCount,
    );
  }

  @override
  DashboardStatisticsModel toModel(DashboardStatistics entity) {
    return DashboardStatisticsModel(
      totalRepeaters: entity.totalRepeaters,
      favoritesCount: entity.favoritesCount,
    );
  }
}
