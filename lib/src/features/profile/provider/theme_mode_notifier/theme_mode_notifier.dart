import 'package:flutter/material.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

const _themeModeKey = 'theme_mode';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  Future<ThemeMode> build() async {
    final storageClient =
        await ref.watch(sharedPrefStorageClientProvider.future);
    final stored = await storageClient.read(_themeModeKey);
    return _fromString(stored);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final storageClient =
        await ref.read(sharedPrefStorageClientProvider.future);
    await storageClient.write(_themeModeKey, _toString(mode));
    state = AsyncData(mode);
  }

  ThemeMode _fromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _toString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
