import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_stats.freezed.dart';

@freezed
abstract class FeedbackStats with _$FeedbackStats {
  const factory FeedbackStats({
    required String repeaterId,
    required int likesTotal,
    required int downTotal,
    DateTime? lastLikeAt,
    DateTime? lastDownAt,
  }) = _FeedbackStats;
}

