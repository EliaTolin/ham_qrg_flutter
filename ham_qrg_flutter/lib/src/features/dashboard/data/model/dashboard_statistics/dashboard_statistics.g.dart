// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardStatisticsModel _$DashboardStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    _DashboardStatisticsModel(
      totalRepeaters: (json['total_repeaters'] as num).toInt(),
      favoritesCount: (json['favorites_count'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardStatisticsModelToJson(
        _DashboardStatisticsModel instance) =>
    <String, dynamic>{
      'total_repeaters': instance.totalRepeaters,
      'favorites_count': instance.favoritesCount,
    };
