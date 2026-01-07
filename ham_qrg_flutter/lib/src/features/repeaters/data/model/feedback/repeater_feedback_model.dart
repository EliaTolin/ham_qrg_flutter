import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_feedback_model.freezed.dart';
part 'repeater_feedback_model.g.dart';

@freezed
abstract class RepeaterFeedbackModel with _$RepeaterFeedbackModel {
  const factory RepeaterFeedbackModel({
    required String id,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    required String station,
    required double lat,
    required double lon,
    required String comment,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _RepeaterFeedbackModel;

  factory RepeaterFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterFeedbackModelFromJson(json);
}
