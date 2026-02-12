import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/maidenhead_locator.dart';

void main() {
  group('MaidenheadLocator', () {
    group('fromCoordinates', () {
      group('well-known locations', () {
        test('should return correct locator for Rome', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 41.9028,
            longitude: 12.4964,
          );
          expect(result, startsWith('JN61'));
          expect(result.length, 6);
        });

        test('should return correct locator for London', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 51.5074,
            longitude: -0.1278,
          );
          expect(result, equals('IO91WM'));
        });

        test('should return correct locator for Bologna', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 44.4949,
            longitude: 11.3426,
          );
          expect(result, startsWith('JN54'));
          expect(result.length, 6);
        });

        test('should return correct locator for New York', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 40.7128,
            longitude: -74.0060,
          );
          expect(result, startsWith('FN20'));
          expect(result.length, 6);
        });

        test('should return correct locator for Tokyo', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 35.6762,
            longitude: 139.6503,
          );
          expect(result, startsWith('PM95'));
          expect(result.length, 6);
        });

        test('should return correct locator for Sydney', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: -33.8688,
            longitude: 151.2093,
          );
          expect(result, startsWith('QF56'));
          expect(result.length, 6);
        });
      });

      group('format validation', () {
        test('should always return 6 characters', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 0,
            longitude: 0,
          );
          expect(result.length, 6);
        });

        test('first two characters should be uppercase letters A-R', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 45,
            longitude: 10,
          );
          expect(result[0], matches(RegExp('[A-R]')));
          expect(result[1], matches(RegExp('[A-R]')));
        });

        test('middle two characters should be digits 0-9', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 45,
            longitude: 10,
          );
          expect(result[2], matches(RegExp('[0-9]')));
          expect(result[3], matches(RegExp('[0-9]')));
        });

        test('last two characters should be uppercase letters A-X', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 45,
            longitude: 10,
          );
          expect(result[4], matches(RegExp('[A-X]')));
          expect(result[5], matches(RegExp('[A-X]')));
        });
      });

      group('edge cases', () {
        test('should handle equator and prime meridian (0, 0)', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 0,
            longitude: 0,
          );
          expect(result, startsWith('JJ00'));
          expect(result.length, 6);
        });

        test('should handle negative coordinates', () {
          // Buenos Aires
          final result = MaidenheadLocator.fromCoordinates(
            latitude: -34.6037,
            longitude: -58.3816,
          );
          expect(result, startsWith('GF05'));
          expect(result.length, 6);
        });

        test('should handle extreme northern latitude', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 89,
            longitude: 0,
          );
          expect(result.length, 6);
          expect(result[1], equals('R'));
        });

        test('should handle extreme southern latitude', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: -89,
            longitude: 0,
          );
          expect(result.length, 6);
          expect(result[1], equals('A'));
        });

        test('should handle extreme western longitude', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 0,
            longitude: -179,
          );
          expect(result.length, 6);
          expect(result[0], equals('A'));
        });

        test('should handle extreme eastern longitude', () {
          final result = MaidenheadLocator.fromCoordinates(
            latitude: 0,
            longitude: 179,
          );
          expect(result.length, 6);
          expect(result[0], equals('R'));
        });
      });

      group('nearby locations produce different subsquares', () {
        test('should differentiate nearby locations', () {
          final milan = MaidenheadLocator.fromCoordinates(
            latitude: 45.4642,
            longitude: 9.1900,
          );
          final turin = MaidenheadLocator.fromCoordinates(
            latitude: 45.0703,
            longitude: 7.6869,
          );
          // Milan and Turin share the JN45 field but differ in subsquare
          expect(milan, startsWith('JN45'));
          expect(turin, startsWith('JN35'));
          expect(milan, isNot(equals(turin)));
        });
      });
    });
  });
}
