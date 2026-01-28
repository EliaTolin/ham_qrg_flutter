import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';

void main() {
  group('RepeaterFormatHelper.formatFrequency', () {
    test('MHz with exactly 3 trailing zeros', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430000000),
        '430.000 MHz',
      );
    });

    test('MHz with 3 significant decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145130000),
        '145.130 MHz',
      );
    });

    test('MHz with non-rounded 3 decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(144133000),
        '144.133 MHz',
      );
    });

    test('MHz with 4 decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430412500),
        '430.4125 MHz',
      );
    });

    test('MHz with 5 decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430412530),
        '430.41253 MHz',
      );
    });

    test('MHz with maximum precision (Hz resolution)', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430412531),
        '430.412531 MHz',
      );
    });

    test('MHz trimming trailing zeros', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430412500),
        '430.4125 MHz',
      );
    });

    test('MHz ending with exactly 3 decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430123000),
        '430.123 MHz',
      );
    });

    test('kHz with fixed 3 decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145500),
        '145.500 kHz',
      );
    });

    test('kHz with non-zero remainder', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145123),
        '145.123 kHz',
      );
    });

    test('kHz with trailing zeros', () {
      expect(
        RepeaterFormatHelper.formatFrequency(430000),
        '430.000 kHz',
      );
    });

    test('Pure Hz value', () {
      expect(
        RepeaterFormatHelper.formatFrequency(433),
        '433 Hz',
      );
    });

    test('Zero Hz', () {
      expect(
        RepeaterFormatHelper.formatFrequency(0),
        '0 Hz',
      );
    });
  });
}
