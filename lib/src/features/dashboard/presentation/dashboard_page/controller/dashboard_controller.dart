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
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    // Read all providers BEFORE any await to avoid using Ref after
    // the provider may have been disposed across async gaps.
    final favoritesFuture = ref.watch(favoriteRepeatersProvider.future);
    final countRepeatersFuture = ref.watch(getTotalRepeatersCountProvider.future);
    final favoritesState = await favoritesFuture;
    log('countFavorites: ${favoritesState.count}');
    final countRepeaters = await countRepeatersFuture;

    return _loadInitialData(favoritesState.count, countRepeaters);
  }

  Future<DashboardState> _loadInitialData(
    int countFavorites,
    int countRepeaters,
  ) async {
    // Load statistics
    final profile = await ref.read(getProfileProvider.future);
    final position = await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    // Load POTA + SOTA spots in parallel (non-blocking).
    final potaFuture = ref.read(getPotaSpotsProvider.future).then(
      (spots) => (spots: spots, error: false),
      onError: (e) {
        log('POTA spots error: $e');
        return (spots: <PotaSpot>[], error: true);
      },
    );
    final sotaFuture = ref.read(getSotaSpotsProvider.future).then(
      (spots) => (spots: spots, error: false),
      onError: (e) {
        log('SOTA spots error: $e');
        return (spots: <SotaSpot>[], error: true);
      },
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
      final sotaResult = await sotaFuture;

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
        sotaSpots: sotaResult.spots,
        hasSotaError: sotaResult.error,
      );
    } on LocationException catch (error) {
      final potaResult = await potaFuture;
      final sotaResult = await sotaFuture;

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
        sotaSpots: sotaResult.spots,
        hasSotaError: sotaResult.error,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    ref
      ..invalidate(favoriteRepeatersProvider)
      ..invalidate(getPotaSpotsProvider)
      ..invalidate(getSotaSpotsProvider);
    final favoritesState = await ref.read(favoriteRepeatersProvider.future);
    final countRepeaters = await ref.read(getTotalRepeatersCountProvider.future);
    state = await AsyncValue.guard(
      () => _loadInitialData(favoritesState.count, countRepeaters),
    );
  }

  Future<void> refreshPota() async {
    final currentState = state.value;
    if (currentState == null) return;
    ref.invalidate(getPotaSpotsProvider);
    try {
      final spots = await ref.read(getPotaSpotsProvider.future);
      state = AsyncData(
        currentState.copyWith(potaSpots: spots, hasPotaError: false),
      );
    } catch (e) {
      log('POTA spots refresh error: $e');
      state = AsyncData(currentState.copyWith(hasPotaError: true));
    }
  }

  Future<void> refreshSota() async {
    final currentState = state.value;
    if (currentState == null) return;
    ref.invalidate(getSotaSpotsProvider);
    try {
      final spots = await ref.read(getSotaSpotsProvider.future);
      state = AsyncData(
        currentState.copyWith(sotaSpots: spots, hasSotaError: false),
      );
    } catch (e) {
      log('SOTA spots refresh error: $e');
      state = AsyncData(currentState.copyWith(hasSotaError: true));
    }
  }
}
