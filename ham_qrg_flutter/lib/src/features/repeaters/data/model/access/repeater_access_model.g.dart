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
      source: json['source'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      networkId: json['network_id'] as String?,
      network: json['network'] == null
          ? null
          : NetworkModel.fromJson(json['network'] as Map<String, dynamic>),
      ctcssTxHz: (json['ctcss_tx_hz'] as num?)?.toDouble(),
      ctcssRxHz: (json['ctcss_rx_hz'] as num?)?.toDouble(),
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
      'source': instance.source,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'network_id': instance.networkId,
      'network': instance.network,
      'ctcss_tx_hz': instance.ctcssTxHz,
      'ctcss_rx_hz': instance.ctcssRxHz,
      'dcs_code': instance.dcsCode,
      'color_code': instance.colorCode,
      'dmr_id': instance.dmrId,
      'dg_id': instance.dgId,
      'notes': instance.notes,
    };
