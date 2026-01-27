import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showUpdateRequiredDialog(
  BuildContext context, {
  required String appStoreId,
  required String playStorePackageName,
}) async {
  await showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(
                Icons.system_update,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Text('Aggiornamento richiesto'),
            ],
          ),
          content: const Text(
            "È disponibile una nuova versione dell'app. Aggiorna per continuare a utilizzare l'applicazione.",
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                try {
                  Uri? storeUrl;
                  if (Platform.isIOS) {
                    storeUrl = Uri.parse(
                      'https://apps.apple.com/app/id$appStoreId',
                    );
                  } else if (Platform.isAndroid) {
                    storeUrl = Uri.parse(
                      'https://play.google.com/store/apps/details?id=$playStorePackageName',
                    );
                  }

                  if (storeUrl != null) {
                    if (await canLaunchUrl(storeUrl)) {
                      await launchUrl(
                        storeUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      if (context.mounted) {
                        showErrorSnackbar(
                          context,
                          "Errore durante l'apertura dello store",
                        );
                      }
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    showErrorSnackbar(
                      context,
                      "Errore durante l'apertura dello store",
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Aggiorna ora'),
            ),
          ],
        ),
      );
    },
  );
}
