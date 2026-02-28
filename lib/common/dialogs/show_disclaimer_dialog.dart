import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showDisclaimerDialog(BuildContext context) async {
  await showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      final l10n = context.localization;
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.cell_tower,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                // Title
                Text(
                  l10n.disclaimerTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Description
                Text(
                  l10n.disclaimerDescription,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                // Visit site button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _openIz8wnhSite(context),
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: Text(l10n.disclaimerVisitSite),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Understood button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(l10n.disclaimerUnderstood),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> _openIz8wnhSite(BuildContext context) async {
  try {
    final uri = Uri.parse(AppConfigs.getIz8wnhSite());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.errorOpenDisclaimerSite);
    }
  } catch (_) {
    if (context.mounted) {
      showErrorSnackbar(context, context.localization.errorOpenDisclaimerSite);
    }
  }
}
