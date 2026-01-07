// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepeaterAccessModel _$RepeaterAccessModelFromJson(Map<String, dynamic> json) =>
    _RepeaterAccessModel(
      id: json['id'] as String,
      repeaterId: json['repeater_id'] as String,
      mode: json['mode'] as String,
      toneScope: json['tone_scope'] as String,
      toneDirection: json['tone_direction'] as String,
      source: json['source'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      networkId: json['network_id'] as String?,
      ctcssHz: (json['ctcss_hz'] as num?)?.toDouble(),
      dcsCode: (json['dcs_code'] as num?)?.toInt(),
      colorCode: (json['color_code'] as num?)?.toInt(),
      dmrId: (json['dmr_id'] as num?)?.toInt(),
      dgId: (json['dg_id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$RepeaterAccessModelToJson(
        _RepeaterAccessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeater_id': instance.repeaterId,
      'mode': instance.mode,
      'tone_scope': instance.toneScope,
      'tone_direction': instance.toneDirection,
      'source': instance.source,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'network_id': instance.networkId,
      'ctcss_hz': instance.ctcssHz,
      'dcs_code': instance.dcsCode,
      'color_code': instance.colorCode,
      'dmr_id': instance.dmrId,
      'dg_id': instance.dgId,
      'notes': instance.notes,
    };
