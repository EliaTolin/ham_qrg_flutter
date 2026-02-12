import 'package:freezed_annotation/freezed_annotation.dart';

part 'param.freezed.dart';

@freezed
abstract class Param with _$Param {
  const factory Param({
    required String id,
    required DateTime createdAt,
    required String key,
    required String value,
  }) = _Param;
}
