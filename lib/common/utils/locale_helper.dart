import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/profile/provider/locale_notifier/locale_notifier.dart';

String getLocaleFlag(Locale? locale) {
  if (locale == null) return '';
  switch (locale.languageCode) {
    case 'it':
      return '\u{1F1EE}\u{1F1F9}';
    case 'en':
      return '\u{1F1EC}\u{1F1E7}';
    case 'es':
      return '\u{1F1EA}\u{1F1F8}';
    case 'fr':
      return '\u{1F1EB}\u{1F1F7}';
    default:
      return '';
  }
}

String getLocaleDisplayName(Locale? locale, AppLocalizations l10n) {
  if (locale == null) return l10n.profileLanguageSystem;
  switch (locale.languageCode) {
    case 'it':
      return l10n.profileLanguageItalian;
    case 'en':
      return l10n.profileLanguageEnglish;
    case 'es':
      return l10n.profileLanguageSpanish;
    case 'fr':
      return l10n.profileLanguageFrench;
    default:
      return l10n.profileLanguageSystem;
  }
}

void showLanguagePicker(BuildContext context, WidgetRef ref) {
  final l10n = AppLocalizations.of(context)!;
  showModalBottomSheet<void>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_auto),
            title: Text(l10n.profileLanguageSystem),
            onTap: () {
              ref.read(localeProvider.notifier).setLocale(null);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Text('🇮🇹', style: TextStyle(fontSize: 24)),
            title: Text(l10n.profileLanguageItalian),
            onTap: () {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(const Locale('it'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
            title: Text(l10n.profileLanguageEnglish),
            onTap: () {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(const Locale('en'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Text('🇪🇸', style: TextStyle(fontSize: 24)),
            title: Text(l10n.profileLanguageSpanish),
            onTap: () {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(const Locale('es'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Text('🇫🇷', style: TextStyle(fontSize: 24)),
            title: Text(l10n.profileLanguageFrench),
            onTap: () {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(const Locale('fr'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
