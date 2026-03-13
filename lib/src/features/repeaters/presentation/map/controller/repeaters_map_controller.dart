import 'package:hamqrg/src/features/pota/data/repository/pota_repository.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_in_bounds/get_repeaters_in_bounds_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_map_controller.g.dart';

@riverpod
class RepeatersMapController extends _$RepeatersMapController {
  @override
  FutureOr<RepeatersMapState> build() async {
    return _initalLoad();
  }

  Future<void> toggleModeFilter({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    required AccessMode mode,
  }) async {
    final currentState = state.value;
    if (currentState == null) {
      return;
    }

    final newSelectedModes = Set<AccessMode>.from(currentState.selectedModes);
    if (newSelectedModes.contains(mode)) {
      newSelectedModes.remove(mode);
    } else {
      newSelectedModes.add(mode);
    }

    // Reload with current bounds if we have them, otherwise reload initial state
    if (currentState.latitude != null && currentState.longitude != null) {
      await loadRepeatersFromBounds(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      );
    } else {
      // Fallback to initial load
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => _initalLoad(
          selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
        ),
      );
    }
  }

  void selectRepeater(Repeater? repeater) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(
      currentState.copyWith(selectedRepeater: repeater),
    );
  }

  void clearSelectedRepeater() {
    selectRepeater(null);
  }

  /// Clear all selected mode filters and reload repeaters
  Future<void> clearAllModes({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) async {
    final currentState = state.value;
    if (currentState == null || currentState.selectedModes.isEmpty) {
      return;
    }

    await loadRepeatersFromBounds(
      lat1: lat1,
      lon1: lon1,
      lat2: lat2,
      lon2: lon2,
      selectedModes: [], // Clear all modes - pass empty list
    );
  }

  /// Load repeaters based on map bounds (lat1, lon1, lat2, lon2)
  Future<void> loadRepeatersFromBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<AccessMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    try {
      final repeaters = await _fetchRepeatersFromBounds(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        accessModes: modesToFilter,
      );

      state = AsyncData(
        RepeatersMapState(
          repeaters: repeaters,
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
          selectedRepeater: currentState?.selectedRepeater,
        ),
      );
    } on LocationException catch (error) {
      state = AsyncData(
        RepeatersMapState(
          locationError: error.type,
          repeaters: currentState?.repeaters ?? const [],
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
          selectedRepeater: currentState?.selectedRepeater,
        ),
      );
    } catch (_) {
      state = AsyncData(
        (currentState ?? const RepeatersMapState()).copyWith(
          hasLoadError: true,
        ),
      );
    }
  }

  /// Load initial repeaters, trying to get user location first
  Future<RepeatersMapState> _initalLoad({
    List<AccessMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    final position = await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    try {
      return RepeatersMapState(
        repeaters: [],
        latitude: position.latitude,
        longitude: position.longitude,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    }
  }

  /// Refreshes the cached user position and updates the state.
  Future<({double latitude, double longitude})> refreshUserPosition() async {
    final position = await ref.refresh(cachedUserPositionProvider.future);
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncData(
        currentState.copyWith(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    }
    return position;
  }

  /// Toggle POTA spots visibility on the map
  void togglePotaSpots() {
    final currentState = state.value;
    if (currentState == null) return;

    final newShow = !currentState.showPotaSpots;
    state = AsyncData(currentState.copyWith(showPotaSpots: newShow));

    if (newShow && currentState.potaSpots.isEmpty) {
      loadPotaSpots();
    }
  }

  /// Load POTA spots and their park coordinates for the map
  Future<void> loadPotaSpots() async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final spots = await ref.read(getPotaSpotsProvider.future);
      final repository = ref.read(potaRepositoryProvider);
      final parks = await repository.getParksForSpots(spots);

      state = AsyncData(
        currentState.copyWith(
          potaSpots: spots,
          potaParkCache: parks,
        ),
      );
    } catch (_) {
      // Silently fail — POTA is secondary to repeaters
    }
  }

  Future<List<Repeater>> _fetchRepeatersFromBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<AccessMode>? accessModes,
  }) async {
    return await ref.read(
      getRepeatersInBoundsProvider(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        accessModes: accessModes?.isEmpty ?? true ? null : accessModes,
      ).future,
    );
  }
}
