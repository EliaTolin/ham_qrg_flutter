import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_map_controller.g.dart';

@riverpod
class RepeatersMapController extends _$RepeatersMapController {
  @override
  FutureOr<RepeatersMapState> build() async {
    return _loadInitialRepeaters();
  }

  Future<void> toggleModeFilter(RepeaterMode mode) async {
    final currentState = state.value;
    if (currentState == null) {
      return;
    }

    final newSelectedModes = Set<RepeaterMode>.from(currentState.selectedModes);
    if (newSelectedModes.contains(mode)) {
      newSelectedModes.remove(mode);
    } else {
      newSelectedModes.add(mode);
    }

    // Reload with current bounds if we have them, otherwise reload initial state
    if (currentState.latitude != null && currentState.longitude != null) {
      // Use a reasonable default bounds around the current location
      final lat = currentState.latitude;
      final lon = currentState.longitude;
      const boundsSize = 0.1;
      // await loadRepeatersFromBounds(
      //   lat1: lat - boundsSize,
      //   lon1: lon - boundsSize,
      //   lat2: lat + boundsSize,
      //   lon2: lon + boundsSize,
      //   selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      // );
    } else {
      // Fallback to initial load
      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => _loadInitialRepeaters(
          selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
        ),
      );
    }
  }

  /// Load repeaters based on map bounds (lat1, lon1, lat2, lon2)
  Future<void> loadRepeatersFromBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<RepeaterMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    state = await AsyncValue.guard(() async {
      try {
        final repository = ref.read(repeatersRepositoryProvider);
        final repeaters = await repository.getRepeatersInBounds(
          lat1: lat1,
          lon1: lon1,
          lat2: lat2,
          lon2: lon2,
          modes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
        );

        return RepeatersMapState(
          repeaters: repeaters,
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: modesToFilter?.toSet() ?? currentState?.selectedModes ?? {},
        );
      } on LocationException catch (error) {
        return RepeatersMapState(
          locationError: error.type,
          repeaters: currentState?.repeaters ?? const [],
          latitude: currentState?.latitude,
          longitude: currentState?.longitude,
          selectedModes: currentState?.selectedModes ?? (modesToFilter?.toSet() ?? {}),
        );
      }
    });
  }

  /// Load initial repeaters, trying to get user location first
  Future<RepeatersMapState> _loadInitialRepeaters({
    List<RepeaterMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    try {
      final position = await ref.read(locationServiceProvider).getCurrentPosition();

      // Use a reasonable default bounds around user location
      final lat = position.latitude;
      final lon = position.longitude;
      const boundsSize = 0.1; // ~11km radius

      final repository = ref.read(repeatersRepositoryProvider);
      final repeaters = await repository.getRepeatersInBounds(
        lat1: lat - boundsSize,
        lon1: lon - boundsSize,
        lat2: lat + boundsSize,
        lon2: lon + boundsSize,
        modes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
      );

      return RepeatersMapState(
        repeaters: repeaters,
        latitude: lat,
        longitude: lon,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersMapState(
        locationError: error.type,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    }
  }
}
