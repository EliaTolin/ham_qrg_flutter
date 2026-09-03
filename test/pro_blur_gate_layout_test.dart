import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/l10n/app_localizations.dart';

void main() {
  /// Il badge sul dettaglio ripetitore: teaser corto, testo reale.
  Future<double> pumpGate(WidgetTester tester, {required bool dense}) async {
    tester.view
      ..physicalSize = const Size(390 * 3, 844 * 3)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('it'),
        home: Scaffold(
          body: Align(
            alignment: Alignment.topCenter,
            child: ProBlurGate(
              locked: true,
              dense: dense,
              title: 'Lo raggiungi da qui?',
              subtitle: 'Scopri se questo ponte ti copre e con che segnale',
              ctaLabel: 'Scoprilo con PRO',
              onUnlock: () {},
              teaser: const SizedBox(height: 52),
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    return tester.getSize(find.byType(ProBlurGate)).height;
  }

  testWidgets('la forma compatta resta molto più bassa di quella piena',
      (tester) async {
    final stacked = await pumpGate(tester, dense: false);
    final dense = await pumpGate(tester, dense: true);

    // Il numero esatto non conta, il rapporto sì: su una pagina di contenuto
    // il gate deve essere un invito, non un blocco che spinge sotto la piega
    // frequenze, toni e accessi.
    expect(dense, lessThan(stacked * 0.7));
    // Tetto assoluto oltre al rapporto: se un domani la forma impilata
    // crescesse, il rapporto resterebbe verde mentre il badge tornerebbe
    // ingombrante sulla pagina che deve ospitarlo.
    expect(dense, lessThan(180));
    expect(tester.takeException(), isNull);
  });

  testWidgets('la forma compatta conserva tutto quello che vende',
      (tester) async {
    await pumpGate(tester, dense: true);

    // Comprimere non vuol dire tagliare: un gate che non dice più cosa si
    // compra è compatto e inutile. Titolo, promessa e CTA restano tutti.
    expect(find.text('Lo raggiungi da qui?'), findsOneWidget);
    expect(
      find.text('Scopri se questo ponte ti copre e con che segnale'),
      findsOneWidget,
    );
    expect(find.text('Scoprilo con PRO'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
