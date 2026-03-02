import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report_model.freezed.dart';
part 'user_report_model.g.dart';

@freezed
abstract class UserReportModel with _$UserReportModel {
  const factory UserReportModel({
    required String id,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    required String description,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    Map<String, dynamic>? repeater,
  }) = _UserReportModel;

  factory UserReportModel.fromJson(Map<String, dynamic> json) =>
      _$UserReportModelFromJson(json);
}
