import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_sort_order.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_feedback_stats_from_ids/get_repeaters_feedback_stats_from_ids_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_list_controller.g.dart';

@Riverpod(keepAlive: true)
class RepeatersListController extends _$RepeatersListController {
  @override
  FutureOr<RepeatersListState> build() async {
    return _loadInitialRepeaters();
  }

  /// Reload the nearby list with the given [modes].
  Future<void> loadWithModes(Set<AccessMode> modes) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadInitialRepeaters(
        selectedModes: modes.isEmpty ? [] : modes.toList(),
      ),
    );
  }

  /// Re-sort the current repeater list without re-fetching.
  void setSortOrder(RepeatersSortOrder order) {
    final currentState = state.value;
    if (currentState == null || currentState.sortOrder == order) return;

    final sorted = _sortRepeaters(
      currentState.repeaters,
      currentState.feedbackStats,
      order,
    );
    state = AsyncData(
      currentState.copyWith(repeaters: sorted, sortOrder: order),
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

    final position = await ref.read(cachedUserPositionProvider.future);

    try {
      // Use a reasonable default bounds around user location
      final lat = position.latitude;
      final lon = position.longitude;
      final sortOrder = currentState?.sortOrder ?? RepeatersSortOrder.distance;

      final repeaters = await _fetchRepeatersFromRadius(
        latitude: lat,
        longitude: lon,
        accessModes: modesToFilter?.isEmpty ?? true ? null : modesToFilter,
      );

      final stats = await _fetchFeedbackStats(repeaters);
      final sorted = _sortRepeaters(repeaters, stats, sortOrder);

      return RepeatersListState(
        repeaters: sorted,
        feedbackStats: stats,
        selectedModes: modesToFilter?.toSet() ?? {},
        sortOrder: sortOrder,
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
    return ref.read(
      getRepeatersNearbyProvider(
        latitude: latitude,
        longitude: longitude,
        accessModes: accessModes?.isEmpty ?? true ? null : accessModes,
        radiusKm: 100,
      ).future,
    );
  }

  /// Fetch feedback stats for all repeaters in a single batch query.
  Future<Map<String, RepeaterFeedbackStats>> _fetchFeedbackStats(
    List<Repeater> repeaters,
  ) async {
    final ids = repeaters.map((r) => r.id).toList();
    return ref.read(getRepeatersFeedbackStatsFromIdsProvider(ids).future);
  }

  /// Sort repeaters according to the given [order].
  List<Repeater> _sortRepeaters(
    List<Repeater> repeaters,
    Map<String, RepeaterFeedbackStats> stats,
    RepeatersSortOrder order,
  ) {
    final sorted = List<Repeater>.of(repeaters);
    switch (order) {
      case RepeatersSortOrder.distance:
        sorted.sort((a, b) {
          final da = a.distanceMeters ?? double.infinity;
          final db = b.distanceMeters ?? double.infinity;
          return da.compareTo(db);
        });
      case RepeatersSortOrder.likes:
        sorted.sort((a, b) {
          final la = stats[a.id]?.likesTotal ?? 0;
          final lb = stats[b.id]?.likesTotal ?? 0;
          return lb.compareTo(la); // descending
        });
      case RepeatersSortOrder.frequency:
        sorted.sort((a, b) => a.frequencyHz.compareTo(b.frequencyHz));
    }
    return sorted;
  }
}
