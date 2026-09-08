import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:hamqrg/common/widgets/units/unit_system_scope.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/place_search_bar.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/range_selector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ---------------------------------------------------------------------------
// I widget della ricerca di copertura, montati con la semantica ATTIVA.
//
// Serve perché `!semantics.parentDataDirty` scatta solo quando l'albero di
// semantica viene davvero costruito: senza `ensureSemantics()` un widget che
// avvolge un Flex con figli Expanded passa i test e poi esplode sul telefono.
// ---------------------------------------------------------------------------

Widget _wrap(Widget child) => MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('it'),
      // Nell'app lo scope è installato nel `builder` di MaterialApp, sopra
      // ogni rotta: qui va rimesso, altrimenti i widget che formattano una
      // distanza non trovano il sistema di misura.
      home: UnitSystemScope(
        system: UnitSystem.metric,
        locale: const Locale('it'),
        child: Scaffold(body: child),
      ),
    );

void main() {
  group('RangeSelector', () {
    testWidgets('should build with semantics enabled and no assertion',
        (tester) async {
      final handle = tester.ensureSemantics();
      var chosen = SearchBreadth.quick;

      await tester.pumpWidget(
        _wrap(
          RangeSelector(
            selected: chosen,
            onChanged: (value) => chosen = value,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      handle.dispose();
    });

    testWidgets('should offer every range with its kilometres', (tester) async {
      await tester.pumpWidget(
        _wrap(
          RangeSelector(selected: SearchBreadth.quick, onChanged: (_) {}),
        ),
      );

      // Ogni opzione dichiara i propri chilometri: è ciò che permette di
      // confrontarle senza toccarle e senza una riga che si riscrive sotto.
      expect(find.text('80 km'), findsOneWidget);
      expect(find.text('100 km'), findsOneWidget);
      expect(find.text('150 km'), findsOneWidget);
    });

    testWidgets('should report the chosen range', (tester) async {
      SearchBreadth? chosen;
      await tester.pumpWidget(
        _wrap(
          RangeSelector(
            selected: SearchBreadth.quick,
            onChanged: (value) => chosen = value,
          ),
        ),
      );

      await tester.tap(find.text('150 km'));
      expect(chosen, SearchBreadth.extended);
    });

    testWidgets('should ignore taps when disabled', (tester) async {
      SearchBreadth? chosen;
      await tester.pumpWidget(
        _wrap(
          RangeSelector(
            selected: SearchBreadth.quick,
            enabled: false,
            onChanged: (value) => chosen = value,
          ),
        ),
      );

      await tester.tap(find.text('150 km'));
      expect(chosen, isNull);
    });

    testWidgets('should survive a narrow phone width without overflowing',
        (tester) async {
      tester.view.physicalSize = const Size(320 * 3, 640 * 3);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _wrap(
          RangeSelector(selected: SearchBreadth.medium, onChanged: (_) {}),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  });

  group('PlaceSearchBar', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    testWidgets('should open its suggestions panel with semantics enabled',
        (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(
        ProviderScope(
          child: _wrap(
            // Come sulla mappa: il pannello si apre in un'area di altezza non
            // vincolata, che è la condizione in cui i vincoli sbagliati e le
            // assertion di semantica vengono a galla.
            Align(
              alignment: Alignment.topCenter,
              child: PlaceSearchBar(onSelected: (_) {}),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(tester.takeException(), isNull);
      handle.dispose();
    });

    testWidgets(
        'should recognise typed coordinates without hitting the network',
        (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(
        ProviderScope(
          child: _wrap(
            Align(
              alignment: Alignment.topCenter,
              child: PlaceSearchBar(onSelected: (_) {}),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.enterText(find.byType(TextField), '46.4879, 11.8123');
      await tester.pump(const Duration(milliseconds: 400));

      // Le coordinate si riconoscono in locale: compare la voce diretta,
      // nessuna richiesta di geocodifica e nessuna eccezione.
      expect(find.text('46.48790, 11.81230'), findsOneWidget);
      expect(tester.takeException(), isNull);
      handle.dispose();
    });

    testWidgets('should refuse out-of-range coordinates with a message',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: _wrap(
            Align(
              alignment: Alignment.topCenter,
              child: PlaceSearchBar(onSelected: (_) {}),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextField));
      await tester.pump();
      await tester.enterText(find.byType(TextField), '91, 200');
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.textContaining('±90'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
