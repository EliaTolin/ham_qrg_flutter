import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_list_controller.g.dart';

@riverpod
class RepeatersListController extends _$RepeatersListController {
  @override
  FutureOr<RepeatersListState> build() async {
    return _loadInitialRepeaters();
  }

  Future<void> toggleModeFilter(AccessMode mode) async {
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

    // Reload with current location if available
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadInitialRepeaters(
        selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      ),
    );
  }

  /// Clear all mode filters and reload
  Future<void> clearAllModeFilters() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadInitialRepeaters(selectedModes: []),
    );
  }

  /// Reload repeaters with current filters
  Future<void> reload() async {
    final currentState = state.value;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadInitialRepeaters(
        selectedModes: currentState?.selectedModes.isEmpty ?? true
            ? null
            : currentState!.selectedModes.toList(),
      ),
    );
  }

  /// Load initial repeaters, trying to get user location first
  Future<RepeatersListState> _loadInitialRepeaters({
    List<AccessMode>? selectedModes,
  }) async {
    final currentState = state.value;
    final modesToFilter = selectedModes ?? currentState?.selectedModes.toList();

    final position = await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    try {
      // Use a reasonable default bounds around user location
      final lat = position.latitude;
      final lon = position.longitude;

      final repeaters = await _fetchRepeatersFromRadius(
        latitude: lat,
        longitude: lon,
        accessModes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
      );

      return RepeatersListState(
        repeaters: repeaters,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    } on LocationException catch (error) {
      return RepeatersListState(
        locationError: error.type,
        selectedModes: modesToFilter?.toSet() ?? {},
      );
    }
  }

  Future<List<Repeater>> _fetchRepeatersFromRadius({
    required double latitude,
    required double longitude,
    List<AccessMode>? accessModes,
  }) async {
    return await ref.read(
      getRepeatersNearbyProvider(
        latitude: latitude,
        longitude: longitude,
        accessModes: accessModes?.isEmpty ?? true ? null : accessModes,
        radiusKm: 100,
      ).future,
    );
  }
}
