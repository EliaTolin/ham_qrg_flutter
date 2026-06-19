import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';

Future<bool> showAreYouSureToDeleteDialog(
  BuildContext context, {
  String? title,
  String? content,
  bool barrierDismissible = false,
}) async {
  final l10n = context.localization;
  final resolvedTitle = title ?? l10n.deleteConfirmTitle;
  final resolvedContent = content ?? l10n.deleteConfirmContent;
  try {
    return await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            resolvedTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          content: Text(
            resolvedContent,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(l10n.commonCancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text(
                l10n.commonDelete,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  } catch (_) {
    // Is dismissible, so we can return false
    return false;
  }
}
