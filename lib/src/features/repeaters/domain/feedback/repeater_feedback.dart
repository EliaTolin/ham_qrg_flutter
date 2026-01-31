import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'repeater_feedback.freezed.dart';

@freezed
abstract class RepeaterFeedback with _$RepeaterFeedback {
  const factory RepeaterFeedback({
    required String id,
    required Repeater repeater,
    required String userId,
    required FeedbackType type,
    required StationKind station,
    required double latitude,
    required double longitude,
    required String comment,
    required RepeaterAccess repeaterAccess,
    required DateTime createdAt,
    String? userCallsign,
    String? userDisplayName,
    String? userAvatarUrl,
  }) = _RepeaterFeedback;
}
