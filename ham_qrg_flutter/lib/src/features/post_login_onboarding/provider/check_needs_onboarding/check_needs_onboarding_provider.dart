import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_needs_onboarding_provider.g.dart';

@riverpod
Future<bool> checkNeedsPostLoginOnboarding(Ref ref) async {
  try {
    final profile = await ref.read(getProfileProvider.future);
    return profile.callsign == null || profile.callsign!.trim().isEmpty;
  } catch (e) {
    // If we can't fetch profile, don't block the flow
    return false;
  }
}
