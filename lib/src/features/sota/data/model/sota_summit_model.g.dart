// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_summit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SotaSummitModel _$SotaSummitModelFromJson(Map<String, dynamic> json) =>
    _SotaSummitModel(
      summitCode: json['summitCode'] as String,
      name: json['name'] as String,
      associationName: json['associationName'] as String,
      associationCode: json['associationCode'] as String,
      regionName: json['regionName'] as String,
      regionCode: json['regionCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altM: (json['altM'] as num).toInt(),
      altFt: (json['altFt'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      locator: json['locator'] as String,
      validFrom: json['validFrom'] as String,
      validTo: json['validTo'] as String,
      valid: json['valid'] as bool,
      restrictionMask: json['restrictionMask'] as bool,
      restrictionList: (json['restrictionList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      notes: json['notes'] as String?,
      gridRef1: json['gridRef1'] as String?,
      gridRef2: json['gridRef2'] as String?,
    );

Map<String, dynamic> _$SotaSummitModelToJson(_SotaSummitModel instance) =>
    <String, dynamic>{
      'summitCode': instance.summitCode,
      'name': instance.name,
      'associationName': instance.associationName,
      'associationCode': instance.associationCode,
      'regionName': instance.regionName,
      'regionCode': instance.regionCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altM': instance.altM,
      'altFt': instance.altFt,
      'points': instance.points,
      'locator': instance.locator,
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
      'valid': instance.valid,
      'restrictionMask': instance.restrictionMask,
      'restrictionList': instance.restrictionList,
      'notes': instance.notes,
      'gridRef1': instance.gridRef1,
      'gridRef2': instance.gridRef2,
    };
