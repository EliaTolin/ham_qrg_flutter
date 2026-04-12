import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/profile/provider/locale_notifier/locale_notifier.dart';

String getLocaleFlag(Locale? locale) {
  if (locale == null) return '';
  switch (locale.languageCode) {
    case 'cs':
      return '\u{1F1E8}\u{1F1FF}';
    case 'de':
      return '\u{1F1E9}\u{1F1EA}';
    case 'en':
      return '\u{1F1EC}\u{1F1E7}';
    case 'es':
      return '\u{1F1EA}\u{1F1F8}';
    case 'fr':
      return '\u{1F1EB}\u{1F1F7}';
    case 'hr':
      return '\u{1F1ED}\u{1F1F7}';
    case 'hu':
      return '\u{1F1ED}\u{1F1FA}';
    case 'it':
      return '\u{1F1EE}\u{1F1F9}';
    case 'nl':
      return '\u{1F1F3}\u{1F1F1}';
    case 'pl':
      return '\u{1F1F5}\u{1F1F1}';
    case 'pt':
      return '\u{1F1F5}\u{1F1F9}';
    case 'ro':
      return '\u{1F1F7}\u{1F1F4}';
    case 'sk':
      return '\u{1F1F8}\u{1F1F0}';
    case 'sl':
      return '\u{1F1F8}\u{1F1EE}';
    case 'sr':
      return '\u{1F1F7}\u{1F1F8}';
    default:
      return '';
  }
}

String getLocaleDisplayName(Locale? locale, AppLocalizations l10n) {
  if (locale == null) return l10n.profileLanguageSystem;
  switch (locale.languageCode) {
    case 'cs':
      return l10n.profileLanguageCzech;
    case 'de':
      return l10n.profileLanguageGerman;
    case 'en':
      return l10n.profileLanguageEnglish;
    case 'es':
      return l10n.profileLanguageSpanish;
    case 'fr':
      return l10n.profileLanguageFrench;
    case 'hr':
      return l10n.profileLanguageCroatian;
    case 'hu':
      return l10n.profileLanguageHungarian;
    case 'it':
      return l10n.profileLanguageItalian;
    case 'nl':
      return l10n.profileLanguageDutch;
    case 'pl':
      return l10n.profileLanguagePolish;
    case 'pt':
      return l10n.profileLanguagePortuguese;
    case 'ro':
      return l10n.profileLanguageRomanian;
    case 'sk':
      return l10n.profileLanguageSlovak;
    case 'sl':
      return l10n.profileLanguageSlovenian;
    case 'sr':
      return l10n.profileLanguageSerbian;
    default:
      return locale.languageCode.toUpperCase();
  }
}

void showLanguagePicker(BuildContext context, WidgetRef ref) {
  final l10n = AppLocalizations.of(context)!;

  // Sort supported locales alphabetically by their localized display name
  // so the list follows the user's current language.
  final sortedLocales = [...AppLocalizations.supportedLocales]..sort(
      (a, b) => getLocaleDisplayName(a, l10n)
          .compareTo(getLocaleDisplayName(b, l10n)),
    );

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scrollController) => ListView(
          controller: scrollController,
          children: [
            ListTile(
              leading: const Icon(Icons.brightness_auto),
              title: Text(l10n.profileLanguageSystem),
              onTap: () {
                ref.read(localeProvider.notifier).setLocale(null);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 1),
            for (final locale in sortedLocales)
              ListTile(
                leading: Text(
                  getLocaleFlag(locale),
                  style: const TextStyle(fontSize: 24),
                ),
                title: Text(getLocaleDisplayName(locale, l10n)),
                onTap: () {
                  ref.read(localeProvider.notifier).setLocale(locale);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    ),
  );
}
