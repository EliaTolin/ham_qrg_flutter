// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_cached.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageCached _$ImageCachedFromJson(Map<String, dynamic> json) => _ImageCached(
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      path: json['path'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageCachedToJson(_ImageCached instance) =>
    <String, dynamic>{
      'expiresAt': instance.expiresAt.toIso8601String(),
      'path': instance.path,
      'url': instance.url,
    };
