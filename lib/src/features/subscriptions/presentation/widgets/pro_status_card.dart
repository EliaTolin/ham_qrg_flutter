import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Profile entry point for HamQRG Pro.
///
/// Shows an active-Pro badge when the user owns the entitlement, otherwise an
/// upgrade CTA that opens the RevenueCat paywall.
class ProStatusCard extends ConsumerWidget {
  const ProStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isPro = ref.watch(isProProvider).value ?? false;

    final title = isPro ? l10n.proCardActiveTitle : l10n.proCardUpgradeTitle;
    final subtitle =
        isPro ? l10n.proCardActiveSubtitle : l10n.proCardUpgradeSubtitle;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isPro ? Icons.workspace_premium : Icons.star_outline,
            color: colorScheme.onPrimary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onPrimaryContainer.withValues(alpha: .7),
          ),
        ),
        trailing: isPro
            ? Icon(Icons.verified, color: colorScheme.primary)
            : Icon(
                Icons.chevron_right,
                color: colorScheme.onPrimaryContainer.withValues(alpha: .6),
              ),
        onTap: isPro ? null : () => openProPaywall(ref),
      ),
    );
  }
}
