import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/station_kind.dart';

part 'feedback.freezed.dart';

@freezed
abstract class Feedback with _$Feedback {
  const factory Feedback({
    required String id,
    required String repeaterId,
    required String userId,
    required FeedbackType type,
    required StationKind station,
    required double latitude,
    required double longitude,
    required String comment,
    required DateTime createdAt,
  }) = _Feedback;
}

