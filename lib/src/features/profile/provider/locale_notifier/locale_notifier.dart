import 'dart:ui';

import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

const _localeKey = 'app_locale';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Future<Locale?> build() async {
    final storageClient =
        await ref.watch(sharedPrefStorageClientProvider.future);
    final stored = await storageClient.read(_localeKey);
    return _fromString(stored);
  }

  Future<void> setLocale(Locale? locale) async {
    final storageClient =
        await ref.read(sharedPrefStorageClientProvider.future);
    if (locale == null) {
      await storageClient.delete(_localeKey);
    } else {
      await storageClient.write(_localeKey, locale.languageCode);
    }
    state = AsyncData(locale);
  }

  Locale? _fromString(String? value) {
    switch (value) {
      case 'it':
        return const Locale('it');
      case 'en':
        return const Locale('en');
      case 'es':
        return const Locale('es');
      case 'fr':
        return const Locale('fr');
      default:
        return null;
    }
  }
}
