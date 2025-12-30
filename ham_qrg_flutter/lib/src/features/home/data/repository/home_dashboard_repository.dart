import 'package:ham_qrg/src/features/home/data/datasource/home_dashboard_datasource.dart';
import 'package:ham_qrg/src/features/home/data/mappers/home_statistics_mappers.dart';
import 'package:ham_qrg/src/features/home/domain/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/mappers/repeaters_mappers.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_dashboard_repository.g.dart';

class HomeDashboardRepository {
  HomeDashboardRepository(this._homeDashboardDatasource);
  final HomeDashboardDatasource _homeDashboardDatasource;

  final _repeaterMapper = RepeatersMappers();
  final _homeStatisticsMapper = HomeStatisticsMapper();
  
  Future<HomeStatistics> getHomeStatistics() async {
    final model = await _homeDashboardDatasource.getHomeStatistics();
    return _homeStatisticsMapper.fromModel(model);
  }

  Future<List<Repeater>> getNearbyRepeaters({
    required double latitude,
    required double longitude,
    int limit = 3,
  }) async {
    final models = await _homeDashboardDatasource.getNearbyRepeaters(
      latitude: latitude,
      longitude: longitude,
      limit: limit,
    );
    return models.map(_repeaterMapper.fromModel).toList();
  }
}

@riverpod
HomeDashboardRepository homeDashboardRepository(Ref ref) {
  final datasource = ref.read(homeDashboardDatasourceProvider);
  return HomeDashboardRepository(datasource);
}
