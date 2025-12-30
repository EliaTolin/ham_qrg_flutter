// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackStatsModel _$FeedbackStatsModelFromJson(Map<String, dynamic> json) =>
    _FeedbackStatsModel(
      repeaterId: json['repeater_id'] as String,
      likesTotal: (json['likes_total'] as num).toInt(),
      downTotal: (json['down_total'] as num).toInt(),
      lastLikeAt: json['last_like_at'] as String?,
      lastDownAt: json['last_down_at'] as String?,
    );

Map<String, dynamic> _$FeedbackStatsModelToJson(_FeedbackStatsModel instance) =>
    <String, dynamic>{
      'repeater_id': instance.repeaterId,
      'likes_total': instance.likesTotal,
      'down_total': instance.downTotal,
      'last_like_at': instance.lastLikeAt,
      'last_down_at': instance.lastDownAt,
    };

