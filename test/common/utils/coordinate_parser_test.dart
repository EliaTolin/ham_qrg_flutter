import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coordinate_parser.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

void main() {
  group('parseCoordinates', () {
    group('formati validi', () {
      test('should parse comma and space with dot decimals', () {
        final result = parseCoordinates('46.4879, 11.8123');
        expect(result, isA<ParsedCoordinates>());
        final parsed = result as ParsedCoordinates;
        expect(parsed.latitude, closeTo(46.4879, 1e-9));
        expect(parsed.longitude, closeTo(11.8123, 1e-9));
      });

      test('should parse whitespace separator with dot decimals', () {
        final result = parseCoordinates('46.4879 11.8123');
        expect(result, isA<ParsedCoordinates>());
      });

      test('should parse bare comma without space', () {
        final result = parseCoordinates('-33.8688,151.2093');
        expect(result, isA<ParsedCoordinates>());
        final parsed = result as ParsedCoordinates;
        expect(parsed.latitude, closeTo(-33.8688, 1e-9));
        expect(parsed.longitude, closeTo(151.2093, 1e-9));
      });

      test('should parse Italian comma decimals separated by whitespace', () {
        final result = parseCoordinates('46,4879 11,8123');
        expect(result, isA<ParsedCoordinates>());
        final parsed = result as ParsedCoordinates;
        expect(parsed.latitude, closeTo(46.4879, 1e-9));
        expect(parsed.longitude, closeTo(11.8123, 1e-9));
      });

      test('should parse Italian comma decimals separated by comma-space', () {
        final result = parseCoordinates('46,4879, 11,8123');
        expect(result, isA<ParsedCoordinates>());
        final parsed = result as ParsedCoordinates;
        expect(parsed.latitude, closeTo(46.4879, 1e-9));
        expect(parsed.longitude, closeTo(11.8123, 1e-9));
      });

      test('should parse semicolon separator', () {
        final result = parseCoordinates('46.4879;11.8123');
        expect(result, isA<ParsedCoordinates>());
      });

      test('should parse integers without decimals', () {
        final result = parseCoordinates('45, 9');
        expect(result, isA<ParsedCoordinates>());
      });

      test('should parse explicit plus sign', () {
        final result = parseCoordinates('+46.4879, +11.8123');
        expect(result, isA<ParsedCoordinates>());
      });

      test('should tolerate surrounding whitespace', () {
        expect(
          parseCoordinates('   46.4879, 11.8123  '),
          isA<ParsedCoordinates>(),
        );
      });

      test('should accept the exact range boundaries', () {
        expect(parseCoordinates('90, 180'), isA<ParsedCoordinates>());
        expect(parseCoordinates('-90, -180'), isA<ParsedCoordinates>());
        expect(parseCoordinates('0, 0'), isA<ParsedCoordinates>());
      });
    });

    group('fuori intervallo', () {
      test('should reject latitude beyond 90', () {
        final result = parseCoordinates('91.0, 11.8123');
        expect(result, isA<CoordinatesOutOfRange>());
        expect((result as CoordinatesOutOfRange).latitude, 91.0);
      });

      test('should reject latitude below -90', () {
        expect(parseCoordinates('-90.5, 0'), isA<CoordinatesOutOfRange>());
      });

      test('should reject longitude beyond 180', () {
        expect(parseCoordinates('45, 180.5'), isA<CoordinatesOutOfRange>());
      });

      test('should reject longitude below -180', () {
        expect(parseCoordinates('45, -181'), isA<CoordinatesOutOfRange>());
      });
    });

    group('non sono coordinate', () {
      test('should reject an empty or blank string', () {
        expect(parseCoordinates(''), isA<NotCoordinates>());
        expect(parseCoordinates('    '), isA<NotCoordinates>());
      });

      test('should reject a plain place name', () {
        expect(parseCoordinates('Passo Pordoi'), isA<NotCoordinates>());
      });

      test('should reject a street address with a house number', () {
        // Il caso che rende necessaria la validazione numerica stretta:
        // senza di essa "Roma, 12" verrebbe letto come coordinate valide.
        expect(parseCoordinates('Roma, 12'), isA<NotCoordinates>());
      });

      test('should reject a single value', () {
        expect(parseCoordinates('46.4879'), isA<NotCoordinates>());
      });

      test('should reject three or more values', () {
        expect(
          parseCoordinates('46.4879, 11.8123, 250'),
          isA<NotCoordinates>(),
        );
      });

      test('should reject degrees-minutes-seconds notation', () {
        expect(
          parseCoordinates("46°29'16\"N 11°48'44\"E"),
          isA<NotCoordinates>(),
        );
      });

      test('should reject trailing units', () {
        expect(parseCoordinates('46.4879N, 11.8123E'), isA<NotCoordinates>());
      });
    });

    group('conversione in punto di ricerca', () {
      test('should build a coordinates-origin point with a formatted label',
          () {
        final parsed =
            parseCoordinates('46.4879, 11.8123') as ParsedCoordinates;
        final point = parsed.toSearchPoint();
        expect(point.origin, SearchPointOrigin.coordinates);
        expect(point.label, '46.48790, 11.81230');
        expect(point.context, isNull);
      });
    });
  });
}
