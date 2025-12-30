import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_format_helper.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/common/widgets/icons/repeater_icon.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';

class FavoriteRepeaterItem extends StatelessWidget {
  const FavoriteRepeaterItem({
    required this.repeater,
    required this.onRemoveFavorite,
    super.key,
  });

  final Repeater repeater;
  final VoidCallback onRemoveFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final modeColor = RepeaterModeHelper.getModeColorObject(repeater.mode);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          //context.router.push(RepeaterDetailsRoute(repeater: repeater));
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepeaterIcon(mode: repeater.mode),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                repeater.name ?? repeater.callsign ?? '',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (repeater.locality != null || repeater.region != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            [
                              repeater.locality,
                              repeater.region,
                            ].whereType<String>().join(', '),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text('4.9 (204 reviews)', style: theme.textTheme.labelSmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: onRemoveFavorite,
                    tooltip: l10n.favoritesRemove,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _InfoChip(
                    icon: Icons.graphic_eq,
                    label: RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
                  ),
                  _InfoChip(
                    label: RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                    isPrimary: true,
                    color: modeColor,
                  ),
                  if (repeater.distanceMeters != null)
                    _InfoChip(
                      icon: Icons.near_me,
                      label: _formatDistance(repeater.distanceMeters!),
                    ),
                ],
              ),
            ],
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
    this.isPrimary = false,
    this.color,
  });

  final String label;
  final IconData? icon;
  final bool isPrimary;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isPrimary) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: (color ?? colorScheme.primary).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: (color ?? colorScheme.primary).withValues(alpha: 0.2),
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: color ?? colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontFeatures: icon == Icons.graphic_eq ? const [FontFeature.tabularFigures()] : null,
            ),
          ),
        ],
      ),
    );
  }
}
