import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:hamqrg/common/widgets/units/unit_system_scope.dart';
import 'package:hamqrg/src/features/profile/provider/unit_system_notifier/unit_system_notifier.dart';

/// Verifica FR-004 / SC-003: una schermata **già montata** deve aggiornarsi
/// da sola quando la preferenza cambia, senza riavvio e senza che il widget
/// debba sapere che esiste una preferenza.
void main() {
  testWidgets('cambiando sistema, un discendente già montato si ricostruisce',
      (tester) async {
    var system = UnitSystem.metric;
    late StateSetter rebuildScope;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            rebuildScope = setState;
            return UnitSystemScope(
              system: system,
              locale: const Locale('en'),
              child: const _DistanceLabel(),
            );
          },
        ),
      ),
    );

    expect(find.text('12.4 km'), findsOneWidget);

    rebuildScope(() => system = UnitSystem.imperial);
    await tester.pump();

    expect(find.text('7.7 mi'), findsOneWidget);
    expect(find.text('12.4 km'), findsNothing);
  });

  testWidgets('la lingua cambia il separatore senza cambiare unità',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: UnitSystemScope(
          system: UnitSystem.metric,
          locale: Locale('it'),
          child: _DistanceLabel(),
        ),
      ),
    );

    expect(find.text('12,4 km'), findsOneWidget);
  });

  group('resolveUnitSystem', () {
    test('una scelta esplicita prevale sempre sulla regione', () {
      expect(
        resolveUnitSystem(UnitSystem.metric, 'US'),
        UnitSystem.metric,
      );
      expect(
        resolveUnitSystem(UnitSystem.imperial, 'IT'),
        UnitSystem.imperial,
      );
    });

    test('auto segue la regione del dispositivo', () {
      expect(
        resolveUnitSystem(UnitSystem.auto, 'US'),
        UnitSystem.imperial,
      );
      expect(
        resolveUnitSystem(UnitSystem.auto, 'LR'),
        UnitSystem.imperial,
      );
      expect(
        resolveUnitSystem(UnitSystem.auto, 'IT'),
        UnitSystem.metric,
      );
    });

    test('regione assente o sconosciuta ricade sul metrico', () {
      expect(
        resolveUnitSystem(UnitSystem.auto, null),
        UnitSystem.metric,
      );
      expect(
        resolveUnitSystem(UnitSystem.auto, 'ZZ'),
        UnitSystem.metric,
      );
    });
  });
}

/// Un widget presentazionale qualunque: non conosce Riverpod, non riceve la
/// preferenza come parametro. È il caso d'uso reale dei ~48 siti convertiti.
class _DistanceLabel extends StatelessWidget {
  const _DistanceLabel();

  @override
  Widget build(BuildContext context) =>
      Text(context.units.distance(12400), textDirection: TextDirection.ltr);
}
