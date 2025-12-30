import 'dart:developer';

import 'package:ham_qrg/src/features/home/data/datasource/home_datasource.dart';
import 'package:ham_qrg/src/features/home/data/model/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_mock_datasource.g.dart';

class HomeMockDatasource implements HomeDatasource {
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
          shiftHz: null,
          shiftRaw: null,
          toneRaw: null,
          ctcssHz: null,
          locality: 'Roma',
          region: 'Lazio',
          locator: null,
          managerCallsign: null,
          network: null,
          provinceCode: null,
          nodeNumber: null,
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
          shiftHz: null,
          shiftRaw: null,
          toneRaw: null,
          ctcssHz: null,
          locality: 'Rieti',
          region: 'Lazio',
          locator: null,
          managerCallsign: null,
          network: null,
          provinceCode: null,
          nodeNumber: null,
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
          shiftHz: null,
          shiftRaw: null,
          toneRaw: null,
          ctcssHz: null,
          locality: 'Roma',
          region: 'Lazio',
          locator: null,
          managerCallsign: null,
          network: null,
          provinceCode: null,
          nodeNumber: null,
        ),
      ];
    } catch (e) {
      log('Error fetching nearby repeaters: $e');
      rethrow;
    }
  }
}

@riverpod
HomeDatasource homeMockDatasource(Ref ref) {
  return HomeMockDatasource();
}

