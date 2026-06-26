import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_revenue_cat_attributes_provider.g.dart';

/// Keeps the RevenueCat customer's identity attributes (email, display name,
/// first/last name, callsign) in sync with the authenticated profile.
///
/// Reactive + keepAlive: mount it once at startup (read from the splash) and it
/// re-pushes whenever [getProfileProvider] changes — covering sign-in, profile
/// updates (e.g. callsign set during onboarding) and account switches.
///
/// No-op while no profile is available (anonymous user); RevenueCat's
/// `logOut` already clears the attributes on sign-out.
@Riverpod(keepAlive: true)
Future<void> syncRevenueCatAttributes(Ref ref) async {
  final profile = ref.watch(getProfileProvider).value;
  if (profile == null) return;

  final client = ref.read(revenueCatClientProvider);
  final email = ref.read(supabaseClientProvider).auth.currentUser?.email;
  final displayName = '${profile.name} ${profile.surname}'.trim();

  await client.setUserAttributes(
    email: email,
    displayName: displayName,
    custom: {
      'first_name': profile.name,
      'last_name': profile.surname,
      'callsign': profile.callsign,
    },
  );
}
