import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class FavoriteRepeaterItem extends StatelessWidget {
  const FavoriteRepeaterItem({
    required this.repeater,
    required this.onRemoveFavorite,
    this.feedbackStats,
    super.key,
  });

  final Repeater repeater;
  final VoidCallback onRemoveFavorite;
  final RepeaterFeedbackStats? feedbackStats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final likesTotal = feedbackStats?.likesTotal ?? 0;
    final downTotal = feedbackStats?.downTotal ?? 0;

    return GestureDetector(
      onTap: () {
        context.router.push(RepeaterDetailRoute(repeaterId: repeater.id));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.router.push(RepeaterDetailRoute(repeaterId: repeater.id));
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row with icon, info, and favorite button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Repeater icon with access mode segments
                      RepeaterAccessIcon(accesses: repeater.accesses),
                      const SizedBox(width: 12),
                      // Info section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repeater.callsign ?? repeater.name ?? 'Unknown',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            // Location
                            if (repeater.locality != null || repeater.region != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                [
                                  repeater.locality,
                                  repeater.region,
                                ].whereType<String>().join(', '),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                            // Likes and Reports
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                if (likesTotal > 0) ...[
                                  const Icon(
                                    Icons.thumb_up,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$likesTotal Likes',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                                if (downTotal > 0) ...[
                                  if (likesTotal > 0) const SizedBox(width: 12),
                                  const Icon(
                                    Icons.flag,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$downTotal ${downTotal == 1 ? 'Report' : 'Reports'}',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Favorite button
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 24,
                        ),
                        onPressed: onRemoveFavorite,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: l10n.favoritesRemove,
                      ),
                    ],
                  ),
                  // Chips row
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            // Frequency chip
                            _InfoChip(
                              icon: Icons.graphic_eq,
                              label: RepeaterFormatHelper.formatFrequency(
                                repeater.frequencyHz,
                              ),
                              isFrequency: true,
                            ),
                            // Access mode chips
                            ...repeater.accesses.map((access) {
                              final accessColor = AccessModeHelper.getAccessModeColorObject(
                                access.mode,
                              );
                              return _InfoChip(
                                label: AccessModeHelper.getAccessModeLabel(
                                  access.mode,
                                ),
                                isAccessMode: true,
                                color: accessColor,
                              );
                            }),
                          ],
                        ),
                      ),
                      // Distance chip (aligned to right)
                      if (repeater.distanceMeters != null) ...[
                        const SizedBox(width: 8),
                        _InfoChip(
                          icon: Icons.near_me,
                          label: _formatDistance(repeater.distanceMeters!),
                          isDistance: true,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDistance(double distanceMeters) {
    if (distanceMeters < 1000) {
      return '${distanceMeters.toStringAsFixed(0)} m';
    }
    return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    this.icon,
    this.isFrequency = false,
    this.isAccessMode = false,
    this.isDistance = false,
    this.color,
  });

  final String label;
  final IconData? icon;
  final bool isFrequency;
  final bool isAccessMode;
  final bool isDistance;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isAccessMode && color != null) {
      // Access mode chip with color
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color!.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color!.withValues(alpha: 0.2),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      );
    }

    if (isDistance) {
      // Distance chip with special styling
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.05),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    // Frequency chip or default
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFeatures: isFrequency ? const [FontFeature.tabularFigures()] : null,
            ),
          ),
        ],
      ),
    );
  }
}
