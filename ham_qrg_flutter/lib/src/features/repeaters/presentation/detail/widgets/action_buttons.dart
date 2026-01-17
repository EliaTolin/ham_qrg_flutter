import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ActionButton(
              icon: Icons.favorite_border,
              label: l10n.repeaterDetailSave,
              onTap: () {
                // TO-DO: Implement save functionality
              },
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: ActionButton(
              icon: Icons.share,
              label: l10n.repeaterDetailShare,
              onTap: () {
                // TO-DO: Implement share functionality
              },
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: ActionButton(
              icon: Icons.flag_outlined,
              label: l10n.repeaterDetailReport,
              onTap: () {
                // TO-DO: Implement report functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
