import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';

enum SpotState { active, expired, closed }

extension RepeaterSpotState on RepeaterSpot {
  bool get isSelfSpot => spottedCallsign == null;
  bool get isOtherSpot => spottedCallsign != null;

  SpotState get state {
    if (isOtherSpot) return SpotState.closed;
    if (closedAt != null) return SpotState.closed;
    if (expiresAt != null && !expiresAt!.isAfter(DateTime.now())) {
      return SpotState.expired;
    }
    return SpotState.active;
  }

  bool get isActive => state == SpotState.active;

  Duration get remainingTime {
    if (expiresAt == null) return Duration.zero;
    final remaining = expiresAt!.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }
}
