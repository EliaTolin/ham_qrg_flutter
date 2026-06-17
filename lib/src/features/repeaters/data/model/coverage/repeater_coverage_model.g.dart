// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_coverage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoverageBoundsModel _$CoverageBoundsModelFromJson(Map<String, dynamic> json) =>
    _CoverageBoundsModel(
      north: (json['north'] as num).toDouble(),
      south: (json['south'] as num).toDouble(),
      east: (json['east'] as num).toDouble(),
      west: (json['west'] as num).toDouble(),
    );

Map<String, dynamic> _$CoverageBoundsModelToJson(
        _CoverageBoundsModel instance) =>
    <String, dynamic>{
      'north': instance.north,
      'south': instance.south,
      'east': instance.east,
      'west': instance.west,
    };

_CoverageSizeModel _$CoverageSizeModelFromJson(Map<String, dynamic> json) =>
    _CoverageSizeModel(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$CoverageSizeModelToJson(_CoverageSizeModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_CoverageLegendStopModel _$CoverageLegendStopModelFromJson(
        Map<String, dynamic> json) =>
    _CoverageLegendStopModel(
      dbm: (json['dbm'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$CoverageLegendStopModelToJson(
        _CoverageLegendStopModel instance) =>
    <String, dynamic>{
      'dbm': instance.dbm,
      'color': instance.color,
    };

_RepeaterCoverageModel _$RepeaterCoverageModelFromJson(
        Map<String, dynamic> json) =>
    _RepeaterCoverageModel(
      bounds:
          CoverageBoundsModel.fromJson(json['bounds'] as Map<String, dynamic>),
      size: CoverageSizeModel.fromJson(json['size'] as Map<String, dynamic>),
      legend: (json['legend'] as List<dynamic>?)
              ?.map((e) =>
                  CoverageLegendStopModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageUrl: json['image_url'] as String?,
      image: json['image'] as String?,
      cached: json['cached'] as bool? ?? false,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$RepeaterCoverageModelToJson(
        _RepeaterCoverageModel instance) =>
    <String, dynamic>{
      'bounds': instance.bounds,
      'size': instance.size,
      'legend': instance.legend,
      'image_url': instance.imageUrl,
      'image': instance.image,
      'cached': instance.cached,
      'source': instance.source,
    };
