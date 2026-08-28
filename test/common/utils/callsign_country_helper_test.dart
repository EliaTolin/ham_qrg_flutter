import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/callsign_country_helper.dart';

void main() {
  group('CallsignCountryHelper', () {
    group('isoCodeOf', () {
      group('single letter ITU blocks', () {
        test('should resolve Italian callsigns', () {
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IK4XYZ'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('I0ABC'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IS0ABC'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IT9ABC'), 'IT');
        });

        test('should resolve US callsigns across all four blocks', () {
          expect(CallsignCountryHelper.isoCodeOf('W1AW'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('K1ABC'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('N0CALL'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('AA1A'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('KL7AB'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('KH6ABC'), 'US');
        });

        test('should resolve UK callsigns across all three blocks', () {
          expect(CallsignCountryHelper.isoCodeOf('G0ABC'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('M0ABC'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('2E0ABC'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('GM4ABC'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('GW0ABC'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('GI4ABC'), 'GB');
        });

        test('should resolve French, Russian and Chinese callsigns', () {
          expect(CallsignCountryHelper.isoCodeOf('F5ABC'), 'FR');
          expect(CallsignCountryHelper.isoCodeOf('R3ABC'), 'RU');
          expect(CallsignCountryHelper.isoCodeOf('BY1ABC'), 'CN');
        });
      });

      group('two character ITU blocks', () {
        test('should resolve common European prefixes', () {
          expect(CallsignCountryHelper.isoCodeOf('DL1ABC'), 'DE');
          expect(CallsignCountryHelper.isoCodeOf('EA3ABC'), 'ES');
          expect(CallsignCountryHelper.isoCodeOf('ON4ABC'), 'BE');
          expect(CallsignCountryHelper.isoCodeOf('PA0ABC'), 'NL');
          expect(CallsignCountryHelper.isoCodeOf('OE1ABC'), 'AT');
          expect(CallsignCountryHelper.isoCodeOf('HB9ABC'), 'CH');
          expect(CallsignCountryHelper.isoCodeOf('SP5ABC'), 'PL');
          expect(CallsignCountryHelper.isoCodeOf('OK1ABC'), 'CZ');
          expect(CallsignCountryHelper.isoCodeOf('OM3ABC'), 'SK');
          expect(CallsignCountryHelper.isoCodeOf('S51ABC'), 'SI');
          expect(CallsignCountryHelper.isoCodeOf('9A1ABC'), 'HR');
          expect(CallsignCountryHelper.isoCodeOf('SV1ABC'), 'GR');
          expect(CallsignCountryHelper.isoCodeOf('CT1ABC'), 'PT');
          expect(CallsignCountryHelper.isoCodeOf('LA1ABC'), 'NO');
          expect(CallsignCountryHelper.isoCodeOf('SM0ABC'), 'SE');
          expect(CallsignCountryHelper.isoCodeOf('OZ1ABC'), 'DK');
          expect(CallsignCountryHelper.isoCodeOf('OH2ABC'), 'FI');
          expect(CallsignCountryHelper.isoCodeOf('EI2ABC'), 'IE');
          expect(CallsignCountryHelper.isoCodeOf('LZ1ABC'), 'BG');
          expect(CallsignCountryHelper.isoCodeOf('YO3ABC'), 'RO');
          expect(CallsignCountryHelper.isoCodeOf('HA5ABC'), 'HU');
        });

        test('should resolve prefixes outside Europe', () {
          expect(CallsignCountryHelper.isoCodeOf('JA1ABC'), 'JP');
          expect(CallsignCountryHelper.isoCodeOf('VK3ABC'), 'AU');
          expect(CallsignCountryHelper.isoCodeOf('ZL1ABC'), 'NZ');
          expect(CallsignCountryHelper.isoCodeOf('VE3ABC'), 'CA');
          expect(CallsignCountryHelper.isoCodeOf('PY2ABC'), 'BR');
          expect(CallsignCountryHelper.isoCodeOf('LU1ABC'), 'AR');
          expect(CallsignCountryHelper.isoCodeOf('ZS6ABC'), 'ZA');
          expect(CallsignCountryHelper.isoCodeOf('VU2ABC'), 'IN');
          expect(CallsignCountryHelper.isoCodeOf('XE1ABC'), 'MX');
          expect(CallsignCountryHelper.isoCodeOf('9V1ABC'), 'SG');
          expect(CallsignCountryHelper.isoCodeOf('4X1ABC'), 'IL');
        });

        test('should resolve prefixes that start with a digit', () {
          expect(CallsignCountryHelper.isoCodeOf('3A2ABC'), 'MC');
          expect(CallsignCountryHelper.isoCodeOf('9H1ABC'), 'MT');
          expect(CallsignCountryHelper.isoCodeOf('T77ABC'), 'SM');
          expect(CallsignCountryHelper.isoCodeOf('5B4ABC'), 'CY');
          expect(CallsignCountryHelper.isoCodeOf('C31ABC'), 'AD');
        });
      });

      group('territories that the ITU hides inside a parent block', () {
        test('should resolve French overseas territories', () {
          expect(CallsignCountryHelper.isoCodeOf('FG5XX'), 'GP');
          expect(CallsignCountryHelper.isoCodeOf('FM5XX'), 'MQ');
          expect(CallsignCountryHelper.isoCodeOf('FR5XX'), 'RE');
          expect(CallsignCountryHelper.isoCodeOf('FK8XX'), 'NC');
          expect(CallsignCountryHelper.isoCodeOf('FO5XX'), 'PF');
          expect(CallsignCountryHelper.isoCodeOf('FY5XX'), 'GF');
          expect(CallsignCountryHelper.isoCodeOf('FP5XX'), 'PM');
          expect(CallsignCountryHelper.isoCodeOf('FH4XX'), 'YT');
          expect(CallsignCountryHelper.isoCodeOf('FT8WM'), 'TF');
        });

        test('should keep metropolitan France for Corsica', () {
          expect(CallsignCountryHelper.isoCodeOf('TK5XX'), 'FR');
        });

        test('should resolve UK crown dependencies', () {
          expect(CallsignCountryHelper.isoCodeOf('GD4ABC'), 'IM');
          expect(CallsignCountryHelper.isoCodeOf('MD0ABC'), 'IM');
          expect(CallsignCountryHelper.isoCodeOf('GJ3ABC'), 'JE');
          expect(CallsignCountryHelper.isoCodeOf('MJ0ABC'), 'JE');
          expect(CallsignCountryHelper.isoCodeOf('GU4ABC'), 'GG');
          expect(CallsignCountryHelper.isoCodeOf('MU0ABC'), 'GG');
        });

        test('should resolve UK overseas territories', () {
          expect(CallsignCountryHelper.isoCodeOf('VP2EXX'), 'AI');
          expect(CallsignCountryHelper.isoCodeOf('VP2MXX'), 'MS');
          expect(CallsignCountryHelper.isoCodeOf('VP2VXX'), 'VG');
          expect(CallsignCountryHelper.isoCodeOf('VP5XX'), 'TC');
          expect(CallsignCountryHelper.isoCodeOf('VP6XX'), 'PN');
          expect(CallsignCountryHelper.isoCodeOf('VP8XX'), 'FK');
          expect(CallsignCountryHelper.isoCodeOf('VP9XX'), 'BM');
          expect(CallsignCountryHelper.isoCodeOf('ZB2XX'), 'GI');
          expect(CallsignCountryHelper.isoCodeOf('ZD7XX'), 'SH');
          expect(CallsignCountryHelper.isoCodeOf('ZF2XX'), 'KY');
        });

        test('should resolve US territories', () {
          expect(CallsignCountryHelper.isoCodeOf('KP4XX'), 'PR');
          expect(CallsignCountryHelper.isoCodeOf('NP3XX'), 'PR');
          expect(CallsignCountryHelper.isoCodeOf('WP4XX'), 'PR');
          expect(CallsignCountryHelper.isoCodeOf('KP2XX'), 'VI');
          expect(CallsignCountryHelper.isoCodeOf('KH2XX'), 'GU');
          expect(CallsignCountryHelper.isoCodeOf('AH2XX'), 'GU');
          expect(CallsignCountryHelper.isoCodeOf('KH0XX'), 'MP');
          expect(CallsignCountryHelper.isoCodeOf('KH8XX'), 'AS');
        });

        test('should resolve Nordic dependencies', () {
          expect(CallsignCountryHelper.isoCodeOf('OX3ABC'), 'GL');
          expect(CallsignCountryHelper.isoCodeOf('OY1ABC'), 'FO');
          expect(CallsignCountryHelper.isoCodeOf('JW5ABC'), 'SJ');
          expect(CallsignCountryHelper.isoCodeOf('JX2ABC'), 'SJ');
          expect(CallsignCountryHelper.isoCodeOf('OH0ABC'), 'AX');
          expect(CallsignCountryHelper.isoCodeOf('OJ0ABC'), 'AX');
        });

        test('should resolve Liechtenstein inside the Swiss block', () {
          expect(CallsignCountryHelper.isoCodeOf('HB0ABC'), 'LI');
          expect(CallsignCountryHelper.isoCodeOf('HB9ABC'), 'CH');
        });

        test('should resolve the Dutch Caribbean on the digit', () {
          expect(CallsignCountryHelper.isoCodeOf('PJ2XX'), 'CW');
          expect(CallsignCountryHelper.isoCodeOf('PJ4XX'), 'BQ');
          expect(CallsignCountryHelper.isoCodeOf('PJ5XX'), 'BQ');
          expect(CallsignCountryHelper.isoCodeOf('PJ6XX'), 'BQ');
          expect(CallsignCountryHelper.isoCodeOf('PJ7XX'), 'SX');
          expect(CallsignCountryHelper.isoCodeOf('P4/AB1CD'), 'AW');
        });

        test('should split the shared 3D block between Eswatini and Fiji', () {
          expect(CallsignCountryHelper.isoCodeOf('3DA0XX'), 'SZ');
          expect(CallsignCountryHelper.isoCodeOf('3D2XX'), 'FJ');
        });

        test('should resolve Pacific dependencies', () {
          expect(CallsignCountryHelper.isoCodeOf('VK9LXX'), 'AU');
          expect(CallsignCountryHelper.isoCodeOf('VK9XXX'), 'CX');
          expect(CallsignCountryHelper.isoCodeOf('VK9CXX'), 'CC');
          expect(CallsignCountryHelper.isoCodeOf('VK9NXX'), 'NF');
          expect(CallsignCountryHelper.isoCodeOf('ZK1XX'), 'CK');
          expect(CallsignCountryHelper.isoCodeOf('ZK2XX'), 'NU');
          expect(CallsignCountryHelper.isoCodeOf('ZK3XX'), 'TK');
        });

        test('should resolve Taiwan, Hong Kong and Macao', () {
          expect(CallsignCountryHelper.isoCodeOf('BV2ABC'), 'TW');
          expect(CallsignCountryHelper.isoCodeOf('BX3ABC'), 'TW');
          expect(CallsignCountryHelper.isoCodeOf('VR2ABC'), 'HK');
          expect(CallsignCountryHelper.isoCodeOf('XX9ABC'), 'MO');
        });

        test('should resolve entities with no ITU allocation', () {
          expect(CallsignCountryHelper.isoCodeOf('S01XX'), 'EH');
          expect(CallsignCountryHelper.isoCodeOf('CE9XX'), 'AQ');
        });
      });

      group('modifiers', () {
        test('should ignore operational suffixes', () {
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/P'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/M'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/MM'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/AM'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/QRP'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/P/QRP'), 'IT');
        });

        test('should ignore call area digits', () {
          expect(CallsignCountryHelper.isoCodeOf('W1AW/4'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('W1AW/4/QRP'), 'US');
        });

        test('should let a leading prefix win over the base callsign', () {
          expect(CallsignCountryHelper.isoCodeOf('F/IU4VRB'), 'FR');
          expect(CallsignCountryHelper.isoCodeOf('EA6/DL1ABC'), 'ES');
          expect(CallsignCountryHelper.isoCodeOf('9A/S51ABC'), 'HR');
          expect(CallsignCountryHelper.isoCodeOf('IK4/IU4VRB'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('KH0/JA1ABC'), 'MP');
        });

        test('should let a trailing prefix win over the base callsign', () {
          expect(CallsignCountryHelper.isoCodeOf('W1AW/KH6'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('DL1ABC/HB9'), 'CH');
          expect(CallsignCountryHelper.isoCodeOf('K1ABC/VE3'), 'CA');
        });

        test(
          'should read a leading single letter as a prefix, not a suffix',
          () {
            expect(CallsignCountryHelper.isoCodeOf('M/DL1ABC'), 'GB');
            expect(CallsignCountryHelper.isoCodeOf('R/DL1ABC'), 'RU');
            expect(CallsignCountryHelper.isoCodeOf('I/DL1ABC'), 'IT');
          },
        );

        test('should combine a leading prefix with an operational suffix', () {
          expect(CallsignCountryHelper.isoCodeOf('F/IU4VRB/P'), 'FR');
          expect(CallsignCountryHelper.isoCodeOf('FR/DL1ABC/P'), 'RE');
        });
      });

      group('normalisation', () {
        test('should be case insensitive', () {
          expect(CallsignCountryHelper.isoCodeOf('iu4vrb'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('Dl1Abc'), 'DE');
          expect(CallsignCountryHelper.isoCodeOf('f/iu4vrb/p'), 'FR');
        });

        test('should trim surrounding whitespace', () {
          expect(CallsignCountryHelper.isoCodeOf('  W1AW  '), 'US');
        });
      });

      group('unresolvable input', () {
        test('should return null for empty or blank input', () {
          expect(CallsignCountryHelper.isoCodeOf(''), isNull);
          expect(CallsignCountryHelper.isoCodeOf('   '), isNull);
          expect(CallsignCountryHelper.isoCodeOf('/'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('/P'), isNull);
        });

        test('should ignore decoration coming from spot feeds', () {
          // All of these forms appear verbatim in the live POTA feed, which
          // is fed by RBN skimmers that append a node marker.
          expect(CallsignCountryHelper.isoCodeOf('AA0O-#'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('K1RA-4-#'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('DL8LAS-3-#'), 'DE');
          expect(CallsignCountryHelper.isoCodeOf('MM0ZBH-#'), 'GB');
          expect(CallsignCountryHelper.isoCodeOf('K2PO/7-#'), 'US');
          expect(CallsignCountryHelper.isoCodeOf('IU4VRB/*'), 'IT');
          expect(CallsignCountryHelper.isoCodeOf('DL1ABC/P (QRT)'), 'DE');
        });

        test('should return null for unallocated prefixes', () {
          expect(CallsignCountryHelper.isoCodeOf('QQ1ABC'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('0A1ABC'), isNull);
        });

        test('should return null for international organisations', () {
          expect(CallsignCountryHelper.isoCodeOf('4U1ITU'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('4U1UN'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('4Y1A'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('C7A'), isNull);
        });

        test('should return null for entities without an ISO code', () {
          expect(CallsignCountryHelper.isoCodeOf('Z61XX'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('1A0XX'), isNull);
          expect(CallsignCountryHelper.isoCodeOf('1S0XX'), isNull);
        });
      });
    });

    group('flagOfIsoCode', () {
      test('should build the flag emoji from two regional indicators', () {
        expect(CallsignCountryHelper.flagOfIsoCode('IT'), '\u{1F1EE}\u{1F1F9}');
        expect(CallsignCountryHelper.flagOfIsoCode('US'), '\u{1F1FA}\u{1F1F8}');
        expect(CallsignCountryHelper.flagOfIsoCode('GB'), '\u{1F1EC}\u{1F1E7}');
        expect(CallsignCountryHelper.flagOfIsoCode('JP'), '\u{1F1EF}\u{1F1F5}');
      });

      test('should accept lowercase and padded codes', () {
        expect(
          CallsignCountryHelper.flagOfIsoCode(' it '),
          CallsignCountryHelper.flagOfIsoCode('IT'),
        );
      });

      test('should return null for anything that is not two letters', () {
        expect(CallsignCountryHelper.flagOfIsoCode(''), isNull);
        expect(CallsignCountryHelper.flagOfIsoCode('I'), isNull);
        expect(CallsignCountryHelper.flagOfIsoCode('ITA'), isNull);
        expect(CallsignCountryHelper.flagOfIsoCode('I1'), isNull);
        expect(CallsignCountryHelper.flagOfIsoCode('--'), isNull);
      });
    });

    group('flagOf', () {
      test('should return the flag of the issuing country', () {
        expect(CallsignCountryHelper.flagOf('IU4VRB'), '\u{1F1EE}\u{1F1F9}');
        expect(CallsignCountryHelper.flagOf('W1AW'), '\u{1F1FA}\u{1F1F8}');
        expect(CallsignCountryHelper.flagOf('KP4XX'), '\u{1F1F5}\u{1F1F7}');
        expect(CallsignCountryHelper.flagOf('FR5XX'), '\u{1F1F7}\u{1F1EA}');
      });

      test('should return null when the country cannot be resolved', () {
        expect(CallsignCountryHelper.flagOf('4U1ITU'), isNull);
        expect(CallsignCountryHelper.flagOf('QQ1ABC'), isNull);
        expect(CallsignCountryHelper.flagOf(''), isNull);
      });

      test('should produce the literal flag emoji', () {
        expect(CallsignCountryHelper.flagOf('IU4VRB'), '🇮🇹');
        expect(CallsignCountryHelper.flagOf('W1AW'), '🇺🇸');
        expect(CallsignCountryHelper.flagOf('DL1ABC'), '🇩🇪');
        expect(CallsignCountryHelper.flagOf('G0ABC'), '🇬🇧');
        expect(CallsignCountryHelper.flagOf('JA1ABC'), '🇯🇵');
        expect(CallsignCountryHelper.flagOf('F5ABC'), '🇫🇷');
        expect(CallsignCountryHelper.flagOf('EA3ABC'), '🇪🇸');
        expect(CallsignCountryHelper.flagOf('KP4XX'), '🇵🇷');
        expect(CallsignCountryHelper.flagOf('FR5XX'), '🇷🇪');
        expect(CallsignCountryHelper.flagOf('GD4ABC'), '🇮🇲');
        expect(CallsignCountryHelper.flagOf('PJ7XX'), '🇸🇽');
        expect(CallsignCountryHelper.flagOf('3D2XX'), '🇫🇯');
        expect(CallsignCountryHelper.flagOf('BV2ABC'), '🇹🇼');
        expect(CallsignCountryHelper.flagOf('OX3ABC'), '🇬🇱');
      });

      test(
        'should return a well formed flag for every reachable prefix',
        () {
          const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
          var resolved = 0;

          void check(String prefix) {
            final isoCode = CallsignCountryHelper.isoCodeOf(prefix);
            if (isoCode == null) return;
            resolved++;

            // A country was resolved, so a flag must always follow.
            expect(isoCode, matches(RegExp(r'^[A-Z]{2}$')), reason: prefix);

            final flag = CallsignCountryHelper.flagOf(prefix);
            expect(flag, isNotNull, reason: prefix);

            // Exactly two regional indicator symbols: anything else would
            // render as loose letters or as an unrelated glyph.
            final runes = flag!.runes.toList();
            expect(runes.length, 2, reason: prefix);
            for (final rune in runes) {
              expect(rune, inInclusiveRange(0x1F1E6, 0x1F1FF), reason: prefix);
            }

            // The pair must round-trip back to the ISO code it came from.
            final decoded = String.fromCharCodes(
              runes.map((rune) => rune - 0x1F1E6 + 0x41),
            );
            expect(decoded, isoCode, reason: prefix);
          }

          for (final first in alphabet.split('')) {
            check(first);
            for (final second in alphabet.split('')) {
              check('$first$second');
              for (final third in alphabet.split('')) {
                check('$first$second$third');
              }
            }
          }

          // Guards against the sweep silently degenerating into a no-op.
          expect(resolved, greaterThan(20000));
        },
      );
    });
  });
}
