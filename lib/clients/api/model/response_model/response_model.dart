import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';

@freezed
abstract class ResponseModel with _$ResponseModel {
  factory ResponseModel({
    required int statusCode,
    required dynamic data,
  }) = _ResponseModel;
}
