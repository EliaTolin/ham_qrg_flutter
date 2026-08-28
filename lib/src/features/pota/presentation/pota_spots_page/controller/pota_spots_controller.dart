import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/data/repository/pota_repository.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_filters.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_sort_order.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_state.dart';
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart'
    show normalizePotaMode;
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_spots_controller.g.dart';

@Riverpod(keepAlive: true)
class PotaSpotsController extends _$PotaSpotsController {
  /// Cadence of the automatic refresh, mirrored by the UI label so the
  /// operator knows the list updates on its own.
  static const autoRefreshInterval = Duration(seconds: 60);

  Timer? _refreshTimer;
  DateTime? _nextRefreshAt;

  @override
  FutureOr<PotaSpotsState> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    final spots = await ref.read(getPotaSpotsProvider.future);
    _startAutoRefresh();

    final availableBands = _extractBands(spots);
    final availableModes = _extractModes(spots);

    // Load parks and distances
    final repository = ref.read(potaRepositoryProvider);
    final parks = await repository.getParksForSpots(spots);
    final distances = await _computeDistances(parks);

    return PotaSpotsState(
      lastUpdatedAt: DateTime.now(),
      nextRefreshAt: _nextRefreshAt,
      spots: spots,
      filteredSpots: spots,
      availableBands: availableBands,
      availableModes: availableModes,
      distanceByReference: distances,
      parkCache: parks,
    );
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _nextRefreshAt = DateTime.now().add(autoRefreshInterval);
    _refreshTimer = Timer.periodic(autoRefreshInterval, (_) => refresh());
  }

  Future<void> refresh() async {
    final currentState = state.value;
    try {
      state = AsyncData(
        (currentState ?? const PotaSpotsState()).copyWith(isRefreshing: true),
      );
      ref.invalidate(getPotaSpotsProvider);
      final spots = await ref.read(getPotaSpotsProvider.future);
      final repository = ref.read(potaRepositoryProvider);
      final parks = await repository.getParksForSpots(spots);
      final distances = await _computeDistances(parks);
      _startAutoRefresh();
      final newState = (currentState ?? const PotaSpotsState()).copyWith(
        spots: spots,
        availableBands: _extractBands(spots),
        availableModes: _extractModes(spots),
        distanceByReference: distances,
        parkCache: parks,
        isRefreshing: false,
        hasLoadError: false,
        lastUpdatedAt: DateTime.now(),
        nextRefreshAt: _nextRefreshAt,
      );
      state = AsyncData(
        newState.copyWith(filteredSpots: _applyFiltersAndSort(newState)),
      );
    } catch (_) {
      _startAutoRefresh();
      state = AsyncData(
        (currentState ?? const PotaSpotsState()).copyWith(
          hasLoadError: true,
          isRefreshing: false,
          nextRefreshAt: _nextRefreshAt,
        ),
      );
    }
  }

  void search(String query) {
    final currentState = state.value;
    if (currentState == null) return;
    final updated = currentState.copyWith(searchQuery: query);
    state = AsyncData(
      updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
    );
  }

  void filterByBand(String? band) {
    final currentState = state.value;
    if (currentState == null) return;
    final updated = currentState.copyWith(selectedBand: band);
    state = AsyncData(
      updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
    );
  }

  void filterByMode(String? mode) {
    final currentState = state.value;
    if (currentState == null) return;
    final updated = currentState.copyWith(selectedMode: mode);
    state = AsyncData(
      updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
    );
  }

  void setSortOrder(PotaSpotsSortOrder order) {
    final currentState = state.value;
    if (currentState == null) return;
    final updated = currentState.copyWith(sortOrder: order);
    state = AsyncData(
      updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
    );
  }

  List<PotaSpot> _applyFiltersAndSort(PotaSpotsState s) {
    final results = filterPotaSpots(
      s.spots,
      searchQuery: s.searchQuery,
      band: s.selectedBand,
      mode: s.selectedMode,
    );

    switch (s.sortOrder) {
      case PotaSpotsSortOrder.time:
        results.sort((a, b) => b.spotTime.compareTo(a.spotTime));
      case PotaSpotsSortOrder.distance:
        results.sort((a, b) {
          final distA = s.distanceByReference[a.reference];
          final distB = s.distanceByReference[b.reference];
          if (distA == null && distB == null) return 0;
          if (distA == null) return 1;
          if (distB == null) return -1;
          return distA.compareTo(distB);
        });
    }

    return results;
  }

  Future<Map<String, double>> _computeDistances(
    Map<String, PotaPark> parks,
  ) async {
    try {
      final position =
          await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

      final distances = <String, double>{};
      for (final entry in parks.entries) {
        final park = entry.value;
        if (park.latitude != null && park.longitude != null) {
          final meters = Geolocator.distanceBetween(
            position.latitude,
            position.longitude,
            park.latitude!,
            park.longitude!,
          );
          distances[entry.key] = meters / 1000; // km
        }
      }
      return distances;
    } catch (e) {
      log('Failed to compute park distances: $e');
      return {};
    }
  }

  List<String> _extractBands(List<PotaSpot> spots) {
    final bands = <String>{};
    for (final spot in spots) {
      final band = bandFromFrequencyKhz(spot.frequency);
      if (band != null) bands.add(band);
    }
    // Sort by wavelength (descending → 160m first)
    final order = [
      '160m',
      '80m',
      '60m',
      '40m',
      '30m',
      '20m',
      '17m',
      '15m',
      '12m',
      '10m',
      '6m',
      '2m',
      '70cm',
    ];
    return bands.toList()
      ..sort((a, b) => order.indexOf(a).compareTo(order.indexOf(b)));
  }

  List<String> _extractModes(List<PotaSpot> spots) {
    final modes = <String>{};
    for (final spot in spots) {
      final mode = normalizePotaMode(spot.mode);
      if (mode == null) continue;
      modes.add(mode);
    }
    const priority = ['CW', 'SSB'];
    return modes.toList()
      ..sort((a, b) {
        final iA = priority.indexOf(a);
        final iB = priority.indexOf(b);
        if (iA != -1 && iB != -1) return iA.compareTo(iB);
        if (iA != -1) return -1;
        if (iB != -1) return 1;
        return a.compareTo(b);
      });
  }
}
