import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';

/// Informational banner shown above the Summit Pursuit when the summit
/// is no longer valid or has access restrictions. Non-blocking — the rest
/// of the page remains usable.
class SummitRestrictionsBanner extends StatelessWidget {
  const SummitRestrictionsBanner({required this.summit, super.key});

  final SotaSummit summit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final messages = <String>[];
    if (!summit.valid) {
      messages.add(
        l10n.sotaSummitInvalidFrom(_formatDate(summit.validTo)),
      );
    }
    if (summit.hasRestrictions) {
      final detail = summit.restrictions.isNotEmpty
          ? '${l10n.sotaSummitRestrictions}: ${summit.restrictions.join(', ')}'
          : l10n.sotaSummitRestrictions;
      messages.add(detail);
    }
    if (messages.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 22,
            color: colorScheme.error,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final msg in messages)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      msg,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime d) {
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$day/$m/$y';
  }
}
