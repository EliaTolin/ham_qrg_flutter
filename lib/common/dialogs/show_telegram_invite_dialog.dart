import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showTelegramInviteDialog(
  BuildContext context, {
  VoidCallback? onAlreadyTelegramMember,
}) async {
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
                    color: Colors.blueAccent.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.telegram,
                    size: 48,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),
                // Title
                Text(
                  l10n.joinCommunityTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  l10n.joinCommunityDescription,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                // Benefits
                _BenefitItem(
                  icon: Icons.group,
                  text: l10n.benefitSupportMembers,
                ),
                _BenefitItem(
                  icon: Icons.lightbulb_outline,
                  text: l10n.benefitSuggestFeatures,
                ),
                _BenefitItem(
                  icon: Icons.developer_mode,
                  text: l10n.benefitContactDevelopers,
                ),
                _BenefitItem(
                  icon: Icons.star,
                  text: l10n.benefitExclusivePreviews,
                ),
                _BenefitItem(
                  icon: Icons.chat_bubble,
                  text: l10n.benefitActiveCommunity,
                ),
                const SizedBox(height: 20),
                // Join button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => _openTelegram(context),
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: Text(l10n.joinNowButton),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Secondary actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (onAlreadyTelegramMember != null)
                      TextButton(
                        onPressed: () {
                          onAlreadyTelegramMember.call();
                          Navigator.of(context).pop();
                        },
                        child: Text(l10n.alreadyMemberButton),
                      ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        l10n.laterButton,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> _openTelegram(BuildContext context) async {
  try {
    final uri = Uri.parse(AppConfigs.getTelegramLink());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.errorOpenTelegram);
    }
  } catch (_) {
    if (context.mounted) {
      showErrorSnackbar(context, context.localization.errorOpenTelegram);
    }
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
