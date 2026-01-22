import 'dart:developer';

import 'package:ham_qrg/src/features/dashboard/controller/state/dashboard_state.dart';
import 'package:ham_qrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_total_favorites_count/get_total_favorites_count_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:ham_qrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    final countFavorites = await ref.watch(getTotalFavoritesCountProvider.future);
    log('countFavorites: $countFavorites');
    final countRepeaters = await ref.watch(getTotalRepeatersCountProvider.future);

    return _loadInitialData(countFavorites ?? 0, countRepeaters);
  }

  Future<DashboardState> _loadInitialData(int countFavorites, int countRepeaters) async {
    // Load statistics

    final profile = await ref.read(getProfileProvider.future);
    // Try to get user location, fallback to Rome if fails
    late final ({double latitude, double longitude}) position;
    try {
      position = await ref.read(locationServiceProvider).getCurrentPosition();
    } catch (_) {
      const initialLat = 41.9028; // Rome default
      const initialLon = 12.4964;
      position = (latitude: initialLat, longitude: initialLon);
    }

    try {
      // Load nearby repeaters
      final nearbyRepeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
        ).future,
      );

      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: nearbyRepeaters,
        profile: profile,
      );
    } on LocationException catch (error) {
      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: [],
        locationError: error.type,
        profile: profile,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    final countFavorites = await ref.read(getTotalFavoritesCountProvider.future);
    final countRepeaters = await ref.read(getTotalRepeatersCountProvider.future);
    state = await AsyncValue.guard(() => _loadInitialData(countFavorites ?? 0, countRepeaters));
  }
}
