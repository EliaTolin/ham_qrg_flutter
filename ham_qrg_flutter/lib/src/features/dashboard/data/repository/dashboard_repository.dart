import 'package:ham_qrg/src/features/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:ham_qrg/src/features/dashboard/data/mappers/dashboard_statistics_mappers.dart';
import 'package:ham_qrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_repository.g.dart';

class DashboardRepository {
  DashboardRepository(this._dashboardDatasource);
  final DashboardDatasource _dashboardDatasource;

  final _dashboardStatisticsMapper = DashboardStatisticsMapper();

  Future<DashboardStatistics> getDashboardStatistics() async {
    final model = await _dashboardDatasource.getDashboardStatistics();
    return _dashboardStatisticsMapper.fromModel(model);
  }
}

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  final datasource = ref.read(dashboardDatasourceProvider);
  return DashboardRepository(datasource);
}
