import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/data/model/access/repeater_access_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';

part 'repeater_feedback_model.freezed.dart';
part 'repeater_feedback_model.g.dart';

@freezed
abstract class RepeaterFeedbackModel with _$RepeaterFeedbackModel {
  const factory RepeaterFeedbackModel({
    required String id,
    @JsonKey(name: 'repeater') required RepeaterModel repeater,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    required String station,
    required double lat,
    required double lon,
    required String comment,
    @JsonKey(name: 'repeater_access') required RepeaterAccessModel repeaterAccess,
    @JsonKey(name: 'created_at') required String createdAt,
    Map<String, dynamic>? profile,
  }) = _RepeaterFeedbackModel;

  factory RepeaterFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterFeedbackModelFromJson(json);
}
