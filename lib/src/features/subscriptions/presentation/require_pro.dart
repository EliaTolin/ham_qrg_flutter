import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';

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
  return client.presentPaywallIfNeeded();
}

/// Convenience widget action: presents the paywall unconditionally
/// (e.g. from a "Go Pro" button / upsell card).
Future<bool> openProPaywall(WidgetRef ref) {
  return ref.read(revenueCatClientProvider).presentPaywall();
}
