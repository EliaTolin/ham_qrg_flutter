import 'package:flutter/material.dart';

/// Compact, section-level error with a retry action.
///
/// Used by sections that must degrade gracefully (POTA / SOTA spots on the
/// dashboard): the failure of a secondary data source stays inside its own
/// section instead of taking over the whole page.
class InlineErrorRetry extends StatelessWidget {
  const InlineErrorRetry({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
    this.icon = Icons.cloud_off,
    this.compact = false,
    super.key,
  });

  /// Localized description of the failure.
  final String message;

  /// Localized label of the retry button.
  final String retryLabel;

  final VoidCallback onRetry;

  final IconData icon;

  /// Single-row layout, for dense side panels.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (compact) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 16),
              label: Text(retryLabel),
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(retryLabel),
          ),
        ],
      ),
    );
  }
}
