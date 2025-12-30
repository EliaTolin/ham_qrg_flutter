// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeStatisticsModel _$HomeStatisticsModelFromJson(Map<String, dynamic> json) =>
    _HomeStatisticsModel(
      totalRepeaters: (json['total_repeaters'] as num).toInt(),
      favoritesCount: (json['favorites_count'] as num).toInt(),
    );

Map<String, dynamic> _$HomeStatisticsModelToJson(
        _HomeStatisticsModel instance) =>
    <String, dynamic>{
      'total_repeaters': instance.totalRepeaters,
      'favorites_count': instance.favoritesCount,
    };
