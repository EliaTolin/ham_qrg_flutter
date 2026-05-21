import 'dart:developer';

import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_onboarding_profile_provider.g.dart';

/// Syncs locally-stored onboarding profile data (userType, callsign) to
/// Supabase after the user registers (Google/Apple sign-in).
///
/// If the Supabase profile already has these fields (e.g., re-login on
/// another device), it does NOT overwrite them.
@riverpod
Future<void> syncOnboardingProfile(Ref ref) async {
  try {
    final datasource = await ref.read(onboardingLocalDatasourceProvider.future);

    final localUserType = await datasource.getUserType();
    final localCallsign = await datasource.getCallsign();

    // Nothing to sync
    if (localUserType == null) return;

    final profile = await ref.read(getProfileProvider.future);

    // If Supabase already has userType, don't overwrite
    if (profile.userType != null) {
      log('syncOnboardingProfile: Supabase profile already has userType, skipping');
      return;
    }

    // Sync local data to Supabase
    final updatedProfile = profile.copyWith(
      userType: localUserType,
      callsign: (localCallsign?.isNotEmpty ?? false) ? localCallsign : null,
    );
    await ref.read(updateProfileProvider(updatedProfile).future);
    ref.invalidate(getProfileProvider);
    log('syncOnboardingProfile: synced userType=$localUserType, callsign=$localCallsign');
  } catch (e) {
    log('syncOnboardingProfile: failed: $e');
    // Non-blocking — user can still proceed
  }
}
