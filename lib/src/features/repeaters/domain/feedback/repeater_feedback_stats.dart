import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_feedback_stats.freezed.dart';

@freezed
abstract class RepeaterFeedbackStats with _$RepeaterFeedbackStats {
  const factory RepeaterFeedbackStats({
    required String repeaterId,
    required int likesTotal,
    required int downTotal,
    DateTime? lastLikeAt,
    DateTime? lastDownAt,
  }) = _RepeaterFeedbackStats;
}
