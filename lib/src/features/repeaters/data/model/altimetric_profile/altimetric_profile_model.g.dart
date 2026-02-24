// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altimetric_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AltimetricProfileModel _$AltimetricProfileModelFromJson(
        Map<String, dynamic> json) =>
    _AltimetricProfileModel(
      points: (json['points'] as List<dynamic>)
          .map((e) =>
              AltimetricProfilePointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDistanceKm: (json['total_distance_km'] as num).toDouble(),
      numPoints: (json['num_points'] as num).toInt(),
    );

Map<String, dynamic> _$AltimetricProfileModelToJson(
        _AltimetricProfileModel instance) =>
    <String, dynamic>{
      'points': instance.points,
      'total_distance_km': instance.totalDistanceKm,
      'num_points': instance.numPoints,
    };
