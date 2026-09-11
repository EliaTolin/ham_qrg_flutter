import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/common/widgets/pro/pro_welcome_dialog.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_link_account_dialog.dart';

/// Chiude un acquisto riuscito: si festeggia e, a chi è anonimo, si propone
/// di mettere al sicuro ciò che ha appena comprato.
///
/// **Non invalida `isProProvider` e non ricostruisce l'albero.** Le due cose
/// stavano qui per sbloccare i gate, e facevano il contrario.
///
/// L'entitlement arriva da solo: la paywall chiude quando RevenueCat ha già
/// aggiornato il `CustomerInfo`, quindi `proStatusChanges()` emette `true` e
/// ogni gate — li osservano tutti con `ref.watch` — si sblocca da sé.
/// `invalidate` invece fa ripartire il provider. Non azzera il valore —
/// Riverpod conserva il precedente durante il ricaricamento — ma il
/// precedente è esattamente `false`, cioè lo stato *prima* dell'acquisto:
/// per tutta la verifica live, fino a 5 secondi di rete, ogni gate che legge
/// `.value ?? false` continua a dire "non hai Pro" a chi ha appena pagato. È
/// successo in produzione: acquisto alle 17:28:22, paywall riproposta alle
/// 17:28:56. Peggio ancora, far ripartire il provider annulla la
/// sottoscrizione a `proStatusChanges()` e la ricrea solo dopo la verifica:
/// l'aggiornamento che RevenueCat emette per l'acquisto può cadere in quel
/// buco, e con esso la `persist(true)` che teneva l'entitlement fra un avvio
/// e l'altro. Entrambi i comportamenti sono fissati in
/// `test/pro_entitlement_propagation_test.dart`.
///
/// `replaceAll([HomeRoute()])` serviva a rimontare i gate, ma nessuno di essi
/// cattura il valore al build, quindi non serviva; in compenso distruggeva la
/// pagina da cui l'utente aveva comprato — che su `coveragePromo` è proprio
/// quella che deve eseguire la navigazione successiva, silenziosamente
/// mangiata dalla guardia `context.mounted`
/// (vedi `test/coverage_promo_purchase_flow_test.dart`).
Future<void> _onProPurchased(WidgetRef ref) async {
  final context = ref.read(appRouterProvider).navigatorKey.currentContext;
  if (context == null) return;
  await showProWelcome(context);
  await _offerAccountLink(ref);
}

/// Propone a un utente anonimo di collegare un account, **dopo** l'acquisto.
///
/// L'ordine non è casuale. Un muro di registrazione *prima* del pagamento è
/// uno dei modi più efficaci di perdere una conversione già maturata; subito
/// dopo, invece, la disponibilità è massima e l'utente ha un motivo suo per
/// farlo: proteggere quello che ha appena comprato. Finché resta anonimo,
/// l'entitlement è legato a un'identità che una reinstallazione può portarsi
/// via.
///
/// Non blocca e non naviga: se rifiuta, l'acquisto resta valido e la richiesta
/// non viene ripetuta a forza.
Future<void> _offerAccountLink(WidgetRef ref) async {
  final isAnonymous = await ref.read(isAnonymousProvider.future);
  if (!isAnonymous) return;

  final context = ref.read(appRouterProvider).navigatorKey.currentContext;
  if (context == null || !context.mounted) return;
  await showProLinkAccountPrompt(context, ref);
}

/// Registra il passaggio dalla CTA all'esito, attorno alla presentazione della
/// paywall.
///
/// Sta qui e non nelle singole superfici perché era proprio la ripetizione a
/// mano di queste quattro chiamate ad aver lasciato tre punti vendita su sette
/// senza alcuna misura. Accentrata, la strumentazione non si può dimenticare:
/// non esiste una strada per aprire la paywall che non passi da qui.
Future<bool> _presentTracked(
  WidgetRef ref,
  AnalyticsSurface surface,
  Future<bool> Function() present,
) async {
  final analytics = ref.read(analyticsClientProvider)
    ..track(AnalyticsEvent.coverageCtaTapped, surface: surface)
    ..track(AnalyticsEvent.coveragePaywallShown, surface: surface);

  final purchased = await present();

  analytics.track(
    purchased
        ? AnalyticsEvent.coveragePurchaseCompleted
        : AnalyticsEvent.coveragePaywallDismissed,
    surface: surface,
  );
  return purchased;
}

/// Presenta la paywall assegnata a [placement].
///
/// Quale paywall sia non lo decide questa chiamata: il placement viene
/// risolto da RevenueCat in base alle regole di targeting configurate in
/// dashboard.
///
/// La pagina chiamante resta **sempre** in piedi. Esisteva una seconda
/// variante che dopo l'acquisto ricostruiva l'albero di navigazione, con
/// l'idea che perdere la pagina corrente non costasse nulla sulle superfici
/// "di servizio" (card di stato, badge, dialog di upsell). Costava: chi
/// comprava si ritrovava sulla tab iniziale, lontano dal ripetitore o dalla
/// voce di menu che lo aveva convinto a pagare, e su `coveragePromo` la
/// navigazione verso ciò che aveva appena comprato spariva del tutto. Su
/// dieci acquisti misurati, nove non sono mai arrivati alla funzione pagata.
///
/// [surface] è obbligatoria: è il punto d'ingresso con cui l'acquisto verrà
/// attribuito nel funnel.
Future<bool> openPaywall(
  WidgetRef ref,
  PaywallPlacement placement, {
  required AnalyticsSurface surface,
}) async {
  final purchased = await _presentTracked(
    ref,
    surface,
    () => ref
        .read(revenueCatClientProvider)
        .presentPaywall(placementId: placement.id),
  );
  if (purchased) await _onProPurchased(ref);
  return purchased;
}

/// Pro gate used before protected (Pro-only) actions.
///
/// Returns `true` if the user already owns Pro, or just purchased/restored it
/// through the paywall assigned to [placement]. Returns `false` if the user
/// dismissed the paywall without buying.
///
/// Usage:
/// ```dart
/// // user declined the paywall
/// if (!await requirePro(ref, PaywallPlacement.coveragePromo,
///     surface: AnalyticsSurface.coveragePromo)) {
///   return;
/// }
/// // ... run the Pro-only action
/// ```
///
/// Chi possiede già Pro non genera eventi: la paywall non viene presentata e
/// contarlo gonfierebbe il denominatore del funnel con utenti che non erano
/// in vendita.
///
/// Note: entitlements are linked to the Supabase user at sign-in. Se l'utente
/// è anonimo, [_offerAccountLink] gli propone il collegamento subito dopo
/// l'acquisto, senza anteporre una registrazione al pagamento.
Future<bool> requirePro(
  WidgetRef ref,
  PaywallPlacement placement, {
  required AnalyticsSurface surface,
}) async {
  final client = ref.read(revenueCatClientProvider);
  if (await client.isPro()) return true;

  final purchased = await _presentTracked(
    ref,
    surface,
    () => client.presentPaywallIfNeeded(placementId: placement.id),
  );
  if (purchased) await _onProPurchased(ref);
  return purchased;
}
