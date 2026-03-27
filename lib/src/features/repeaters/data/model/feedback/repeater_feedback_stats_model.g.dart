// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_feedback_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepeaterFeedbackStatsModel _$RepeaterFeedbackStatsModelFromJson(
        Map<String, dynamic> json) =>
    _RepeaterFeedbackStatsModel(
      repeaterId: json['repeater_id'] as String,
      likesTotal: (json['likes_total'] as num).toInt(),
      downTotal: (json['down_total'] as num).toInt(),
      hasMyLike: json['has_my_like'] as bool? ?? false,
      lastLikeAt: json['last_like_at'] as String?,
      lastDownAt: json['last_down_at'] as String?,
    );

Map<String, dynamic> _$RepeaterFeedbackStatsModelToJson(
        _RepeaterFeedbackStatsModel instance) =>
    <String, dynamic>{
      'repeater_id': instance.repeaterId,
      'likes_total': instance.likesTotal,
      'down_total': instance.downTotal,
      'has_my_like': instance.hasMyLike,
      'last_like_at': instance.lastLikeAt,
      'last_down_at': instance.lastDownAt,
    };
