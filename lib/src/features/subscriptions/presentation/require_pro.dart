import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/common/widgets/pro/pro_welcome_dialog.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
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

/// Pro gate used before protected (Pro-only) actions.
///
/// Returns `true` if the user already owns Pro, or just purchased/restored it
/// through the presented paywall. Returns `false` if the user dismissed the
/// paywall without buying.
///
/// Usage:
/// ```dart
/// if (!await requirePro(ref)) return; // user declined the paywall
/// // ... run the Pro-only action
/// ```
///
/// Note: entitlements are linked to the Supabase user at sign-in. For features
/// where the purchase must follow the account, gate with `requireAuthentication`
/// first so the user is not anonymous when buying.
Future<bool> requirePro(WidgetRef ref) async {
  final client = ref.read(revenueCatClientProvider);
  if (await client.isPro()) return true;
  final purchased = await client.presentPaywallIfNeeded();
  if (purchased) await _onProPurchased(ref);
  return purchased;
}

/// Convenience widget action: presents the paywall unconditionally
/// (e.g. from a "Go Pro" button / upsell card).
Future<bool> openProPaywall(WidgetRef ref) async {
  final purchased = await ref.read(revenueCatClientProvider).presentPaywall();
  if (purchased) await _onProPurchased(ref);
  return purchased;
}

/// Presents the dedicated reachability paywall (the feature-specific offering
/// from [AppConfigs.reachabilityPaywallOfferingId]; falls back to the default
/// when unset). Use from the "see what you reach" upsell.
Future<bool> openReachabilityPaywall(WidgetRef ref) async {
  final purchased = await ref.read(revenueCatClientProvider).presentPaywall(
        offeringId: AppConfigs.reachabilityPaywallOfferingId,
      );
  if (purchased) await _onProPurchased(ref);
  return purchased;
}
