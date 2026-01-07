import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/access_mode_helper.dart';
import 'package:ham_qrg/common/utils/repeater_format_helper.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/router/app_router.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeater_feedback_stats/get_repeater_feedback_stats_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepeaterDetailsSheet extends ConsumerWidget {
  const RepeaterDetailsSheet({
    required this.repeater,
    this.scrollController,
    super.key,
  });

  final Repeater repeater;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colorMode = RepeaterModeHelper.getModeColorObject(repeater.mode);

    // TO-DO: Fetch feedback stats
    final feedbackStatsAsync = ref.watch(
      getRepeaterFeedbackStatsProvider(repeater.id),
    );
    final likesTotal = feedbackStatsAsync.value?.likesTotal ?? 0;
    // TO-DO: Use downTotal when implementing dislike functionality
    // final downTotal = feedbackStatsAsync.value?.downTotal ?? 0;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Callsign with badge
              Row(
                children: [
                  Expanded(
                    child: Text(
                      repeater.callsign ?? repeater.name ?? 'Unknown',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorMode.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorMode.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      RepeaterModeHelper.getModeLabel(repeater.mode, l10n).toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorMode,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Location
              Row(
                children: [
                  Icon(
                    Icons.terrain,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    [
                      repeater.locality,
                      repeater.region,
                    ].whereType<String>().join(', '),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Action buttons (Like, Dislike, Favorite)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.thumb_up,
                  label: likesTotal.toString(),
                  color: Colors.cyan,
                  onTap: () {
                    // TO-DO: Implement like functionality
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.thumb_down,
                  label: '',
                  color: Colors.grey,
                  onTap: () {
                    // TO-DO: Implement dislike functionality
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.favorite,
                  label: 'Favorite',
                  color: Colors.pink,
                  onTap: () {
                    // TO-DO: Implement favorite functionality
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Access Configuration
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ACCESS CONFIGURATION',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              ...repeater.accesses.map((access) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _AccessCard(
                    access: access,
                    repeater: repeater,
                  ),
                );
              }),
              if (repeater.accesses.isEmpty)
                Text(
                  'No access configuration available',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Additional info (altitude, locator, distance)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // TO-DO: Add altitude field to repeater model
              // if (repeater.altitude != null)
              //   _InfoChip(
              //     icon: Icons.terrain,
              //     label: '${repeater.altitude}m ASL',
              //   ),
              if (repeater.locator != null) ...[
                _InfoChip(
                  icon: Icons.grid_on,
                  label: repeater.locator!,
                ),
                const SizedBox(width: 12),
              ],
              if (repeater.distanceMeters != null)
                _InfoChip(
                  icon: Icons.near_me,
                  label: RepeaterFormatHelper.formatDistance(repeater.distanceMeters),
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Details button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                context.router.push(
                  RepeaterDetailRoute(
                    repeaterId: repeater.id,
                  ),
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Details'),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
      ],
    );

    if (scrollController != null) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(),
        child: content,
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: content,
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            if (label.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
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

class _AccessCard extends StatelessWidget {
  const _AccessCard({
    required this.access,
    required this.repeater,
  });

  final RepeaterAccess access;
  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
    final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);
    final accessLabel = AccessModeHelper.getAccessModeLabel(access.mode);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accessColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(accessIcon, color: accessColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accessLabel,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Text(
                        RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Access details
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (repeater.shiftHz != null || repeater.shiftRaw != null)
                _AccessDetailChip(
                  label: 'SHIFT ${RepeaterFormatHelper.formatShift(
                    repeater.shiftHz,
                    repeater.shiftRaw,
                  )}',
                ),
              if (access.ctcssTxHz != null || access.ctcssRxHz != null)
                _AccessDetailChip(
                  label: access.ctcssTxHz != null && access.ctcssRxHz != null
                      ? 'TONE TX ${access.ctcssTxHz!.toStringAsFixed(1)} RX ${access.ctcssRxHz!.toStringAsFixed(1)} Hz'
                      : access.ctcssTxHz != null
                          ? 'TONE TX ${access.ctcssTxHz!.toStringAsFixed(1)} Hz'
                          : 'TONE RX ${access.ctcssRxHz!.toStringAsFixed(1)} Hz',
                ),
              if (access.colorCode != null)
                _AccessDetailChip(
                  label: 'CC ${access.colorCode}',
                ),
              if (access.dmrId != null)
                _AccessDetailChip(
                  label: 'ID ${access.dmrId}',
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccessDetailChip extends StatelessWidget {
  const _AccessDetailChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
