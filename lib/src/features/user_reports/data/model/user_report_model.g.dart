// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserReportModel _$UserReportModelFromJson(Map<String, dynamic> json) =>
    _UserReportModel(
      id: json['id'] as String,
      repeaterId: json['repeater_id'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      repeater: json['repeater'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UserReportModelToJson(_UserReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeater_id': instance.repeaterId,
      'description': instance.description,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'repeater': instance.repeater,
    };
