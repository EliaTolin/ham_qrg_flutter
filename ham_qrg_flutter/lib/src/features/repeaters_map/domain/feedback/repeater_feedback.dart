import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/station_kind.dart';

part 'repeater_feedback.freezed.dart';

@freezed
abstract class RepeaterFeedback with _$RepeaterFeedback {
  const factory RepeaterFeedback({
    required String id,
    required String repeaterId,
    required String userId,
    required FeedbackType type,
    required StationKind station,
    required double latitude,
    required double longitude,
    required String comment,
    required DateTime createdAt,
  }) = _RepeaterFeedback;
}

