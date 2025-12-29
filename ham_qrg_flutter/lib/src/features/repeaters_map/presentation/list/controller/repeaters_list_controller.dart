import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_list_controller.g.dart';

@riverpod
class RepeatersListController extends _$RepeatersListController {
  @override
  FutureOr<RepeatersListState> build() async {
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

    // Reload with current location if available
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadInitialRepeaters(
        selectedModes: newSelectedModes.isEmpty ? null : newSelectedModes.toList(),
      ),
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
}
