import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/unit_format_helper.dart';
import 'package:hamqrg/common/utils/unit_system.dart';

/// Trascrizione della tabella di `contracts/unit_format_contract.md`.
///
/// È il criterio di accettazione SC-006: se una riga cambia di un carattere,
/// il test fallisce. Ogni caso è nella tabella per una ragione, annotata.
void main() {
  const en = Locale('en');
  const it = Locale('it');
  const metric = UnitSystem.metric;
  const imperial = UnitSystem.imperial;

  group('UnitFormat.distance', () {
    // metri, metrico atteso, imperiale atteso, perché è nella tabella
    const cases = <(double, String, String, String)>[
      (0, '0 m', '0 ft', 'zero non è un caso speciale'),
      (1, '1 m', '3 ft', 'valori minimi'),
      (300, '300 m', '984 ft', 'distanza breve tipica'),
      (999, '999 m', '3,278 ft', 'ultimo valore sotto il km'),
      (999.6, '1.0 km', '3,280 ft', "l'arrotondamento fa scattare il km"),
      (1000, '1.0 km', '3,281 ft', 'confine metrico'),
      (1609, '1.6 km', '5,279 ft', 'ultimo valore ancora in piedi'),
      (
        1609.3,
        '1.6 km',
        '1.0 mi',
        'il guard: senza arrotondare uscirebbe 5,280 ft'
      ),
      (1609.344, '1.6 km', '1.0 mi', 'un miglio esatto'),
      (12400, '12.4 km', '7.7 mi', 'distanza tipica da un ripetitore'),
      (112000, '112.0 km', '69.6 mi', 'lunga distanza, decimale mantenuto'),
      (400000, '400.0 km', '248.5 mi', 'raggio massimo come distanza'),
    ];

    for (final (meters, expectedMetric, expectedImperial, why) in cases) {
      test('$meters m → $expectedMetric / $expectedImperial ($why)', () {
        expect(UnitFormat.distance(meters, metric, en), expectedMetric);
        expect(UnitFormat.distance(meters, imperial, en), expectedImperial);
      });
    }
  });

  group('UnitFormat.elevation', () {
    const cases = <(double, String, String, String)>[
      (0, '0 m', '0 ft', 'livello del mare'),
      (-5, '-5 m', '-16 ft', 'sotto il livello del mare: il segno resta'),
      (350, '350 m', '1,148 ft', 'collina'),
      (1240, '1,240 m', '4,068 ft', 'cima SOTA: verifica il raggruppamento'),
    ];

    for (final (meters, expectedMetric, expectedImperial, why) in cases) {
      test('$meters m → $expectedMetric / $expectedImperial ($why)', () {
        expect(UnitFormat.elevation(meters, metric, en), expectedMetric);
        expect(UnitFormat.elevation(meters, imperial, en), expectedImperial);
      });
    }
  });

  group('UnitFormat.threshold — arrotondata per difetto (FR-016)', () {
    test('400 km (raggio massimo feedback)', () {
      expect(UnitFormat.threshold(400000, metric, en), '400 km');
      expect(UnitFormat.threshold(400000, imperial, en), '248 mi');
    });

    test('200 m (duplicato postazione): i piedi si troncano alla decina', () {
      expect(UnitFormat.threshold(200, metric, en), '200 m');
      expect(UnitFormat.threshold(200, imperial, en), '650 ft');
    });

    test('una soglia è sempre più stretta della stessa distanza', () {
      // 248 mi contro 248.5 mi: la differenza è il punto di FR-016.
      expect(UnitFormat.threshold(400000, imperial, en), '248 mi');
      expect(UnitFormat.distance(400000, imperial, en), '248.5 mi');
    });
  });

  group('UnitFormat.presetRadius — al più vicino (FR-009)', () {
    const cases = <(double, String, String)>[
      (80, '80 km', '50 mi'),
      (100, '100 km', '62 mi'),
      (150, '150 km', '93 mi'),
      (10, '10 km', '6 mi'),
      (25, '25 km', '16 mi'),
      (50, '50 km', '31 mi'),
    ];

    for (final (km, expectedMetric, expectedImperial) in cases) {
      test('$km km → $expectedMetric / $expectedImperial', () {
        expect(UnitFormat.presetRadius(km, metric, en), expectedMetric);
        expect(UnitFormat.presetRadius(km, imperial, en), expectedImperial);
      });
    }
  });

  group('una soglia dichiarata non è mai più larga di quella reale (FR-016)',
      () {
    // Proprietà, non singoli casi: è la garanzia su cui poggia FR-016, e
    // vale la pena verificarla su tutto l'intervallo invece che su due
    // valori scelti a mano.
    test('vale per ogni valore, in entrambi i sistemi', () {
      const metresPerMile = 1609.344;
      const metresPerFoot = 0.3048;
      for (var metres = 10.0; metres <= 500000; metres *= 1.3) {
        for (final system in [metric, imperial]) {
          final text = UnitFormat.threshold(metres, system, en);
          final number =
              double.parse(text.split(' ').first.replaceAll(',', ''));
          final declared = switch (text.split(' ').last) {
            'km' => number * 1000,
            'm' => number,
            'mi' => number * metresPerMile,
            _ => number * metresPerFoot,
          };
          expect(
            declared,
            lessThanOrEqualTo(metres),
            reason: '$metres m → "$text" prometterebbe più raggio del reale',
          );
        }
      }
    });
  });

  group('convenzione numerica della lingua attiva (FR-015)', () {
    test('il separatore decimale segue la lingua, non il sistema', () {
      expect(UnitFormat.distance(12400, metric, en), '12.4 km');
      expect(UnitFormat.distance(12400, metric, it), '12,4 km');
    });

    test('il raggruppamento delle migliaia segue la lingua', () {
      expect(UnitFormat.elevation(1240, metric, en), '1,240 m');
      expect(UnitFormat.elevation(1240, metric, it), '1.240 m');
    });

    test('vale anche in imperiale', () {
      expect(UnitFormat.distance(12400, imperial, en), '7.7 mi');
      expect(UnitFormat.distance(12400, imperial, it), '7,7 mi');
    });
  });

  group('simbolo dell unità lunga', () {
    test('serve al mock sfocato del teaser Pro', () {
      expect(UnitFormat.longSymbol(metric), 'km');
      expect(UnitFormat.longSymbol(imperial), 'mi');
    });
  });

  group('UnitSystem.fromName', () {
    test('una chiave assente o sconosciuta torna ad auto', () {
      expect(UnitSystem.fromName(null), UnitSystem.auto);
      expect(UnitSystem.fromName('kilometres'), UnitSystem.auto);
      expect(UnitSystem.fromName('metric'), UnitSystem.metric);
      expect(UnitSystem.fromName('imperial'), UnitSystem.imperial);
    });
  });
}
