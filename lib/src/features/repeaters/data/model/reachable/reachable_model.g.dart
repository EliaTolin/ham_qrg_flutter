// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reachable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReachableRepeaterModel _$ReachableRepeaterModelFromJson(
        Map<String, dynamic> json) =>
    _ReachableRepeaterModel(
      id: json['id'] as String,
      dbm: (json['dbm'] as num).toDouble(),
      lossDb: (json['loss_db'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      azimuthDeg: (json['azimuth_deg'] as num).toDouble(),
      reachable: json['reachable'] as bool,
      itmErrno: (json['itm_errno'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReachableRepeaterModelToJson(
        _ReachableRepeaterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dbm': instance.dbm,
      'loss_db': instance.lossDb,
      'distance_km': instance.distanceKm,
      'azimuth_deg': instance.azimuthDeg,
      'reachable': instance.reachable,
      'itm_errno': instance.itmErrno,
    };

_ReachableResponseModel _$ReachableResponseModelFromJson(
        Map<String, dynamic> json) =>
    _ReachableResponseModel(
      count: (json['count'] as num?)?.toInt() ?? 0,
      reachable: (json['reachable'] as List<dynamic>?)
              ?.map((e) =>
                  ReachableRepeaterModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReachableResponseModelToJson(
        _ReachableResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'reachable': instance.reachable,
    };

_LinkProfilePointModel _$LinkProfilePointModelFromJson(
        Map<String, dynamic> json) =>
    _LinkProfilePointModel(
      distanceKm: (json['distance_km'] as num).toDouble(),
      groundM: (json['ground_m'] as num).toDouble(),
    );

Map<String, dynamic> _$LinkProfilePointModelToJson(
        _LinkProfilePointModel instance) =>
    <String, dynamic>{
      'distance_km': instance.distanceKm,
      'ground_m': instance.groundM,
    };

_LinkDetailModel _$LinkDetailModelFromJson(Map<String, dynamic> json) =>
    _LinkDetailModel(
      id: json['id'] as String,
      dbm: (json['dbm'] as num).toDouble(),
      lossDb: (json['loss_db'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      azimuthDeg: (json['azimuth_deg'] as num).toDouble(),
      reachable: json['reachable'] as bool,
      itmErrno: (json['itm_errno'] as num?)?.toInt() ?? 0,
      profile: (json['profile'] as List<dynamic>?)
              ?.map((e) =>
                  LinkProfilePointModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LinkDetailModelToJson(_LinkDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dbm': instance.dbm,
      'loss_db': instance.lossDb,
      'distance_km': instance.distanceKm,
      'azimuth_deg': instance.azimuthDeg,
      'reachable': instance.reachable,
      'itm_errno': instance.itmErrno,
      'profile': instance.profile,
    };
