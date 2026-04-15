import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Reusable empty state widget with icon, message, and optional CTA.
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.icon,
    required this.message,
    this.cta,
    this.onCtaTap,
    this.iconSize = 48,
    super.key,
  });

  final IconData icon;
  final String message;
  final String? cta;
  final VoidCallback? onCtaTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: theme.colorScheme.onSurface.withValues(alpha: .3),
            ),
            const Gap(12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: .5),
              ),
            ),
            if (cta != null) ...[
              const Gap(4),
              if (onCtaTap != null)
                TextButton(
                  onPressed: onCtaTap,
                  child: Text(cta!),
                )
              else
                Text(
                  cta!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
