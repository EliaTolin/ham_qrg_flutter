import 'dart:async';
import 'dart:developer';

import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:ham_qrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:ham_qrg/src/features/repeaters/provider/add_repeater_feedback/add_repeater_feedback_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/delete_repeater_feedback/delete_repeater_feedback_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_my_repeater_feedback/get_my_repeater_feedback_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeater_feedback_stats/get_repeater_feedback_stats_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeater_feedbacks/get_repeater_feedbacks_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeater_detail_controller.g.dart';

@riverpod
class RepeaterDetailController extends _$RepeaterDetailController {
  @override
  FutureOr<RepeaterDetailState> build(String repeaterId) async {
    return _loadInitialData(repeaterId);
  }

  Future<RepeaterDetailState> _loadInitialData(String repeaterId) async {
    final repeater = await ref.read(getRepeaterByIdProvider(repeaterId).future);
    if (repeater == null) {
      throw Exception('Repeater not found');
    }

    final feedbackStats = await ref.read(
      getRepeaterFeedbackStatsProvider(repeaterId).future,
    );
    final myFeedback = await ref.read(
      getMyRepeaterFeedbackProvider(repeaterId).future,
    );
    final communityFeedbacks = await ref.read(
      getRepeaterFeedbacksProvider(
        repeaterId: repeaterId,
        limit: 10,
      ).future,
    );

    return RepeaterDetailState(
      repeater: repeater,
      feedbackStats: feedbackStats,
      myFeedback: myFeedback,
      communityFeedbacks: communityFeedbacks,
    );
  }

  void setSelectedStation(StationKind? station) {
    state = AsyncData(
      state.value!.copyWith(selectedStation: station),
    );
  }

  void setLocationText(String? location) {
    state = AsyncData(
      state.value!.copyWith(locationText: location),
    );
  }

  void setComment(String comment) {
    state = AsyncData(
      state.value!.copyWith(comment: comment),
    );
  }

  void toggleAccessMode(AccessMode mode) {
    final currentState = state.value;
    if (currentState == null) return;

    final currentModes = Set<AccessMode>.from(currentState.selectedAccessModes);
    if (currentModes.contains(mode)) {
      currentModes.remove(mode);
    } else {
      currentModes.add(mode);
    }

    state = AsyncData(
      currentState.copyWith(selectedAccessModes: currentModes),
    );
  }

  Future<void> submitFeedback({
    required FeedbackType type,
    required double latitude,
    required double longitude,
  }) async {
    final currentState = state.value;
    if (currentState == null) return;

    if (currentState.selectedStation == null || currentState.locationText == null) {
      return; // Validation error
    }

    state = AsyncData(
      currentState.copyWith(isSubmittingFeedback: true),
    );

    try {
      await ref.read(
        addRepeaterFeedbackProvider(
          repeaterId: currentState.repeater.id,
          type: type,
          station: currentState.selectedStation!,
          latitude: latitude,
          longitude: longitude,
          comment: currentState.comment,
        ).future,
      );

      // Reload data
      final newState = await _loadInitialData(currentState.repeater.id);
      state = AsyncData(newState);
    } catch (e, st) {
      log('Error submitting feedback: $e', stackTrace: st);
      state = AsyncError(e, st);
    } finally {
      if (state.value != null) {
        state = AsyncData(
          state.value!.copyWith(isSubmittingFeedback: false),
        );
      }
    }
  }

  Future<void> deleteMyFeedback() async {
    final currentState = state.value;
    if (currentState?.myFeedback == null) return;

    state = AsyncData(
      currentState!.copyWith(isLoadingFeedback: true),
    );

    try {
      await ref.read(
        deleteRepeaterFeedbackProvider(
          currentState.myFeedback!.id,
        ).future,
      );

      // Reload data
      final newState = await _loadInitialData(currentState.repeater.id);
      state = AsyncData(newState);
    } catch (e, st) {
      log('Error deleting feedback: $e', stackTrace: st);
      state = AsyncError(e, st);
    } finally {
      if (state.value != null) {
        state = AsyncData(
          state.value!.copyWith(isLoadingFeedback: false),
        );
      }
    }
  }
}
