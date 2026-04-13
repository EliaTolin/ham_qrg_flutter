import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';

void main() {
  group('SpotState derivation', () {
    final now = DateTime.now();

    RepeaterSpot makeSpot({
      String? spottedCallsign,
      DateTime? expiresAt,
      DateTime? closedAt,
    }) {
      return RepeaterSpot(
        id: 'test-id',
        userId: 'user-1',
        repeaterId: 'repeater-1',
        callsignSnapshot: 'IZ0ABC',
        startedAt: now.subtract(const Duration(minutes: 10)),
        spottedCallsign: spottedCallsign,
        expiresAt: expiresAt,
        closedAt: closedAt,
        durationMinutes: expiresAt != null ? 30 : null,
      );
    }

    test('self-spot with future expiresAt is active', () {
      final spot = makeSpot(
        expiresAt: now.add(const Duration(minutes: 20)),
      );
      expect(spot.isSelfSpot, isTrue);
      expect(spot.isOtherSpot, isFalse);
      expect(spot.state, SpotState.active);
      expect(spot.isActive, isTrue);
    });

    test('self-spot with past expiresAt is expired', () {
      final spot = makeSpot(
        expiresAt: now.subtract(const Duration(minutes: 1)),
      );
      expect(spot.state, SpotState.expired);
      expect(spot.isActive, isFalse);
    });

    test('self-spot with closedAt is closed', () {
      final spot = makeSpot(
        expiresAt: now.add(const Duration(minutes: 20)),
        closedAt: now.subtract(const Duration(minutes: 5)),
      );
      expect(spot.state, SpotState.closed);
      expect(spot.isActive, isFalse);
    });

    test('other-spot is always closed state', () {
      final spot = makeSpot(
        spottedCallsign: 'IZ0XYZ',
      );
      expect(spot.isSelfSpot, isFalse);
      expect(spot.isOtherSpot, isTrue);
      expect(spot.state, SpotState.closed);
      expect(spot.isActive, isFalse);
    });

    test('remainingTime returns positive duration for active spot', () {
      final spot = makeSpot(
        expiresAt: now.add(const Duration(minutes: 20)),
      );
      expect(spot.remainingTime.inMinutes, greaterThanOrEqualTo(19));
    });

    test('remainingTime returns zero for expired spot', () {
      final spot = makeSpot(
        expiresAt: now.subtract(const Duration(minutes: 1)),
      );
      expect(spot.remainingTime, Duration.zero);
    });

    test('remainingTime returns zero for other-spot (no expiresAt)', () {
      final spot = makeSpot(
        spottedCallsign: 'IZ0XYZ',
      );
      expect(spot.remainingTime, Duration.zero);
    });
  });
}
