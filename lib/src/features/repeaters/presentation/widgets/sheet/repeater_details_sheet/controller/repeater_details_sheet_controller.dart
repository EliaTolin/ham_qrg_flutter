import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/controller/state/repeater_details_sheet_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedback_stats/get_repeater_feedback_stats_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeater_details_sheet_controller.g.dart';

@riverpod
class RepeaterDetailsSheetController extends _$RepeaterDetailsSheetController {
  @override
  FutureOr<RepeaterDetailsSheetState> build(String repeaterId) async {
    return _loadData(repeaterId);
  }

  Future<RepeaterDetailsSheetState> _loadData(String repeaterId) async {
    // Fetch repeater data
    final repeater = await ref.read(getRepeaterByIdProvider(repeaterId).future);

    if (repeater == null) {
      throw Exception('Repeater not found');
    }

    // Fetch feedback stats
    final feedbackStats = await ref.read(
      getRepeaterFeedbackStatsProvider(repeaterId).future,
    );

    // Check if repeater is in favorites
    final favoritesState = await ref.read(favoriteRepeatersProvider.future);
    final isFavorite = favoritesState.ids.contains(repeaterId);
    double? distance;
    if (repeater.distanceMeters == null &&
        (repeater.latitude != null && repeater.longitude != null)) {
      final locationService = ref.read(locationServiceProvider);
      final position = await locationService.getCurrentPositionOrDefault();
      distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        repeater.latitude!,
        repeater.longitude!,
      );
      log('Distance1: $distance');
    } else {
      distance = repeater.distanceMeters;
      log('Distance2: $distance');
    }

    return RepeaterDetailsSheetState(
      repeater: repeater,
      feedbackStats: feedbackStats,
      isFavorite: isFavorite,
      distanceInMeters: distance,
    );
  }

  /// Toggle favorite status for the repeater
  Future<void> toggleFavorite() async {
    final currentState = state.value;
    if (currentState == null) return;

    // Set loading state
    state = AsyncData(currentState.copyWith(isTogglingFavorite: true));

    try {
      final favoritesNotifier = ref.read(favoriteRepeatersProvider.notifier);

      if (currentState.isFavorite) {
        await favoritesNotifier.remove(currentState.repeater.id);
      } else {
        await favoritesNotifier.add(currentState.repeater.id);
      }

      // Update local state
      state = AsyncData(
        currentState.copyWith(
          isFavorite: !currentState.isFavorite,
          isTogglingFavorite: false,
        ),
      );
    } catch (e) {
      // Revert loading state on error
      state = AsyncData(currentState.copyWith(isTogglingFavorite: false));
      rethrow;
    }
  }

  /// Refresh all data
  Future<void> refresh() async {
    final currentState = state.value;
    if (currentState == null) return;

    ref
      ..invalidate(getRepeaterByIdProvider(currentState.repeater.id))
      ..invalidate(getRepeaterFeedbackStatsProvider(currentState.repeater.id));

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadData(currentState.repeater.id),
    );
  }
}
