import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_stats_model.freezed.dart';
part 'feedback_stats_model.g.dart';

@freezed
abstract class FeedbackStatsModel with _$FeedbackStatsModel {
  const factory FeedbackStatsModel({
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'likes_total') required int likesTotal,
    @JsonKey(name: 'down_total') required int downTotal,
    @JsonKey(name: 'last_like_at') String? lastLikeAt,
    @JsonKey(name: 'last_down_at') String? lastDownAt,
  }) = _FeedbackStatsModel;

  factory FeedbackStatsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackStatsModelFromJson(json);
}

