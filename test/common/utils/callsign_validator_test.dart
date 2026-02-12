import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/callsign_validator.dart';

void main() {
  group('CallsignValidator', () {
    group('isValidLicensedCallsign', () {
      group('Italian callsigns', () {
        test('should validate standard Italian callsigns', () {
          // Class A (full license)
          expect(CallsignValidator.isValidLicensedCallsign('I0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('I1XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('I2AB'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('I3A'), isTrue);

          // IK prefix
          expect(CallsignValidator.isValidLicensedCallsign('IK0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IK4XYZ'), isTrue);

          // IZ prefix
          expect(CallsignValidator.isValidLicensedCallsign('IZ0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IZ8DEF'), isTrue);

          // IU prefix (newer callsigns)
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IU0ABC'), isTrue);

          // IW prefix
          expect(CallsignValidator.isValidLicensedCallsign('IW0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IW2XYZ'), isTrue);
        });

        test('should validate special Italian prefixes', () {
          // Sardinia (IS0)
          expect(CallsignValidator.isValidLicensedCallsign('IS0ABC'), isTrue);

          // Sicily (IT9)
          expect(CallsignValidator.isValidLicensedCallsign('IT9ABC'), isTrue);

          // Trentino-Alto Adige (IN3)
          expect(CallsignValidator.isValidLicensedCallsign('IN3ABC'), isTrue);

          // Special event / contest callsigns
          expect(CallsignValidator.isValidLicensedCallsign('II0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IO0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IP0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IQ0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IR0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IY0ABC'), isTrue);
        });
      });

      group('International callsigns', () {
        test('should validate USA callsigns', () {
          // 1x2 format
          expect(CallsignValidator.isValidLicensedCallsign('K1A'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W1AW'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('N1ABC'), isTrue);

          // 2x1 format
          expect(CallsignValidator.isValidLicensedCallsign('AA1A'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KA1B'), isTrue);

          // 2x2 format
          expect(CallsignValidator.isValidLicensedCallsign('AA1AB'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('WA1BC'), isTrue);

          // 2x3 format
          expect(CallsignValidator.isValidLicensedCallsign('AA1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KA1XYZ'), isTrue);

          // 1x3 format
          expect(CallsignValidator.isValidLicensedCallsign('K1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W9XYZ'), isTrue);
        });

        test('should validate German callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('DL1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DK2XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DF3ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DJ4DEF'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DG5ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DH6XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DO7ABC'), isTrue);
        });

        test('should validate UK callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('G0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('G3XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('M0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('M6XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('2E0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('MM0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('GW0ABC'), isTrue);
        });

        test('should validate Japanese callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('JA1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('JH2XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('JR3ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('7J1ABC'), isTrue);
        });

        test('should validate French callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('F1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('F5XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('F6ABC'), isTrue);
        });

        test('should validate Spanish callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('EA1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('EA4XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('EB5ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('EC3DEF'), isTrue);
        });

        test('should validate other European callsigns', () {
          // Netherlands
          expect(CallsignValidator.isValidLicensedCallsign('PA0ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('PD1XYZ'), isTrue);

          // Belgium
          expect(CallsignValidator.isValidLicensedCallsign('ON4ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('ON7XYZ'), isTrue);

          // Austria
          expect(CallsignValidator.isValidLicensedCallsign('OE1ABC'), isTrue);

          // Switzerland
          expect(CallsignValidator.isValidLicensedCallsign('HB9ABC'), isTrue);

          // Poland
          expect(CallsignValidator.isValidLicensedCallsign('SP1ABC'), isTrue);

          // Czech Republic
          expect(CallsignValidator.isValidLicensedCallsign('OK1ABC'), isTrue);

          // Portugal
          expect(CallsignValidator.isValidLicensedCallsign('CT1ABC'), isTrue);
        });

        test('should validate other international callsigns', () {
          // Canada
          expect(CallsignValidator.isValidLicensedCallsign('VE1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('VA3XYZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('VE9WWA'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('VE7ON'), isTrue);

          // Australia
          expect(CallsignValidator.isValidLicensedCallsign('VK1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('VK4XYZ'), isTrue);

          // Brazil
          expect(CallsignValidator.isValidLicensedCallsign('PY1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('ZW5B'), isTrue);

          // Argentina
          expect(CallsignValidator.isValidLicensedCallsign('LU1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('LR1WWA'), isTrue);

          // Russia
          expect(CallsignValidator.isValidLicensedCallsign('UA1ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('RZ3ABC'), isTrue);

          // China
          expect(CallsignValidator.isValidLicensedCallsign('BV1ABC'), isTrue);

          // South Korea
          expect(CallsignValidator.isValidLicensedCallsign('HL1ABC'), isTrue);

          // Romania
          expect(CallsignValidator.isValidLicensedCallsign('YO0WWA'), isTrue);

          // Ecuador
          expect(CallsignValidator.isValidLicensedCallsign('HC1MD'), isTrue);

          // Philippines
          expect(CallsignValidator.isValidLicensedCallsign('DV4XDM'), isTrue);

          // Dominican Republic
          expect(CallsignValidator.isValidLicensedCallsign('HI7WWA'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('HI8WWA'), isTrue);

          // Sweden
          expect(CallsignValidator.isValidLicensedCallsign('SB9WWA'), isTrue);

          // Aruba
          expect(CallsignValidator.isValidLicensedCallsign('P40AA'), isTrue);

          // Costa Rica
          expect(CallsignValidator.isValidLicensedCallsign('TI4LAS'), isTrue);

          // Canary Islands
          expect(CallsignValidator.isValidLicensedCallsign('EA8HZ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('EG8WW'), isTrue);

          // Ukraine
          expect(CallsignValidator.isValidLicensedCallsign('EM0WWA'), isTrue);

          // Azores
          expect(CallsignValidator.isValidLicensedCallsign('CR2WWA'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('CQ7WWA'), isTrue);

          // UK special
          expect(CallsignValidator.isValidLicensedCallsign('GB2WWA'), isTrue);

          // Trinidad & Tobago (digit prefix)
          expect(CallsignValidator.isValidLicensedCallsign('9Y4C'), isTrue);

          // Jamaica (digit prefix)
          expect(CallsignValidator.isValidLicensedCallsign('6Y5PW'), isTrue);
        });
      });

      group('Short suffix callsigns', () {
        test('should validate callsigns with 1-letter suffix', () {
          expect(CallsignValidator.isValidLicensedCallsign('W4I'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('N1W'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('N9W'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('K5N'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KB3Z'), isTrue);
        });

        test('should validate callsigns with 2-letter suffix', () {
          expect(CallsignValidator.isValidLicensedCallsign('K4JH'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('VE7ON'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('ZW5B'), isTrue);
        });
      });

      group('Real-world callsigns from WWA event', () {
        test('should validate various real callsigns', () {
          // USA callsigns
          expect(CallsignValidator.isValidLicensedCallsign('K5EK'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KM6TNQ'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KN6HEC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KD6DKH'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('WD6ABC'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W4MDK'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('WB3FZV'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('WA9RNE'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KC2NDA'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('N4NJJ'), isTrue);

          // Italian callsigns
          expect(CallsignValidator.isValidLicensedCallsign('IU2VUD'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('II3WWA'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('II7WWA'), isTrue);

          // With modifiers
          expect(CallsignValidator.isValidLicensedCallsign('HC1MD/2'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('KP5/NP3VI'), isTrue);
        });
      });

      group('Invalid callsigns', () {
        test('should reject empty or whitespace', () {
          expect(CallsignValidator.isValidLicensedCallsign(''), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('   '), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('\t'), isFalse);
        });

        test('should reject callsigns that are too short', () {
          expect(CallsignValidator.isValidLicensedCallsign('I'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('I0'), isFalse);
        });

        test('should reject callsigns with invalid characters', () {
          expect(CallsignValidator.isValidLicensedCallsign('I0AB@C'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('I0AB-C'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('I0AB C'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('I0AB#C'), isFalse);
        });

        test('should reject callsigns without numbers', () {
          expect(CallsignValidator.isValidLicensedCallsign('IABCD'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('ABCDE'), isFalse);
        });

        test('should reject callsigns starting with numbers only', () {
          expect(CallsignValidator.isValidLicensedCallsign('123ABC'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('1ABC'), isFalse);
        });

        test('should reject obvious invalid strings', () {
          expect(CallsignValidator.isValidLicensedCallsign('UNKNOWN'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('N/A'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('TEST'), isFalse);
          expect(CallsignValidator.isValidLicensedCallsign('HELLO'), isFalse);
        });
      });

      group('Case insensitivity', () {
        test('should validate lowercase callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('iu4vrb'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('w1aw'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('dl1abc'), isTrue);
        });

        test('should validate mixed case callsigns', () {
          expect(CallsignValidator.isValidLicensedCallsign('Iu4Vrb'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W1aW'), isTrue);
        });
      });

      group('Callsigns with prefix/suffix modifiers', () {
        test('should validate callsigns with portable suffix', () {
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/P'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W1AW/P'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DL1ABC/P'), isTrue);
        });

        test('should validate callsigns with mobile suffix', () {
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/M'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W1AW/M'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/MM'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/AM'), isTrue);
        });

        test('should validate callsigns with numeric suffix (area)', () {
          expect(CallsignValidator.isValidLicensedCallsign('W1AW/4'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/0'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('K1ABC/6'), isTrue);
        });

        test('should validate callsigns with QRP suffix', () {
          expect(CallsignValidator.isValidLicensedCallsign('IU4VRB/QRP'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('W1AW/QRP'), isTrue);
        });

        test('should validate callsigns with country prefix', () {
          // Operating from different call area
          expect(CallsignValidator.isValidLicensedCallsign('IK4/IU4VRB'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('F/IU4VRB'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('DL/W1AW'), isTrue);
          expect(CallsignValidator.isValidLicensedCallsign('EA6/G0ABC'), isTrue);
        });

        test('should validate callsigns with both prefix and suffix', () {
          expect(
            CallsignValidator.isValidLicensedCallsign('IK4/IU4VRB/P'),
            isTrue,
          );
          expect(
            CallsignValidator.isValidLicensedCallsign('F/DL1ABC/M'),
            isTrue,
          );
          expect(
            CallsignValidator.isValidLicensedCallsign('EA6/G0ABC/QRP'),
            isTrue,
          );
        });

        test('should validate callsigns with multiple suffixes', () {
          expect(
            CallsignValidator.isValidLicensedCallsign('IU4VRB/P/QRP'),
            isTrue,
          );
          expect(
            CallsignValidator.isValidLicensedCallsign('W1AW/4/P'),
            isTrue,
          );
        });
      });
    });

    group('isValidSwlCallsign', () {
      group('Italian SWL callsigns', () {
        test('should validate Italian SWL format (I-number-SWL)', () {
          expect(CallsignValidator.isValidSwlCallsign('I1-12345-SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('I2-54321-SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('I0-99999-SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('I9-00001-SWL'), isTrue);
        });

        test('should validate Italian SWL without dashes', () {
          expect(CallsignValidator.isValidSwlCallsign('I112345SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('I254321SWL'), isTrue);
        });

        test('should validate Italian SWL with region prefix', () {
          expect(CallsignValidator.isValidSwlCallsign('IT2001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('IS0001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('I5-1990'), isTrue);
        });
      });

      group('German SWL callsigns', () {
        test('should validate German DE prefix', () {
          expect(CallsignValidator.isValidSwlCallsign('DE1ABC'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('DE2XYZ'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('DE0AAA'), isTrue);
        });
      });

      group('USA SWL callsigns', () {
        test('should validate USA SWL formats', () {
          expect(CallsignValidator.isValidSwlCallsign('WD8001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA7009SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA8010SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA2002SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('KC7001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA6012SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA2003SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4014SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4015SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA6013SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4016SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4017SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA6014SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA9005SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA9006SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA9007SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4018SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4019SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA8011SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA0008SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA9008SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA4020SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA0009SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA9009SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('AB1001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('WA0010SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('NL0001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('KG4001XXX'), isTrue);
        });
      });

      group('UK SWL callsigns', () {
        test('should validate UK SWL formats', () {
          expect(CallsignValidator.isValidSwlCallsign('GW4002SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('G-14167'), isTrue);
        });
      });

      group('Belgian SWL callsigns', () {
        test('should validate Belgian ONL format', () {
          expect(CallsignValidator.isValidSwlCallsign('ONL9357'), isTrue);
        });
      });

      group('Canadian SWL callsigns', () {
        test('should validate Canadian VE formats', () {
          expect(CallsignValidator.isValidSwlCallsign('VE3005SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('VE5001SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('VE3006SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('VE3007SWL'), isTrue);
        });
      });

      group('Other international SWL callsigns', () {
        test('should validate various international SWL formats', () {
          // Ecuador
          expect(CallsignValidator.isValidSwlCallsign('HC1001SWL'), isTrue);
          // Australia
          expect(CallsignValidator.isValidSwlCallsign('VK3001SWL'), isTrue);
          // Greece
          expect(CallsignValidator.isValidSwlCallsign('SVL1AA'), isTrue);
        });
      });

      group('International SWL formats', () {
        test('should validate various SWL formats', () {
          // UK format
          expect(CallsignValidator.isValidSwlCallsign('RS12345'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('RS99999'), isTrue);

          // Generic formats with SWL suffix
          expect(CallsignValidator.isValidSwlCallsign('PA-12345-SWL'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('DL-12345-SWL'), isTrue);

          // Japanese format
          expect(CallsignValidator.isValidSwlCallsign('JA1-12345'), isTrue);
        });
      });

      group('Invalid SWL callsigns', () {
        test('should reject empty or whitespace', () {
          expect(CallsignValidator.isValidSwlCallsign(''), isFalse);
          expect(CallsignValidator.isValidSwlCallsign('   '), isFalse);
        });

        test('should reject callsigns that are too short', () {
          expect(CallsignValidator.isValidSwlCallsign('I1'), isFalse);
          expect(CallsignValidator.isValidSwlCallsign('DE'), isFalse);
        });

        test('should reject callsigns with invalid characters', () {
          expect(CallsignValidator.isValidSwlCallsign('I1@SWL'), isFalse);
          expect(CallsignValidator.isValidSwlCallsign('DE#123'), isFalse);
        });
      });

      group('Case insensitivity', () {
        test('should validate lowercase SWL callsigns', () {
          expect(CallsignValidator.isValidSwlCallsign('i1-12345-swl'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('de1abc'), isTrue);
        });

        test('should validate mixed case SWL callsigns', () {
          expect(CallsignValidator.isValidSwlCallsign('I1-12345-Swl'), isTrue);
          expect(CallsignValidator.isValidSwlCallsign('De1Abc'), isTrue);
        });
      });
    });
  });
}
