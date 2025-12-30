import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'repeater_detail_state.freezed.dart';

@freezed
abstract class RepeaterDetailState with _$RepeaterDetailState {
  const factory RepeaterDetailState({
    required Repeater repeater,
    RepeaterFeedbackStats? feedbackStats,
    RepeaterFeedback? myFeedback,
    @Default([]) List<RepeaterFeedback> communityFeedbacks,
    @Default(false) bool isLoadingFeedback,
    @Default(false) bool isSubmittingFeedback,
    StationKind? selectedStation,
    String? locationText,
    @Default('') String comment,
  }) = _RepeaterDetailState;
}

