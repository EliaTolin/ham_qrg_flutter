import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoSection extends ConsumerWidget {
  const InfoSection({
    required this.repeater,
    super.key,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.info_outline,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.repeaterDetailInfo,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            children: [
              _InfoRow(
                label: l10n.repeaterDetailSource,
                value: repeater.source,
              ),
              Divider(
                height: 16,
                color: colorScheme.outline.withValues(alpha: 0.1),
              ),
              if (repeater.manager != null)
                _InfoRow(
                  label: l10n.repeaterDetailManager,
                  value: repeater.manager!,
                )
              else
                _SuggestManagerRow(
                  onTap: () => _onSuggestManagerTap(context, ref),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _onSuggestManagerTap(BuildContext context, WidgetRef ref) async {
    final isAuthenticated = await requireAuthentication(context, ref);
    if (!isAuthenticated) return;

    if (context.mounted) {
      await context.router.push(ReportIssueRoute(repeaterId: repeater.id));
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SuggestManagerRow extends StatelessWidget {
  const _SuggestManagerRow({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Icon(
            Icons.edit_note,
            size: 18,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.repeaterDetailSuggestManager,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: 18,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
