// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_park_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PotaParkModel _$PotaParkModelFromJson(Map<String, dynamic> json) =>
    _PotaParkModel(
      reference: json['reference'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      grid4: json['grid4'] as String?,
      grid6: json['grid6'] as String?,
      parktypeDesc: json['parktypeDesc'] as String?,
      locationName: json['locationName'] as String?,
      entityName: json['entityName'] as String?,
      website: json['website'] as String?,
      accessMethods: json['accessMethods'] as String?,
      firstActivator: json['firstActivator'] as String?,
      firstActivationDate: json['firstActivationDate'] as String?,
    );

Map<String, dynamic> _$PotaParkModelToJson(_PotaParkModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'grid4': instance.grid4,
      'grid6': instance.grid6,
      'parktypeDesc': instance.parktypeDesc,
      'locationName': instance.locationName,
      'entityName': instance.entityName,
      'website': instance.website,
      'accessMethods': instance.accessMethods,
      'firstActivator': instance.firstActivator,
      'firstActivationDate': instance.firstActivationDate,
    };
