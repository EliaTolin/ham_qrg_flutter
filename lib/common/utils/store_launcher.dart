import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

/// Apre la scheda dell'app sullo store della piattaforma.
///
/// Punto unico di apertura dello store: la usano sia il dialog di
/// aggiornamento obbligatorio (`showUpdateRequiredDialog`) sia il banner di
/// nuova versione disponibile (`UpdateAvailableBanner`), che altrimenti
/// avrebbero due copie della stessa costruzione di URL.
Future<void> openStoreListing(
  BuildContext context, {
  required String appStoreId,
  required String playStorePackageName,
}) async {
  final l10n = context.localization;
  try {
    Uri? storeUrl;
    if (Platform.isIOS) {
      storeUrl = Uri.parse('https://apps.apple.com/app/id$appStoreId');
    } else if (Platform.isAndroid) {
      storeUrl = Uri.parse(
        'https://play.google.com/store/apps/details?id=$playStorePackageName',
      );
    }
    if (storeUrl == null) return;

    if (await canLaunchUrl(storeUrl)) {
      await launchUrl(storeUrl, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        showErrorSnackbar(context, l10n.errorOpeningStore);
      }
    }
  } catch (_) {
    if (context.mounted) {
      showErrorSnackbar(context, l10n.errorOpeningStore);
    }
  }
}
