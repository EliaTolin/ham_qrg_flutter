import 'package:freezed_annotation/freezed_annotation.dart';

part 'param_model.freezed.dart';
part 'param_model.g.dart';

@freezed
abstract class ParamModel with _$ParamModel {
  const factory ParamModel({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String key,
    required String value,
  }) = _ParamModel;

  factory ParamModel.fromJson(Map<String, dynamic> json) =>
      _$ParamModelFromJson(json);
}
