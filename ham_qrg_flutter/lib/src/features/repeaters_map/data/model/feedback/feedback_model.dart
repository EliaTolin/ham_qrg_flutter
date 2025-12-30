import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
abstract class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    required String id,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    required String station,
    required double lat,
    required double lon,
    required String comment,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}

