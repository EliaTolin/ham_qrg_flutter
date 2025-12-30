// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    _FeedbackModel(
      id: json['id'] as String,
      repeaterId: json['repeater_id'] as String,
      userId: json['user_id'] as String,
      type: json['type'] as String,
      station: json['station'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      comment: json['comment'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$FeedbackModelToJson(_FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeater_id': instance.repeaterId,
      'user_id': instance.userId,
      'type': instance.type,
      'station': instance.station,
      'lat': instance.lat,
      'lon': instance.lon,
      'comment': instance.comment,
      'created_at': instance.createdAt,
    };

