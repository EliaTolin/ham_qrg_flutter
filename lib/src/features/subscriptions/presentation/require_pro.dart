import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/common/widgets/pro/pro_welcome_dialog.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

/// Called after a successful purchase. In order:
/// 1. Invalidate `isProProvider` so every watcher (badges, gates, upsells)
///    re-reads the entitlement immediately instead of waiting for RevenueCat's
///    async listener (which may lag and leave stale "locked" UI).
/// 2. Celebrate with the WOW Pro welcome dialog (awaited).
/// 3. Hard-refresh the whole navigation tree with `replaceAll([HomeRoute()])`:
///    every page is torn down and rebuilt from scratch, so Pro gates that
///    captured their state at build time (coverage button, blur gates,
///    reachability) come back unlocked — equivalent to an app restart, but in
///    place. The user lands back on the default tab.
Future<void> _onProPurchased(WidgetRef ref) async {
  ref.invalidate(isProProvider);

  final router = ref.read(appRouterProvider);
  final context = router.navigatorKey.currentContext;
  if (context != null) await showProWelcome(context);

  await router.replaceAll([const HomeRoute()]);
}

/// Come [_onProPurchased], ma **senza** ricostruire l'albero di navigazione.
///
/// Serve dove la pagina deve sopravvivere all'acquisto. Il caso concreto è il
/// teaser della ricerca di copertura: l'utente ha scelto un punto, ha comprato
/// e deve ritrovare quel punto ancora lì con il calcolo che parte da solo
/// (FR-031). Con `replaceAll` finirebbe invece sulla tab predefinita, e il
/// lavoro di scegliere il posto andrebbe rifatto — esattamente nel momento in
/// cui ha appena pagato.
///
/// È sicuro perché i gate coinvolti osservano `isProProvider` in modo
/// reattivo: l'invalidazione basta a sbloccarli, senza bisogno del
/// ricaricamento a martello.
Future<void> _onProPurchasedInPlace(WidgetRef ref) async {
  ref.invalidate(isProProvider);

  final context = ref.read(appRouterProvider).navigatorKey.currentContext;
  if (context != null) await showProWelcome(context);
}

/// Presenta la paywall assegnata a [placement] e, se l'utente compra,
/// ricarica l'albero di navigazione.
///
/// Quale paywall sia non lo decide questa chiamata: il placement viene
/// risolto da RevenueCat in base alle regole di targeting configurate in
/// dashboard. Da qui passano i punti in cui perdere la pagina corrente non
/// costa nulla (card di stato, badge, dialog di upsell).
Future<bool> openPaywall(WidgetRef ref, PaywallPlacement placement) async {
  final purchased = await ref
      .read(revenueCatClientProvider)
      .presentPaywall(placementId: placement.id);
  if (purchased) await _onProPurchased(ref);
  return purchased;
}

/// Come [openPaywall], ma lascia in piedi la pagina chiamante.
///
/// Da usare dove il contesto costruito dall'utente prima dell'acquisto è il
/// motivo stesso per cui sta comprando (il punto scelto sulla mappa).
Future<bool> openPaywallInPlace(
  WidgetRef ref,
  PaywallPlacement placement,
) async {
  final purchased = await ref
      .read(revenueCatClientProvider)
      .presentPaywall(placementId: placement.id);
  if (purchased) await _onProPurchasedInPlace(ref);
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
/// if (!await requirePro(ref, PaywallPlacement.coveragePromo)) return;
/// // ... run the Pro-only action
/// ```
///
/// Note: entitlements are linked to the Supabase user at sign-in. For features
/// where the purchase must follow the account, gate with `requireAuthentication`
/// first so the user is not anonymous when buying.
Future<bool> requirePro(WidgetRef ref, PaywallPlacement placement) async {
  final client = ref.read(revenueCatClientProvider);
  if (await client.isPro()) return true;
  final purchased = await client.presentPaywallIfNeeded(
    placementId: placement.id,
  );
  if (purchased) await _onProPurchased(ref);
  return purchased;
}
