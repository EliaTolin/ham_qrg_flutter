import 'dart:developer';

import 'package:ham_qrg/src/features/home/data/model/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_dashboard_datasource.g.dart';

abstract interface class HomeDashboardDatasource {
  Future<HomeStatisticsModel> getHomeStatistics();
  Future<List<RepeaterModel>> getNearbyRepeaters({
    required double latitude,
    required double longitude,
    int limit,
  });
}

@riverpod
HomeDashboardDatasource homeDashboardDatasource(Ref ref) {
  return HomeMockDashboardDatasource();
}

class HomeMockDashboardDatasource implements HomeDashboardDatasource {
  @override
  Future<HomeStatisticsModel> getHomeStatistics() async {
    try {
      // Mock data - ritorna sempre 2140 per totalRepeaters e 8 per favoritesCount
      await Future.delayed(const Duration(milliseconds: 500));
      return const HomeStatisticsModel(
        totalRepeaters: 2140,
        favoritesCount: 8,
      );
    } catch (e) {
      log('Error fetching home statistics: $e');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> getNearbyRepeaters({
    required double latitude,
    required double longitude,
    int limit = 3,
  }) async {
    try {
      // Mock data - ritorna sempre 3 repeaters mock
      await Future.delayed(const Duration(milliseconds: 500));
      final now = DateTime.now().toIso8601String();
      return [
        RepeaterModel(
          id: '1',
          createdAt: now,
          updatedAt: now,
          callsign: 'IR0RM',
          name: 'Monte Cavo R1',
          frequencyHz: 145625000,
          mode: 'analog',
          status: 'active',
          lat: latitude + 0.1,
          lon: longitude + 0.1,
          distanceM: 12000,
          locality: 'Roma',
          region: 'Lazio',
        ),
        RepeaterModel(
          id: '2',
          createdAt: now,
          updatedAt: now,
          callsign: 'IR5RM',
          name: 'Terminillo R5',
          frequencyHz: 145725000,
          mode: 'analog',
          status: 'inactive',
          lat: latitude + 0.3,
          lon: longitude + 0.2,
          distanceM: 45000,
          locality: 'Rieti',
          region: 'Lazio',
        ),
        RepeaterModel(
          id: '3',
          createdAt: now,
          updatedAt: now,
          callsign: 'IR7RM',
          name: 'Guadagnolo RU7',
          frequencyHz: 431175000,
          mode: 'analog',
          status: 'active',
          lat: latitude + 0.2,
          lon: longitude + 0.15,
          distanceM: 28000,
          locality: 'Roma',
          region: 'Lazio',
        ),
      ];
    } catch (e) {
      log('Error fetching nearby repeaters: $e');
      rethrow;
    }
  }
}

