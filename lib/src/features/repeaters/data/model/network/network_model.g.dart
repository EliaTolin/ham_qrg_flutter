// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NetworkModel _$NetworkModelFromJson(Map<String, dynamic> json) =>
    _NetworkModel(
      id: json['id'] as String,
      name: json['name'] as String,
      kind: json['kind'] as String,
      createdAt: json['created_at'] as String,
      parentNetworkId: json['parent_network_id'] as String?,
      website: json['website'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$NetworkModelToJson(_NetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': instance.kind,
      'created_at': instance.createdAt,
      'parent_network_id': instance.parentNetworkId,
      'website': instance.website,
      'notes': instance.notes,
    };
