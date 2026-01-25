import 'dart:developer';

import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_needs_onboarding_provider.g.dart';

@riverpod
Future<bool> checkNeedsPostLoginOnboarding(Ref ref) async {
  try {
    final profile = await ref.read(getProfileProvider.future);
    final needsOnboarding =
        profile.callsign == null || profile.callsign!.trim().isEmpty;
    log('checkNeedsPostLoginOnboarding: callsign=${profile.callsign}, needsOnboarding=$needsOnboarding');
    return needsOnboarding;
  } catch (e) {
    // If we can't fetch profile, assume user needs onboarding (new user)
    log('checkNeedsPostLoginOnboarding: error fetching profile: $e, returning true');
    return true;
  }
}
