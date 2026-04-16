// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_submission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSubmissionModel _$UserSubmissionModelFromJson(Map<String, dynamic> json) =>
    _UserSubmissionModel(
      id: json['id'] as String,
      frequencyHz: (json['frequency_hz'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      name: json['name'] as String?,
      callsign: json['callsign'] as String?,
      coordinatorResponse: json['coordinator_response'] as String?,
      respondedAt: json['responded_at'] as String?,
    );

Map<String, dynamic> _$UserSubmissionModelToJson(
        _UserSubmissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'frequency_hz': instance.frequencyHz,
      'status': instance.status,
      'created_at': instance.createdAt,
      'name': instance.name,
      'callsign': instance.callsign,
      'coordinator_response': instance.coordinatorResponse,
      'responded_at': instance.respondedAt,
    };
