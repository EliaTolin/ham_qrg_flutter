import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramStep extends StatelessWidget {
  const TelegramStep({
    required this.onJoin,
    required this.onLater,
    required this.onAlreadyMember,
    super.key,
  });

  final VoidCallback onJoin;
  final VoidCallback onLater;
  final VoidCallback onAlreadyMember;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.telegram,
              size: 64,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            l10n.onboardingTelegramTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingTelegramSubtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
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
          const SizedBox(height: 32),
          // Join button
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () async {
                await _openTelegram(context);
                onJoin();
              },
              icon: const Icon(Icons.open_in_new, size: 18),
              label: Text(l10n.onboardingTelegramJoin),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
              TextButton(
                onPressed: onAlreadyMember,
                child: Text(l10n.onboardingTelegramAlreadyMember),
              ),
              TextButton(
                onPressed: onLater,
                child: Text(
                  l10n.onboardingTelegramLater,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
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
            child: Text(text, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
