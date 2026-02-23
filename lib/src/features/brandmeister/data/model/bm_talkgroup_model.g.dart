// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bm_talkgroup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BmTalkgroupModel _$BmTalkgroupModelFromJson(Map<String, dynamic> json) =>
    _BmTalkgroupModel(
      talkgroup: json['talkgroup'] as String,
      slot: json['slot'] as String,
      repeaterId: json['repeaterid'] as String,
    );

Map<String, dynamic> _$BmTalkgroupModelToJson(_BmTalkgroupModel instance) =>
    <String, dynamic>{
      'talkgroup': instance.talkgroup,
      'slot': instance.slot,
      'repeaterid': instance.repeaterId,
    };
