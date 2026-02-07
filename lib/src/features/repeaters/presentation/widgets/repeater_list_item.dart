import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/band/frequency_band.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class RepeaterListItem extends StatelessWidget {
  const RepeaterListItem({
    required this.repeater,
    this.likesTotal,
    super.key,
  });

  final Repeater repeater;
  final int? likesTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final band = FrequencyBand.fromFrequency(repeater.frequencyHz);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.router.push(
            RepeaterDetailRoute(repeaterId: repeater.id),
          ),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(repeater: repeater, band: band),
                const SizedBox(height: 12),
                _FrequencyRow(repeater: repeater),
                const SizedBox(height: 12),
                _AccessModes(repeater: repeater),
                if (_hasFooterContent) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(
                      height: 1,
                      color: colorScheme.outline.withValues(alpha: 0.08),
                    ),
                  ),
                  _SocialFooter(
                    repeater: repeater,
                    likesTotal: likesTotal,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get _hasFooterContent =>
      (likesTotal != null && likesTotal! > 0) ||
      repeater.distanceMeters != null;
}

// ---------------------------------------------------------------------------
// Header: Icon + Callsign + Location + Band badge
// ---------------------------------------------------------------------------
class _Header extends StatelessWidget {
  const _Header({required this.repeater, required this.band});

  final Repeater repeater;
  final FrequencyBand? band;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepeaterAccessIcon(accesses: repeater.accesses),
        const SizedBox(width: 12),
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
              if (repeater.locality != null ||
                  repeater.region != null) ...[
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        [repeater.locality, repeater.region]
                            .whereType<String>()
                            .join(', '),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        if (band != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              band!.label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Frequency row: frequency + shift in a highlighted container
// ---------------------------------------------------------------------------
class _FrequencyRow extends StatelessWidget {
  const _FrequencyRow({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.graphic_eq, size: 16, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
              color: colorScheme.onSurface,
            ),
          ),
          if (repeater.shiftHz != null || repeater.shiftRaw != null) ...[
            const SizedBox(width: 12),
            Container(
              width: 1,
              height: 16,
              color: colorScheme.outline.withValues(alpha: 0.15),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.swap_vert,
              size: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              RepeaterFormatHelper.formatShift(
                repeater.shiftHz,
                repeater.shiftRaw,
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Access mode chips
// ---------------------------------------------------------------------------
class _AccessModes extends StatelessWidget {
  const _AccessModes({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: repeater.accesses.map((access) {
        final color = AccessModeHelper.getAccessModeColorObject(access.mode);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Text(
            AccessModeHelper.getAccessModeLabel(access.mode),
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ---------------------------------------------------------------------------
// Social footer: likes (left) + distance (right)
// ---------------------------------------------------------------------------
class _SocialFooter extends StatelessWidget {
  const _SocialFooter({required this.repeater, this.likesTotal});

  final Repeater repeater;
  final int? likesTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        if (likesTotal != null && likesTotal! > 0) ...[
          Icon(
            Icons.thumb_up_rounded,
            size: 16,
            color: colorScheme.primary,
          ),
          const SizedBox(width: 6),
          Text(
            '$likesTotal',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        const Spacer(),
        if (repeater.distanceMeters != null) ...[
          Icon(
            Icons.near_me_outlined,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            _formatDistance(repeater.distanceMeters!),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  String _formatDistance(double distanceMeters) {
    if (distanceMeters < 1000) {
      return '${distanceMeters.toStringAsFixed(0)} m';
    }
    return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
  }
}
