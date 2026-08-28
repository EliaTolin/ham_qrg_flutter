import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/data/repository/sota_repository.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_filters.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_sort_order.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_state.dart';
import 'package:hamqrg/src/features/sota/presentation/widgets/sota_mode_badge.dart'
    show normalizeSotaMode;
import 'package:hamqrg/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sota_spots_controller.g.dart';

@Riverpod(keepAlive: true)
class SotaSpotsController extends _$SotaSpotsController {
  /// Cadence of the automatic refresh, mirrored by the UI label so the
  /// operator knows the list updates on its own.
  static const autoRefreshInterval = Duration(seconds: 60);

  Timer? _refreshTimer;
  DateTime? _nextRefreshAt;

  @override
  FutureOr<SotaSpotsState> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    final spots = await ref.read(getSotaSpotsProvider.future);
    _startAutoRefresh();
    final distances = await _loadDistances(spots);
    return SotaSpotsState(
      lastUpdatedAt: DateTime.now(),
      nextRefreshAt: _nextRefreshAt,
      spots: spots,
      filteredSpots: spots,
      availableBands: _extractBands(spots),
      availableModes: _extractModes(spots),
      availableAssociations: _extractAssociations(spots),
      distanceBySummitCode: distances,
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
        (currentState ?? const SotaSpotsState()).copyWith(isRefreshing: true),
      );
      ref.invalidate(getSotaSpotsProvider);
      final spots = await ref.read(getSotaSpotsProvider.future);
      final distances = await _loadDistances(spots);
      _startAutoRefresh();
      final base = (currentState ?? const SotaSpotsState()).copyWith(
        spots: spots,
        availableBands: _extractBands(spots),
        availableModes: _extractModes(spots),
        availableAssociations: _extractAssociations(spots),
        distanceBySummitCode: distances,
        isRefreshing: false,
        hasLoadError: false,
        lastUpdatedAt: DateTime.now(),
        nextRefreshAt: _nextRefreshAt,
      );
      state = AsyncData(
        base.copyWith(filteredSpots: _applyFiltersAndSort(base)),
      );
    } catch (e, st) {
      log('SOTA refresh failed: $e\n$st');
      _startAutoRefresh();
      state = AsyncData(
        (currentState ?? const SotaSpotsState()).copyWith(
          hasLoadError: true,
          isRefreshing: false,
          nextRefreshAt: _nextRefreshAt,
        ),
      );
    }
  }

  void filterByBand(String? band) =>
      _updateAndApply((s) => s.copyWith(selectedBand: band));

  void filterByMode(String? mode) =>
      _updateAndApply((s) => s.copyWith(selectedMode: mode));

  void filterByMinPoints(int? minPoints) =>
      _updateAndApply((s) => s.copyWith(minPoints: minPoints));

  void filterByAssociation(String? association) =>
      _updateAndApply((s) => s.copyWith(selectedAssociation: association));

  void clearFilters() => _updateAndApply(
        (s) => s.copyWith(
          selectedBand: null,
          selectedMode: null,
          minPoints: null,
          selectedAssociation: null,
        ),
      );

  Future<void> setSortOrder(SotaSpotsSortOrder order) async {
    final currentState = state.value;
    if (currentState == null) return;

    // Lazy load distances the first time the user enables distance sort.
    if (order == SotaSpotsSortOrder.distance &&
        currentState.distanceBySummitCode.isEmpty &&
        currentState.spots.isNotEmpty) {
      state = AsyncData(currentState.copyWith(isRefreshing: true));
      final distances = await _loadDistances(currentState.spots);
      final updated = (state.value ?? currentState).copyWith(
        sortOrder: order,
        distanceBySummitCode: distances,
        isRefreshing: false,
      );
      state = AsyncData(
        updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
      );
      return;
    }

    _updateAndApply((s) => s.copyWith(sortOrder: order));
  }

  void _updateAndApply(SotaSpotsState Function(SotaSpotsState) update) {
    final currentState = state.value;
    if (currentState == null) return;
    final updated = update(currentState);
    state = AsyncData(
      updated.copyWith(filteredSpots: _applyFiltersAndSort(updated)),
    );
  }

  List<SotaSpot> _applyFiltersAndSort(SotaSpotsState s) {
    final results = filterSotaSpots(
      s.spots,
      band: s.selectedBand,
      mode: s.selectedMode,
      minPoints: s.minPoints,
      association: s.selectedAssociation,
    );

    switch (s.sortOrder) {
      case SotaSpotsSortOrder.time:
        results.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      case SotaSpotsSortOrder.distance:
        results.sort((a, b) {
          final distA = s.distanceBySummitCode[a.summitCode];
          final distB = s.distanceBySummitCode[b.summitCode];
          if (distA == null && distB == null) return 0;
          if (distA == null) return 1;
          if (distB == null) return -1;
          return distA.compareTo(distB);
        });
    }

    return results;
  }

  Future<Map<String, double>> _loadDistances(List<SotaSpot> spots) async {
    try {
      final position =
          await ref.read(locationServiceProvider).getCurrentPositionOrDefault();
      final repository = ref.read(sotaRepositoryProvider);
      final summits = await repository.getSummitsForSpots(spots);

      final distances = <String, double>{};
      for (final entry in summits.entries) {
        final s = entry.value;
        final meters = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          s.latitude,
          s.longitude,
        );
        distances[entry.key] = meters / 1000;
      }
      return distances;
    } catch (e, st) {
      log('Failed to load SOTA summit distances: $e\n$st');
      return const {};
    }
  }

  List<String> _extractBands(List<SotaSpot> spots) {
    final bands = <String>{};
    for (final spot in spots) {
      final band = bandFromFrequencyMhz(spot.frequencyMhz);
      if (band != null) bands.add(band);
    }
    const order = [
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

  List<String> _extractModes(List<SotaSpot> spots) {
    final modes = <String>{};
    for (final spot in spots) {
      final mode = normalizeSotaMode(spot.mode);
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

  List<String> _extractAssociations(List<SotaSpot> spots) {
    final assocs = spots
        .map((s) => associationFromSummitCode(s.summitCode))
        .where((c) => c.isNotEmpty)
        .toSet()
        .toList()
      ..sort();
    return assocs;
  }
}
