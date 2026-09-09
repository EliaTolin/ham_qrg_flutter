import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/store_launcher.dart';

Future<void> showUpdateRequiredDialog(
  BuildContext context, {
  required String appStoreId,
  required String playStorePackageName,
}) async {
  final l10n = context.localization;
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
              Text(l10n.updateRequiredTitle),
            ],
          ),
          content: Text(l10n.updateRequiredBody),
          actions: [
            ElevatedButton(
              onPressed: () => openStoreListing(
                context,
                appStoreId: appStoreId,
                playStorePackageName: playStorePackageName,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(l10n.updateRequiredAction),
            ),
          ],
        ),
      );
    },
  );
}
