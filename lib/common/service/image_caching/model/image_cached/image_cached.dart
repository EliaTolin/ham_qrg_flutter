import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_cached.freezed.dart';
part 'image_cached.g.dart';

@freezed
abstract class ImageCached with _$ImageCached {
  const factory ImageCached({
    required DateTime expiresAt,
    required String path,
    required String url,
  }) = _ImageCached;

  factory ImageCached.fromJson(Map<String, dynamic> json) =>
      _$ImageCachedFromJson(json);
}
