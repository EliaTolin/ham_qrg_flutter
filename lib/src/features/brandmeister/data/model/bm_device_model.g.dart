// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bm_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BmDeviceModel _$BmDeviceModelFromJson(Map<String, dynamic> json) =>
    _BmDeviceModel(
      id: (json['id'] as num).toInt(),
      callsign: json['callsign'] as String?,
      hardware: json['hardware'] as String?,
      firmware: json['firmware'] as String?,
      tx: json['tx'] as String?,
      rx: json['rx'] as String?,
      colorCode: (json['colorcode'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      city: json['city'] as String?,
      website: json['website'] as String?,
      pep: (json['pep'] as num?)?.toInt(),
      agl: (json['agl'] as num?)?.toInt(),
      description: json['description'] as String?,
      lastSeen: json['last_seen'] as String?,
    );

Map<String, dynamic> _$BmDeviceModelToJson(_BmDeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'callsign': instance.callsign,
      'hardware': instance.hardware,
      'firmware': instance.firmware,
      'tx': instance.tx,
      'rx': instance.rx,
      'colorcode': instance.colorCode,
      'status': instance.status,
      'lat': instance.lat,
      'lng': instance.lng,
      'city': instance.city,
      'website': instance.website,
      'pep': instance.pep,
      'agl': instance.agl,
      'description': instance.description,
      'last_seen': instance.lastSeen,
    };
