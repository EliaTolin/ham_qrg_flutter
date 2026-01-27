import 'dart:developer';

import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/logout/logout_provider.dart';
import 'package:hamqrg/src/features/profile/domain/state/user_state/user_state.dart';
import 'package:hamqrg/src/features/profile/provider/get_email_profile/get_email_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_image_profile/get_image_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<UserState> build() async {
    state = const AsyncLoading();
    try {
      final profile = await ref.read(getProfileProvider.future);
      String? imageUrl;
      if (profile.propic != null) {
        imageUrl = await ref.read(getImageProfileProvider(profile.propic!).future);
      }
      final isAnonymous = await ref.read(isAnonymousProvider.future);
      final email = await ref.read(getEmailProfileProvider.future);
      return UserState(
        profile: profile,
        imageProfileUrl: imageUrl,
        email: email,
        isAnonymous: isAnonymous,
      );
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(logoutProvider.future);
    ref
      ..invalidate(getProfileProvider)
      ..invalidate(getImageProfileProvider)
      ..invalidate(getEmailProfileProvider)
      ..invalidate(isAnonymousProvider)
      ..invalidate(getUserIdProvider);
    log('User logged out');
  }
}
