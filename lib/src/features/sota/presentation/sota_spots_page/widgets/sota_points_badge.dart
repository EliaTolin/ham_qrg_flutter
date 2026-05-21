import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// SOTA points trophy badge. Color tier scales with the points value
/// (1, 2, 4, 6, 8, 10) per the SOTA scoring standard. Brand-specific palette.
class SotaPointsBadge extends StatelessWidget {
  const SotaPointsBadge({required this.points, super.key});

  final int points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tone = SotaPointsColors.forPoints(points);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: tone.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.emoji_events, size: 12, color: tone),
          const SizedBox(width: 4),
          Text(
            context.localization.sotaPointsBadge(points),
            style: theme.textTheme.labelSmall?.copyWith(
              color: tone,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
