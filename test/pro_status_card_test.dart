import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_status_card.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  Future<void> pumpCard(
    WidgetTester tester, {
    required bool isPro,
    bool disableAnimations = false,
  }) {
    return tester.pumpWidget(
      ProviderScope(
        overrides: [
          isProProvider.overrideWith((ref) => Stream.value(isPro)),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('it'),
          home: MediaQuery(
            data: MediaQueryData(disableAnimations: disableAnimations),
            child: const Scaffold(body: ProStatusCard()),
          ),
        ),
      ),
    );
  }

  testWidgets('senza Pro mostra la CTA con il riflesso in movimento',
      (tester) async {
    await pumpCard(tester, isPro: false);
    await tester.pump();

    expect(find.text('Passa a HamQRG Pro'), findsOneWidget);
    expect(find.text('PRO'), findsOneWidget);
    // Un'animazione in loop non si stabilizza mai: è la prova che il riflesso
    // gira — e il motivo per cui una pagina che monta questa card non va
    // testata con `pumpAndSettle`.
    expect(tester.hasRunningAnimations, isTrue);
  });

  testWidgets('rispetta la riduzione del movimento di sistema', (tester) async {
    await pumpCard(tester, isPro: false, disableAnimations: true);
    await tester.pump();

    expect(find.text('Passa a HamQRG Pro'), findsOneWidget);
    expect(tester.hasRunningAnimations, isFalse);
    await tester.pumpAndSettle();
  });

  testWidgets('con Pro attivo la card resta ferma', (tester) async {
    await pumpCard(tester, isPro: true);
    await tester.pump();

    expect(find.text('HamQRG Pro attivo'), findsOneWidget);
    expect(find.text('Passa a HamQRG Pro'), findsNothing);
    expect(find.text('PRO'), findsNothing);
    expect(tester.hasRunningAnimations, isFalse);
  });
}
