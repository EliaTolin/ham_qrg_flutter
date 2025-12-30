import 'dart:developer';

import 'package:ham_qrg/src/features/dashboard/data/model/dashboard_statistics/dashboard_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_datasource.g.dart';

abstract interface class DashboardDatasource {
  Future<DashboardStatisticsModel> getDashboardStatistics();
}

@riverpod
DashboardDatasource dashboardDatasource(Ref ref) {
  return MockDashboardDatasource();
}

class MockDashboardDatasource implements DashboardDatasource {
  @override
  Future<DashboardStatisticsModel> getDashboardStatistics() async {
    try {
      // Mock data - ritorna sempre 2140 per totalRepeaters e 8 per favoritesCount
      await Future.delayed(const Duration(milliseconds: 500));
      return const DashboardStatisticsModel(
        totalRepeaters: 2140,
        favoritesCount: 8,
      );
    } catch (e) {
      log('Error fetching dashboard statistics: $e');
      rethrow;
    }
  }
}
