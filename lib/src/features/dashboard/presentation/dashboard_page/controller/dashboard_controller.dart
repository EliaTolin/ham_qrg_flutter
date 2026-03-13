import 'dart:developer';

import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/state/dashboard_state.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    final favoritesState = await ref.watch(favoriteRepeatersProvider.future);
    log('countFavorites: ${favoritesState.count}');
    final countRepeaters = await ref.watch(getTotalRepeatersCountProvider.future);

    return _loadInitialData(favoritesState.count, countRepeaters);
  }

  Future<DashboardState> _loadInitialData(int countFavorites, int countRepeaters) async {
    // Load statistics
    final profile = await ref.read(getProfileProvider.future);
    final position =
        await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    // Load POTA spots (non-blocking)
    final potaFuture = ref.read(getPotaSpotsProvider.future).then(
          (spots) => (spots: spots, error: false),
          onError: (_) => (spots: <PotaSpot>[], error: true),
        );

    try {
      // Load nearby repeaters
      final nearbyRepeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
        ).future,
      );

      final potaResult = await potaFuture;

      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: nearbyRepeaters,
        profile: profile,
        potaSpots: potaResult.spots,
        hasPotaError: potaResult.error,
      );
    } on LocationException catch (error) {
      final potaResult = await potaFuture;

      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: [],
        locationError: error.type,
        profile: profile,
        potaSpots: potaResult.spots,
        hasPotaError: potaResult.error,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    ref.invalidate(favoriteRepeatersProvider);
    final favoritesState = await ref.read(favoriteRepeatersProvider.future);
    final countRepeaters = await ref.read(getTotalRepeatersCountProvider.future);
    state = await AsyncValue.guard(() => _loadInitialData(favoritesState.count, countRepeaters));
  }
}
