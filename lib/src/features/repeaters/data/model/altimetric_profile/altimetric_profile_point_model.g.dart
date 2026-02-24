// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altimetric_profile_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AltimetricProfilePointModel _$AltimetricProfilePointModelFromJson(
        Map<String, dynamic> json) =>
    _AltimetricProfilePointModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      elevationM: (json['elevation_m'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
    );

Map<String, dynamic> _$AltimetricProfilePointModelToJson(
        _AltimetricProfilePointModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'elevation_m': instance.elevationM,
      'distance_km': instance.distanceKm,
    };
