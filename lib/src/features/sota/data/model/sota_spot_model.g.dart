// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_spot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SotaSpotModel _$SotaSpotModelFromJson(Map<String, dynamic> json) =>
    _SotaSpotModel(
      id: (json['id'] as num?)?.toInt(),
      altM: (json['AltM'] as num?)?.toInt(),
      altFt: (json['AltFt'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      timeStamp: json['timeStamp'] as String?,
      activatorCallsign: json['activatorCallsign'] as String?,
      summitCode: json['summitCode'] as String?,
      summitName: json['summitName'] as String?,
      mode: json['mode'] as String?,
      frequency: (json['frequency'] as num?)?.toDouble(),
      activatorName: json['activatorName'] as String?,
      comments: json['comments'] as String?,
      type: json['type'] as String?,
      callsign: json['callsign'] as String?,
      userID: (json['userID'] as num?)?.toInt(),
      epoch: json['epoch'] as String?,
    );

Map<String, dynamic> _$SotaSpotModelToJson(_SotaSpotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'AltM': instance.altM,
      'AltFt': instance.altFt,
      'points': instance.points,
      'timeStamp': instance.timeStamp,
      'activatorCallsign': instance.activatorCallsign,
      'summitCode': instance.summitCode,
      'summitName': instance.summitName,
      'mode': instance.mode,
      'frequency': instance.frequency,
      'activatorName': instance.activatorName,
      'comments': instance.comments,
      'type': instance.type,
      'callsign': instance.callsign,
      'userID': instance.userID,
      'epoch': instance.epoch,
    };
