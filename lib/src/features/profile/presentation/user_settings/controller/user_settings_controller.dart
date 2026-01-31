import 'dart:io';

import 'package:hamqrg/src/features/authentication/provider/delete_account/delete_account_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/profile/domain/state/user_state/user_state.dart';
import 'package:hamqrg/src/features/profile/provider/delete_image_profile/delete_image_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_email_profile/get_email_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_image_profile/get_image_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/upload_propics/upload_propics_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_controller.g.dart';

@riverpod
class UserSettingsController extends _$UserSettingsController {
  @override
  FutureOr<UserState> build() async {
    state = const AsyncLoading();
    final profile = await ref.read(getProfileProvider.future);
    return await getProfile(profile);
  }

  Future<UserState> getProfile(Profile profile) async {
    state = const AsyncLoading();
    String? imageUrl;
    if (profile.propic != null) {
      imageUrl = await ref.read(getImageProfileProvider(profile.propic!).future);
    }
    final email = await ref.read(getEmailProfileProvider.future);
    final isAnonymous = await ref.read(isAnonymousProvider.future);
    return UserState(
      profile: profile,
      imageProfileUrl: imageUrl,
      email: email,
      isAnonymous: isAnonymous,
    );
  }

  Future<void> updateProfile(Profile profile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(updateProfileProvider(profile).future);
      ref.invalidate(getProfileProvider);
      final newProfile = await ref.read(getProfileProvider.future);
      return getProfile(newProfile);
    });
  }

  Future<void> updateImageProfile(File image) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(uploadPropicsProvider(image).future);
      ref.invalidate(getProfileProvider);
      final newProfile = await ref.read(getProfileProvider.future);
      return getProfile(newProfile);
    });
  }

  Future<void> deleteImageProfile() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(deleteImageProfileProvider.future);
      final profile = await ref.watch(getProfileProvider.future);
      return getProfile(profile);
    });
  }

  Future<void> deleteAccount() async {
    await ref.read(deleteAccountProvider.future);
    ref.invalidate(getUserIdProvider);
  }
}
