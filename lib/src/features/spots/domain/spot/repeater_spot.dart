import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

part 'repeater_spot.freezed.dart';

@freezed
abstract class RepeaterSpot with _$RepeaterSpot {
  const factory RepeaterSpot({
    required String id,
    required String userId,
    required String repeaterId,
    String? callsignSnapshot,
    required DateTime startedAt,
    String? spottedCallsign,
    String? accessId,
    AccessMode? accessMode,
    int? durationMinutes,
    DateTime? expiresAt,
    DateTime? closedAt,
    String? repeaterCallsign,
    String? repeaterName,
    String? spotterFirstName,
  }) = _RepeaterSpot;
}
