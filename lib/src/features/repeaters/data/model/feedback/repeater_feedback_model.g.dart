// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepeaterFeedbackModel _$RepeaterFeedbackModelFromJson(
        Map<String, dynamic> json) =>
    _RepeaterFeedbackModel(
      id: json['id'] as String,
      repeater:
          RepeaterModel.fromJson(json['repeater'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
      type: json['type'] as String,
      station: json['station'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      comment: json['comment'] as String,
      repeaterAccess: RepeaterAccessModel.fromJson(
          json['repeater_access'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      profile: json['profile'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RepeaterFeedbackModelToJson(
        _RepeaterFeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeater': instance.repeater,
      'user_id': instance.userId,
      'type': instance.type,
      'station': instance.station,
      'lat': instance.lat,
      'lon': instance.lon,
      'comment': instance.comment,
      'repeater_access': instance.repeaterAccess,
      'created_at': instance.createdAt,
      'profile': instance.profile,
    };
