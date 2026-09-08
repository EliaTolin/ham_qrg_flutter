import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/widgets/units/unit_system_selector.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Il selettore ha tre voci su una riga sola: è la forma che lo rende utile
/// — la scelta corrente si legge senza aprire nulla — ed è anche la forma che
/// può traboccare.
///
/// Il traboccamento qui **non solleva un'eccezione**: l'etichetta va a capo o
/// viene tagliata, e un test che si limita a `takeException()` passa mentre a
/// schermo il testo è rotto. Per questo la misura è relativa: la stessa
/// etichetta viene resa su uno schermo largo e su uno stretto, e se
/// sullo stretto è più alta vuol dire che è andata a capo.
///
/// Una **avvertenza sulla misura**: i widget test rendono il testo con un
/// font di prova a glifi quadrati, largo quanto alto, molto più ingombrante
/// dei font di sistema veri. Questo test è quindi una soglia *conservativa*:
/// ciò che passa qui passa di sicuro sul telefono, ma qualcosa che fallisce
/// qui potrebbe stare comunque nella realtà. È il verso giusto in cui
/// sbagliare per un layout, e comunque il caso reale segnalato — "Automatico"
/// con le icone — falliva in entrambi i mondi.
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<Map<String, double>> labelHeights(
    WidgetTester tester,
    Locale locale,
    double width,
    double textScale,
  ) async {
    tester.view.physicalSize = Size(width * 3, 900 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          builder: (context, child) => MediaQuery.withClampedTextScaling(
            minScaleFactor: textScale,
            maxScaleFactor: textScale,
            child: child!,
          ),
          // Il padding reale delle due schermate che lo ospitano: 20 nelle
          // impostazioni, 24 nel profilo anonimo. Si prende il peggiore.
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: UnitSystemSelector(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final heights = <String, double>{};
    for (final element in find.byType(Text).evaluate()) {
      final text = (element.widget as Text).data;
      if (text == null) continue;
      heights[text] = tester.getSize(find.text(text)).height;
    }
    return heights;
  }

  // de e hu hanno le etichette più lunghe delle quindici lingue.
  for (final locale in [
    const Locale('it'),
    const Locale('de'),
    const Locale('hu'),
  ]) {
    for (final width in [320.0, 360.0, 390.0]) {
      for (final scale in [1.0, 1.3]) {
        testWidgets(
          'una riga sola in ${locale.languageCode} a ${width.toInt()}dp '
          'con testo ×$scale',
          (tester) async {
            final roomy = await labelHeights(tester, locale, 1200, scale);
            final tight = await labelHeights(tester, locale, width, scale);

            expect(tester.takeException(), isNull);
            for (final entry in tight.entries) {
              expect(
                entry.value,
                lessThanOrEqualTo(roomy[entry.key]! + 0.5),
                reason: '"${entry.key}" va a capo a ${width.toInt()}dp '
                    '(${entry.value} contro ${roomy[entry.key]})',
              );
            }
          },
        );
      }
    }
  }
}
