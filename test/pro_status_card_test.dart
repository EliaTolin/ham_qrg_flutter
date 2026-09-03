import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/clients/revenue_cat/model/pro_price_hint.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_status_card.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/src/features/subscriptions/provider/pro_price_hint/pro_price_hint_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Raccoglie gli eventi invece di spedirli: il client reale passa da Supabase,
/// che in un test di widget non è inizializzato.
class _RecordingAnalyticsClient implements AnalyticsClient {
  final List<(AnalyticsEvent, AnalyticsSurface)> events = [];

  @override
  void track(
    AnalyticsEvent event, {
    required AnalyticsSurface surface,
    int? count,
  }) {
    events.add((event, surface));
  }
}

void main() {
  late _RecordingAnalyticsClient analytics;

  setUp(() => analytics = _RecordingAnalyticsClient());

  Future<void> pumpCard(
    WidgetTester tester, {
    required bool isPro,
    bool disableAnimations = false,
    ProPriceHint? price,
  }) {
    return tester.pumpWidget(
      ProviderScope(
        overrides: [
          isProProvider.overrideWith((ref) => Stream.value(isPro)),
          analyticsClientProvider.overrideWithValue(analytics),
          proPriceHintProvider(PaywallPlacement.proStatusCard)
              .overrideWith((ref) async => price),
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

    expect(find.text('Scopri cosa raggiungi'), findsOneWidget);
    expect(find.text('PRO'), findsOneWidget);
    // Un'animazione in loop non si stabilizza mai: è la prova che il riflesso
    // gira — e il motivo per cui una pagina che monta questa card non va
    // testata con `pumpAndSettle`.
    expect(tester.hasRunningAnimations, isTrue);
  });

  testWidgets('rispetta la riduzione del movimento di sistema', (tester) async {
    await pumpCard(tester, isPro: false, disableAnimations: true);
    await tester.pump();

    expect(find.text('Scopri cosa raggiungi'), findsOneWidget);
    expect(tester.hasRunningAnimations, isFalse);
    await tester.pumpAndSettle();
  });

  testWidgets('con Pro attivo la card resta ferma', (tester) async {
    await pumpCard(tester, isPro: true);
    await tester.pump();

    expect(find.text('HamQRG Pro attivo'), findsOneWidget);
    expect(find.text('Scopri cosa raggiungi'), findsNothing);
    expect(find.text('PRO'), findsNothing);
    expect(tester.hasRunningAnimations, isFalse);
  });

  testWidgets("chi ha già pagato trova come gestire l'abbonamento",
      (tester) async {
    await pumpCard(tester, isPro: true);
    await tester.pump();

    // Senza questa via d'uscita l'unica strada per disdire è cercarla nelle
    // impostazioni dello store, e chi non la trova lascia una recensione
    // invece di uscire in silenzio.
    expect(find.text('Gestisci abbonamento'), findsOneWidget);
  });

  testWidgets('la CTA porta prezzo e ripristino', (tester) async {
    await pumpCard(
      tester,
      isPro: false,
      disableAnimations: true,
      price: const ProPriceHint(
        kind: ProPriceKind.perMonth,
        price: '2,99 €',
      ),
    );
    await tester.pumpAndSettle();

    const expected = 'Da 2,99 € al mese · Annulla quando vuoi';
    expect(find.text(expected), findsOneWidget);
    expect(find.text('Ripristina acquisti'), findsOneWidget);
  });

  testWidgets('senza prezzo disponibile resta comunque comprabile',
      (tester) async {
    await pumpCard(tester, isPro: false, disableAnimations: true);
    await tester.pumpAndSettle();

    // Il prezzo è un rinforzo della CTA, mai una sua precondizione: offline
    // la card deve restare intera.
    expect(find.textContaining('al mese'), findsNothing);
    expect(find.text('Scopri cosa raggiungi'), findsOneWidget);
    expect(find.text('Ripristina acquisti'), findsOneWidget);
  });

  testWidgets('la superficie con più impression viene misurata',
      (tester) async {
    await pumpCard(tester, isPro: false, disableAnimations: true);
    await tester.pump();

    expect(
      analytics.events,
      contains(
        (AnalyticsEvent.coverageTeaserShown, AnalyticsSurface.profileCard),
      ),
    );
  });
}
