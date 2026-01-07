// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepeaterModel _$RepeaterModelFromJson(Map<String, dynamic> json) =>
    _RepeaterModel(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      frequencyHz: (json['frequency_hz'] as num).toInt(),
      mode: json['mode'] as String,
      callsign: json['callsign'] as String?,
      name: json['name'] as String?,
      manager: json['manager'] as String?,
      shiftHz: (json['shift_hz'] as num?)?.toInt(),
      shiftRaw: json['shift_raw'] as String?,
      region: json['region'] as String?,
      provinceCode: json['province_code'] as String?,
      locality: json['locality'] as String?,
      locator: json['locator'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      distanceM: (json['distance_m'] as num?)?.toDouble(),
      source: json['source'] as String,
      accesses: (json['accesses'] as List<dynamic>?)
              ?.map((e) =>
                  RepeaterAccessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RepeaterModelToJson(_RepeaterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'frequency_hz': instance.frequencyHz,
      'mode': instance.mode,
      'callsign': instance.callsign,
      'name': instance.name,
      'manager': instance.manager,
      'shift_hz': instance.shiftHz,
      'shift_raw': instance.shiftRaw,
      'region': instance.region,
      'province_code': instance.provinceCode,
      'locality': instance.locality,
      'locator': instance.locator,
      'lat': instance.lat,
      'lon': instance.lon,
      'distance_m': instance.distanceM,
      'source': instance.source,
      'accesses': instance.accesses,
    };
