import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/frequency_search_helper.dart';

void main() {
  group('parseFrequencyRange', () {
    group('returns correct range for valid MHz inputs', () {
      test('whole MHz "145"', () {
        final result = parseFrequencyRange('145');
        expect(result, isNotNull);
        expect(result!.minHz, 145000000);
        expect(result.maxHz, 145999999);
      });

      test('one decimal "145.6"', () {
        final result = parseFrequencyRange('145.6');
        expect(result, isNotNull);
        expect(result!.minHz, 145600000);
        expect(result.maxHz, 145699999);
      });

      test('two decimals "145.60"', () {
        final result = parseFrequencyRange('145.60');
        expect(result, isNotNull);
        expect(result!.minHz, 145600000);
        expect(result.maxHz, 145609999);
      });

      test('three decimals "145.600"', () {
        final result = parseFrequencyRange('145.600');
        expect(result, isNotNull);
        expect(result!.minHz, 145600000);
        expect(result.maxHz, 145600999);
      });

      test('four decimals "430.4125"', () {
        final result = parseFrequencyRange('430.4125');
        expect(result, isNotNull);
        expect(result!.minHz, 430412500);
        expect(result.maxHz, 430412599);
      });

      test('five decimals "430.41253"', () {
        final result = parseFrequencyRange('430.41253');
        expect(result, isNotNull);
        expect(result!.minHz, 430412530);
        expect(result.maxHz, 430412539);
      });

      test('six decimals "430.412531"', () {
        final result = parseFrequencyRange('430.412531');
        expect(result, isNotNull);
        expect(result!.minHz, 430412531);
        expect(result.maxHz, 430412531);
      });
    });

    group('common ham radio frequencies', () {
      test('2m VHF calling "145.500"', () {
        final result = parseFrequencyRange('145.500');
        expect(result, isNotNull);
        expect(result!.minHz, 145500000);
        expect(result.maxHz, 145500999);
      });

      test('70cm UHF "430.025"', () {
        final result = parseFrequencyRange('430.025');
        expect(result, isNotNull);
        expect(result!.minHz, 430025000);
        expect(result.maxHz, 430025999);
      });

      test('APRS "144.800"', () {
        final result = parseFrequencyRange('144.800');
        expect(result, isNotNull);
        expect(result!.minHz, 144800000);
        expect(result.maxHz, 144800999);
      });

      test('HF 20m "14.074"', () {
        final result = parseFrequencyRange('14.074');
        expect(result, isNotNull);
        expect(result!.minHz, 14074000);
        expect(result.maxHz, 14074999);
      });

      test('1.2 GHz "1297.500"', () {
        final result = parseFrequencyRange('1297.500');
        expect(result, isNotNull);
        expect(result!.minHz, 1297500000);
        expect(result.maxHz, 1297500999);
      });

      test('whole band search "430"', () {
        final result = parseFrequencyRange('430');
        expect(result, isNotNull);
        expect(result!.minHz, 430000000);
        expect(result.maxHz, 430999999);
      });
    });

    group('boundary values', () {
      test('minimum valid value "1"', () {
        final result = parseFrequencyRange('1');
        expect(result, isNotNull);
        expect(result!.minHz, 1000000);
        expect(result.maxHz, 1999999);
      });

      test('maximum valid value "9999"', () {
        final result = parseFrequencyRange('9999');
        expect(result, isNotNull);
        expect(result!.minHz, 9999000000);
        expect(result.maxHz, 9999999999);
      });
    });

    group('returns null for invalid inputs', () {
      test('text query "IW3ABC"', () {
        expect(parseFrequencyRange('IW3ABC'), isNull);
      });

      test('city name "Milano"', () {
        expect(parseFrequencyRange('Milano'), isNull);
      });

      test('mixed text and numbers "R5 torino"', () {
        expect(parseFrequencyRange('R5 torino'), isNull);
      });

      test('zero "0"', () {
        expect(parseFrequencyRange('0'), isNull);
      });

      test('negative number', () {
        expect(parseFrequencyRange('-145.600'), isNull);
      });

      test('value >= 10000', () {
        expect(parseFrequencyRange('10000'), isNull);
      });

      test('empty string', () {
        expect(parseFrequencyRange(''), isNull);
      });

      test('too many digits before decimal "12345.6"', () {
        expect(parseFrequencyRange('12345.6'), isNull);
      });

      test('too many decimals "145.1234567"', () {
        expect(parseFrequencyRange('145.1234567'), isNull);
      });

      test('only decimal point "."', () {
        expect(parseFrequencyRange('.'), isNull);
      });

      test('trailing dot "145."', () {
        expect(parseFrequencyRange('145.'), isNull);
      });
    });
  });
}
