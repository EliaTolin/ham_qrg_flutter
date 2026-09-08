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

    test('Boundary: exactly 1 MHz', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1000000),
        '1.000 MHz',
      );
    });

    test('Boundary: exactly 1 kHz', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1000),
        '1.000 kHz',
      );
    });

    test('Boundary: 999 Hz stays in Hz range', () {
      expect(
        RepeaterFormatHelper.formatFrequency(999),
        '999 Hz',
      );
    });

    test('Boundary: 999999 Hz stays in kHz range', () {
      expect(
        RepeaterFormatHelper.formatFrequency(999999),
        '999.999 kHz',
      );
    });

    test('Common 2m VHF frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145500000),
        '145.500 MHz',
      );
    });

    test('Common 70cm UHF frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(433500000),
        '433.500 MHz',
      );
    });

    test('Common APRS frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(144800000),
        '144.800 MHz',
      );
    });

    test('1.2 GHz frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1297500000),
        '1297.500 MHz',
      );
    });

    test('HF frequency 14 MHz', () {
      expect(
        RepeaterFormatHelper.formatFrequency(14074000),
        '14.074 MHz',
      );
    });

    test('kHz with 1 Hz remainder', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1001),
        '1.001 kHz',
      );
    });

    test('1 Hz', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1),
        '1 Hz',
      );
    });

    test('MHz with leading zeros in decimals', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145001000),
        '145.001 MHz',
      );
    });

    test('MHz with remainder starting with zeros and non-zero tail', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145000100),
        '145.0001 MHz',
      );
    });

    test('MHz with 1 Hz remainder', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145000001),
        '145.000001 MHz',
      );
    });

    test('2.4 GHz frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(2400000000),
        '2400.000 MHz',
      );
    });

    test('D-STAR calling frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(145375000),
        '145.375 MHz',
      );
    });

    test('C4FM frequency', () {
      expect(
        RepeaterFormatHelper.formatFrequency(144625000),
        '144.625 MHz',
      );
    });

    test('kHz with small remainder', () {
      expect(
        RepeaterFormatHelper.formatFrequency(1010),
        '1.010 kHz',
      );
    });
  });

  group('RepeaterFormatHelper.formatCtcss', () {
    test('returns dash for null', () {
      expect(RepeaterFormatHelper.formatCtcss(null), '-');
    });

    test('formats with one decimal place', () {
      expect(RepeaterFormatHelper.formatCtcss(88.5), '88.5 Hz');
    });

    test('formats whole number with .0', () {
      expect(RepeaterFormatHelper.formatCtcss(100), '100.0 Hz');
    });

    test('formats zero', () {
      expect(RepeaterFormatHelper.formatCtcss(0), '0.0 Hz');
    });

    test('rounds to one decimal', () {
      expect(RepeaterFormatHelper.formatCtcss(67.89), '67.9 Hz');
    });

    test('common CTCSS tone 67.0 Hz', () {
      expect(RepeaterFormatHelper.formatCtcss(67), '67.0 Hz');
    });

    test('common CTCSS tone 71.9 Hz', () {
      expect(RepeaterFormatHelper.formatCtcss(71.9), '71.9 Hz');
    });

    test('common CTCSS tone 131.8 Hz', () {
      expect(RepeaterFormatHelper.formatCtcss(131.8), '131.8 Hz');
    });

    test('common CTCSS tone 250.3 Hz', () {
      expect(RepeaterFormatHelper.formatCtcss(250.3), '250.3 Hz');
    });

    test('very small value', () {
      expect(RepeaterFormatHelper.formatCtcss(0.1), '0.1 Hz');
    });
  });

  group('RepeaterFormatHelper.formatShift', () {
    test('returns dash when both null', () {
      expect(RepeaterFormatHelper.formatShift(null, null), '-');
    });

    test('prefers shiftHz over shiftRaw when both provided', () {
      expect(RepeaterFormatHelper.formatShift(600000, '-600 kHz'), '600.0 kHz');
    });

    test('shiftHz always includes unit', () {
      expect(RepeaterFormatHelper.formatShift(1000, '+1.0 kHz'), '1.0 kHz');
    });

    test('returns dash for empty shiftRaw and null shiftHz', () {
      expect(RepeaterFormatHelper.formatShift(null, ''), '-');
    });

    test('formats Hz when shiftHz < 1000', () {
      expect(RepeaterFormatHelper.formatShift(500, null), '500 Hz');
    });

    test('formats kHz when shiftHz >= 1000', () {
      expect(RepeaterFormatHelper.formatShift(600000, null), '600.0 kHz');
    });

    test('formats exactly 1000 Hz as kHz', () {
      expect(RepeaterFormatHelper.formatShift(1000, null), '1.0 kHz');
    });

    test('formats 0 Hz', () {
      expect(RepeaterFormatHelper.formatShift(0, null), '0 Hz');
    });

    test('ignores empty shiftRaw and uses shiftHz', () {
      expect(RepeaterFormatHelper.formatShift(7600000, ''), '7.6 MHz');
    });

    test('negative shift in kHz', () {
      expect(RepeaterFormatHelper.formatShift(-600000, null), '-600.0 kHz');
    });

    test('negative shift in Hz', () {
      expect(RepeaterFormatHelper.formatShift(-500, null), '-500 Hz');
    });

    test('negative shift with typical 2m repeater offset', () {
      expect(RepeaterFormatHelper.formatShift(-600000, null), '-600.0 kHz');
    });

    test('negative shift with typical 70cm repeater offset', () {
      expect(
        RepeaterFormatHelper.formatShift(-7600000, null),
        '-7.6 MHz',
      );
    });

    test('negative shift at boundary -1000 Hz', () {
      expect(RepeaterFormatHelper.formatShift(-1000, null), '-1.0 kHz');
    });

    test('negative shift just below boundary -999 Hz stays in Hz', () {
      expect(RepeaterFormatHelper.formatShift(-999, null), '-999 Hz');
    });

    test('shiftHz takes priority even with shiftRaw', () {
      expect(
        RepeaterFormatHelper.formatShift(-600000, '-600 kHz'),
        '-600.0 kHz',
      );
    });

    test('shiftRaw strips trailing zeros from decimal', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '1.600000'),
        '1.6',
      );
    });

    test('shiftRaw strips trailing zeros with negative value', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '-7.6000'),
        '-7.6',
      );
    });

    test('shiftRaw keeps at least one decimal digit', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '+1.0'),
        '+1.0',
      );
    });

    test('shiftRaw strips zeros but keeps significant decimals', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '1.25000'),
        '1.25',
      );
    });

    test('shiftRaw without decimal is unchanged', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '600'),
        '600',
      );
    });

    test('shiftRaw with suffix strips zeros before suffix', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '1.600000 kHz'),
        '1.6 kHz',
      );
    });

    test('shiftRaw "1.00" strips to "1.0"', () {
      expect(RepeaterFormatHelper.formatShift(null, '1.00'), '1.0');
    });

    test('shiftRaw "1.10" strips to "1.1"', () {
      expect(RepeaterFormatHelper.formatShift(null, '1.10'), '1.1');
    });

    test('shiftRaw negative with suffix strips zeros', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '-7.60000 kHz'),
        '-7.6 kHz',
      );
    });

    test('positive shift in kHz', () {
      expect(RepeaterFormatHelper.formatShift(600000, null), '600.0 kHz');
    });

    test('positive shift in Hz below 1000', () {
      expect(RepeaterFormatHelper.formatShift(100, null), '100 Hz');
    });

    test('positive shift in MHz', () {
      expect(RepeaterFormatHelper.formatShift(7600000, null), '7.6 MHz');
    });

    test('negative shift in MHz', () {
      expect(RepeaterFormatHelper.formatShift(-7600000, null), '-7.6 MHz');
    });

    test('boundary: exactly 1 MHz', () {
      expect(RepeaterFormatHelper.formatShift(1000000, null), '1.0 MHz');
    });

    test('boundary: exactly -1 MHz', () {
      expect(RepeaterFormatHelper.formatShift(-1000000, null), '-1.0 MHz');
    });

    test('boundary: 999999 Hz stays in kHz', () {
      expect(RepeaterFormatHelper.formatShift(999999, null), '1000.0 kHz');
    });

    test('10 MHz shift', () {
      expect(RepeaterFormatHelper.formatShift(10000000, null), '10.0 MHz');
    });

    test('negative 10 MHz shift', () {
      expect(RepeaterFormatHelper.formatShift(-10000000, null), '-10.0 MHz');
    });

    test('shiftRaw with MHz suffix used as fallback', () {
      expect(
        RepeaterFormatHelper.formatShift(null, '-7.60000 MHz'),
        '-7.6 MHz',
      );
    });

    test('fractional MHz shift 1.6 MHz', () {
      expect(RepeaterFormatHelper.formatShift(1600000, null), '1.6 MHz');
    });

    test('negative fractional MHz shift', () {
      expect(RepeaterFormatHelper.formatShift(-1600000, null), '-1.6 MHz');
    });

    test('shiftRaw fallback with only zeros after decimal "5.000"', () {
      expect(RepeaterFormatHelper.formatShift(null, '5.000'), '5.0');
    });

    test('shiftRaw fallback with no trailing zeros unchanged', () {
      expect(RepeaterFormatHelper.formatShift(null, '3.14'), '3.14');
    });

    test('shiftHz takes priority over whitespace-only shiftRaw', () {
      expect(RepeaterFormatHelper.formatShift(5000, '   '), '5.0 kHz');
    });
  });
}
