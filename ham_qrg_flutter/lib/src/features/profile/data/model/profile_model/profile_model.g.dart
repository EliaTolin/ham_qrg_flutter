// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      callsign: json['callsign'] as String?,
      propic: json['propic'] as String?,
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['user_type']),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'callsign': instance.callsign,
      'propic': instance.propic,
      'user_type': _$UserTypeEnumMap[instance.userType],
    };

const _$UserTypeEnumMap = {
  UserType.swl: 'swl',
  UserType.licensed: 'licensed',
};
