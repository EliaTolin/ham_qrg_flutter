// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_spot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PotaSpotModel _$PotaSpotModelFromJson(Map<String, dynamic> json) =>
    _PotaSpotModel(
      spotId: (json['spotId'] as num).toInt(),
      spotTime: json['spotTime'] as String,
      activator: json['activator'] as String,
      frequency: json['frequency'] as String,
      mode: json['mode'] as String,
      reference: json['reference'] as String,
      name: json['name'] as String,
      locationDesc: json['locationDesc'] as String?,
      spotter: json['spotter'] as String?,
      comments: json['comments'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$PotaSpotModelToJson(_PotaSpotModel instance) =>
    <String, dynamic>{
      'spotId': instance.spotId,
      'spotTime': instance.spotTime,
      'activator': instance.activator,
      'frequency': instance.frequency,
      'mode': instance.mode,
      'reference': instance.reference,
      'name': instance.name,
      'locationDesc': instance.locationDesc,
      'spotter': instance.spotter,
      'comments': instance.comments,
      'source': instance.source,
    };
