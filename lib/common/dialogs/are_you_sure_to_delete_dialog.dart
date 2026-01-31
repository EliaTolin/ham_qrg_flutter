import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';

Future<bool> showAreYouSureToDeleteDialog(
  BuildContext context, {
  String title = 'Conferma cancellazione',
  String content = 'Sei sicuro di voler cancellare?',
  bool barrierDismissible = false,
}) async {
  try {
    return await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Annulla'.hardcoded),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Cancella'.hardcoded,
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
