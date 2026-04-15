// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpotModel _$SpotModelFromJson(Map<String, dynamic> json) => _SpotModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      repeaterId: json['repeater_id'] as String,
      callsignSnapshot: json['callsign_snapshot'] as String?,
      startedAt: DateTime.parse(json['started_at'] as String),
      spottedCallsign: json['spotted_callsign'] as String?,
      accessId: json['access_id'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
      profile: json['profiles'] == null
          ? null
          : SpotProfileModel.fromJson(json['profiles'] as Map<String, dynamic>),
      repeater: json['repeaters'] == null
          ? null
          : SpotRepeaterModel.fromJson(
              json['repeaters'] as Map<String, dynamic>),
      access: json['repeater_access'] == null
          ? null
          : SpotAccessModel.fromJson(
              json['repeater_access'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpotModelToJson(_SpotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'repeater_id': instance.repeaterId,
      'callsign_snapshot': instance.callsignSnapshot,
      'started_at': instance.startedAt.toIso8601String(),
      'spotted_callsign': instance.spottedCallsign,
      'access_id': instance.accessId,
      'duration_minutes': instance.durationMinutes,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
      'profiles': instance.profile,
      'repeaters': instance.repeater,
      'repeater_access': instance.access,
    };

_SpotProfileModel _$SpotProfileModelFromJson(Map<String, dynamic> json) =>
    _SpotProfileModel(
      id: json['id'] as String,
      callsign: json['callsign'] as String?,
      firstName: json['first_name'] as String?,
    );

Map<String, dynamic> _$SpotProfileModelToJson(_SpotProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'callsign': instance.callsign,
      'first_name': instance.firstName,
    };

_SpotRepeaterModel _$SpotRepeaterModelFromJson(Map<String, dynamic> json) =>
    _SpotRepeaterModel(
      id: json['id'] as String,
      callsign: json['callsign'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpotRepeaterModelToJson(_SpotRepeaterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'callsign': instance.callsign,
      'name': instance.name,
    };

_SpotAccessModel _$SpotAccessModelFromJson(Map<String, dynamic> json) =>
    _SpotAccessModel(
      id: json['id'] as String,
      mode: json['mode'] as String,
    );

Map<String, dynamic> _$SpotAccessModelToJson(_SpotAccessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
    };
