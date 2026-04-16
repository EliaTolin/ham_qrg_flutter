import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_submission_model.freezed.dart';
part 'user_submission_model.g.dart';

@freezed
abstract class UserSubmissionModel with _$UserSubmissionModel {
  const factory UserSubmissionModel({
    required String id,
    @JsonKey(name: 'frequency_hz') required int frequencyHz,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    String? name,
    String? callsign,
    @JsonKey(name: 'coordinator_response') String? coordinatorResponse,
    @JsonKey(name: 'responded_at') String? respondedAt,
  }) = _UserSubmissionModel;

  factory UserSubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubmissionModelFromJson(json);
}
