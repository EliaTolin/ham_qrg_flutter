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

    state = await AsyncValue.guard(() async {
      try {
        final repeaters = await _fetchRepeatersFromBounds(
          lat1: lat1,
          lon1: lon1,
          lat2: lat2,
          lon2: lon2,
          accessModes: modesToFilter,
        );

        return RepeatersMapState(
          repeaters: repeaters,
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
          selectedRepeater: currentState?.selectedRepeater,
        );
      } on LocationException catch (error) {
        return RepeatersMapState(
          locationError: error.type,
          repeaters: currentState?.repeaters ?? const [],
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
          selectedRepeater: currentState?.selectedRepeater,
        );
      }
    });
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
