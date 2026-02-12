import 'dart:developer';

import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'check_needs_onboarding_provider.g.dart';

@riverpod
Future<bool> checkNeedsPostLoginOnboarding(Ref ref) async {
  try {
    final profile = await ref.refresh(getProfileProvider.future);
    // Show onboarding if userType is not set
    final needsOnboarding = profile.userType == null;
    log(
      'checkNeedsPostLoginOnboarding: userType=${profile.userType}, '
      'needsOnboarding=$needsOnboarding',
    );
    return needsOnboarding;
  } on PostgrestException {
    // Profile not found in DB (truly new user) → needs onboarding
    log('checkNeedsPostLoginOnboarding: profile not found, new user');
    return true;
  }
  // Other errors (network, auth) propagate to caller
}
