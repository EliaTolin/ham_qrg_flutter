import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'repeater_details_sheet_state.freezed.dart';

@freezed
abstract class RepeaterDetailsSheetState with _$RepeaterDetailsSheetState {
  const factory RepeaterDetailsSheetState({
    /// The repeater data
    required Repeater repeater,

    /// Feedback statistics for the repeater
    RepeaterFeedbackStats? feedbackStats,

    /// Whether the repeater is in the user's favorites
    @Default(false) bool isFavorite,

    /// Whether a favorite action is in progress
    @Default(false) bool isTogglingFavorite,

    /// Distance from repeater
    double? distanceInMeters,
  }) = _RepeaterDetailsSheetState;
}
