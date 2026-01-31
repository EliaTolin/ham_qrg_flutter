// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParamModel _$ParamModelFromJson(Map<String, dynamic> json) => _ParamModel(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ParamModelToJson(_ParamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'key': instance.key,
      'value': instance.value,
    };
