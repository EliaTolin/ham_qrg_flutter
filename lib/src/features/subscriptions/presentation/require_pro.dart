import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/common/widgets/pro/pro_welcome_dialog.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

/// Called after a successful purchase: (1) forces every `isProProvider` watcher
/// (badges, gates, upsells) to re-read the entitlement immediately — instead of
/// waiting for RevenueCat's async listener, which may lag and leave stale
/// "locked" UI until restart — and (2) celebrates with the Pro welcome dialog.
void _onProPurchased(WidgetRef ref) {
  ref.invalidate(isProProvider);
  final context = ref.read(appRouterProvider).navigatorKey.currentContext;
  if (context != null) showProWelcome(context);
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
  if (purchased) _onProPurchased(ref);
  return purchased;
}

/// Convenience widget action: presents the paywall unconditionally
/// (e.g. from a "Go Pro" button / upsell card).
Future<bool> openProPaywall(WidgetRef ref) async {
  final purchased = await ref.read(revenueCatClientProvider).presentPaywall();
  if (purchased) _onProPurchased(ref);
  return purchased;
}

/// Presents the dedicated reachability paywall (the feature-specific offering
/// from [AppConfigs.reachabilityPaywallOfferingId]; falls back to the default
/// when unset). Use from the "see what you reach" upsell.
Future<bool> openReachabilityPaywall(WidgetRef ref) async {
  final purchased = await ref.read(revenueCatClientProvider).presentPaywall(
        offeringId: AppConfigs.reachabilityPaywallOfferingId,
      );
  if (purchased) _onProPurchased(ref);
  return purchased;
}
