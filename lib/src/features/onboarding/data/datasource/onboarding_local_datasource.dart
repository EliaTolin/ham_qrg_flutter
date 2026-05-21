import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_datasource.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_local_datasource.g.dart';

class OnboardingLocalDatasource implements OnboardingDatasource {
  OnboardingLocalDatasource(this._storage);
  final StorageClient _storage;

  static const _keyCompleted = 'onboarding_completed';
  static const _keyUserType = 'onboarding_user_type';
  static const _keyCallsign = 'onboarding_callsign';
  static const _keyTelegramShown = 'onboarding_telegram_shown';
  static const _keyTelegramJoined = 'onboarding_telegram_joined';
  static const _keyTelegramDeclined = 'onboarding_telegram_declined';
  static const _keySessionCount = 'onboarding_session_count';

  @override
  Future<bool> hasCompletedOnboarding() async {
    final value = await _storage.read(_keyCompleted);
    return value != null;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    await _storage.write(_keyCompleted, 'true');
  }

  @override
  Future<UserType?> getUserType() async {
    final value = await _storage.read(_keyUserType);
    if (value == null) return null;
    return value == 'licensed' ? UserType.licensed : UserType.swl;
  }

  @override
  Future<void> setUserType(UserType type) async {
    await _storage.write(
      _keyUserType,
      type == UserType.licensed ? 'licensed' : 'swl',
    );
  }

  @override
  Future<String?> getCallsign() async {
    return _storage.read(_keyCallsign);
  }

  @override
  Future<void> setCallsign(String callsign) async {
    await _storage.write(_keyCallsign, callsign);
  }

  @override
  Future<bool> hasTelegramInviteBeenShown() async {
    final value = await _storage.read(_keyTelegramShown);
    return value != null;
  }

  @override
  Future<void> setTelegramInviteShown() async {
    await _storage.write(_keyTelegramShown, 'true');
  }

  @override
  Future<bool> didJoinTelegram() async {
    final value = await _storage.read(_keyTelegramJoined);
    return value != null;
  }

  @override
  Future<void> setJoinedTelegram() async {
    await _storage.write(_keyTelegramJoined, 'true');
  }

  @override
  Future<bool> didDeclineTelegram() async {
    final value = await _storage.read(_keyTelegramDeclined);
    return value != null;
  }

  @override
  Future<void> setDeclinedTelegram() async {
    await _storage.write(
      _keyTelegramDeclined,
      DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<int> getSessionCount() async {
    final value = await _storage.read(_keySessionCount);
    if (value == null) return 0;
    return int.tryParse(value) ?? 0;
  }

  @override
  Future<void> incrementSessionCount() async {
    final current = await getSessionCount();
    await _storage.write(_keySessionCount, '${current + 1}');
  }
}

@riverpod
Future<OnboardingDatasource> onboardingLocalDatasource(Ref ref) async {
  final storageClient = await ref.watch(sharedPrefStorageClientProvider.future);
  return OnboardingLocalDatasource(storageClient);
}
