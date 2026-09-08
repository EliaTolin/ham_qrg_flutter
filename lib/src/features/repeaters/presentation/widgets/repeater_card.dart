import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/utils/signal_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/common/widgets/signal/signal_bars.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/band/frequency_band.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

/// Shared card widget for displaying a repeater in both the list and
/// favorites pages.
///
/// When [onFavoritePressed] is non-null a filled red heart button is shown
/// in the header instead of the frequency-band badge.
class RepeaterCard extends StatelessWidget {
  const RepeaterCard({
    required this.repeater,
    this.feedbackStats,
    this.onFavoritePressed,
    this.hasActiveSpot = false,
    this.signalDbm,
    super.key,
  });

  final Repeater repeater;
  final RepeaterFeedbackStats? feedbackStats;
  final VoidCallback? onFavoritePressed;
  final bool hasActiveSpot;

  /// Predicted received signal (dBm) from this repeater to the user. When set
  /// (reachability list), a signal meter is shown in the footer.
  final double? signalDbm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final card = Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.04),
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
                _Header(
                  repeater: repeater,
                  onFavoritePressed: onFavoritePressed,
                ),
                const SizedBox(height: 12),
                _FrequencyRow(repeater: repeater),
                const SizedBox(height: 12),
                _AccessModes(repeater: repeater),
                if (_hasFooter) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      height: 1,
                      color: colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  ),
                  _StatsFooter(
                    repeater: repeater,
                    feedbackStats: feedbackStats,
                    signalDbm: signalDbm,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (!hasActiveSpot) return card;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        card,
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  bool get _hasFooter =>
      feedbackStats != null ||
      repeater.distanceMeters != null ||
      signalDbm != null;
}

// ---------------------------------------------------------------------------
// Header: Icon + Callsign + Location + Band badge / Favorite button
// ---------------------------------------------------------------------------
class _Header extends StatelessWidget {
  const _Header({required this.repeater, this.onFavoritePressed});

  final Repeater repeater;
  final VoidCallback? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final band = FrequencyBand.fromFrequency(repeater.frequencyHz);

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
              if (repeater.locality != null || repeater.region != null) ...[
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
        if (onFavoritePressed != null)
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: colorScheme.error,
              size: 24,
            ),
            onPressed: onFavoritePressed,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          )
        else if (band != null) ...[
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
              band.label,
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
// Stats footer: likes + reports (left) + distance (right)
// ---------------------------------------------------------------------------
class _StatsFooter extends StatelessWidget {
  const _StatsFooter({
    required this.repeater,
    this.feedbackStats,
    this.signalDbm,
  });

  final Repeater repeater;
  final RepeaterFeedbackStats? feedbackStats;
  final double? signalDbm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final likesTotal = feedbackStats?.likesTotal ?? 0;
    final downTotal = feedbackStats?.downTotal ?? 0;
    final hasMyLike = feedbackStats?.hasMyLike ?? false;

    return Row(
      children: [
        if (feedbackStats != null) ...[
          Icon(
            Icons.thumb_up_rounded,
            size: 16,
            color:
                hasMyLike ? colorScheme.tertiary : colorScheme.outlineVariant,
          ),
          const SizedBox(width: 4),
          Text(
            '$likesTotal',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.flag_rounded,
            size: 16,
            color:
                downTotal > 0 ? colorScheme.error : colorScheme.outlineVariant,
          ),
          const SizedBox(width: 4),
          Text(
            '$downTotal',
            style: theme.textTheme.bodySmall?.copyWith(
              color: downTotal > 0
                  ? colorScheme.error
                  : colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
        const Spacer(),
        if (signalDbm != null) ...[
          SignalBars(dbm: signalDbm!),
          const SizedBox(width: 6),
          Text(
            SignalHelper.dbmLabel(signalDbm!),
            style: theme.textTheme.bodySmall?.copyWith(
              color: SignalHelper.colorFromDbm(signalDbm!),
              fontWeight: FontWeight.w700,
            ),
          ),
          if (repeater.distanceMeters != null) const SizedBox(width: 12),
        ],
        if (repeater.distanceMeters != null) ...[
          Icon(
            Icons.near_me_outlined,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            context.units.distance(repeater.distanceMeters!),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}
