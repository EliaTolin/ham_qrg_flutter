import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/router/app_router.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepeaterDetailsSheet extends ConsumerWidget {
  const RepeaterDetailsSheet({
    required this.repeater,
    this.scrollController,
    super.key,
  });

  final Repeater repeater;
  final ScrollController? scrollController;

  static String formatFrequency(int frequencyHz) {
    if (frequencyHz >= 1000000) {
      return '${(frequencyHz / 1000000).toStringAsFixed(3)} MHz';
    } else if (frequencyHz >= 1000) {
      return '${(frequencyHz / 1000).toStringAsFixed(1)} kHz';
    }
    return '$frequencyHz Hz';
  }

  static String formatShift(int? shiftHz, String? shiftRaw) {
    if (shiftRaw != null && shiftRaw.isNotEmpty) {
      return shiftRaw;
    }
    if (shiftHz != null) {
      if (shiftHz >= 1000) {
        return '${(shiftHz / 1000).toStringAsFixed(1)} kHz';
      }
      return '$shiftHz Hz';
    }
    return '-';
  }

  static String formatCtcss(double? ctcssHz) {
    if (ctcssHz != null) {
      return '${ctcssHz.toStringAsFixed(1)} Hz';
    }
    return '-';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colorMode = RepeaterModeHelper.getModeColorObject(repeater.mode);
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Handle bar
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        // Header with gradient background
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorMode.withValues(alpha: 0.15),
                colorMode.withValues(alpha: 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorMode.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorMode,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (repeater.callsign != null)
                Text(
                  repeater.callsign!,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (repeater.name != null) ...[
                const SizedBox(height: 4),
                Text(
                  repeater.name!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Frequency Card
        _InfoCard(
          icon: Icons.waves,
          iconColor: colorScheme.primary,
          title: l10n.repeaterFrequency,
          value: formatFrequency(repeater.frequencyHz),
        ),
        // Shift & CTCSS Row
        if (repeater.shiftHz != null ||
            repeater.shiftRaw != null ||
            (repeater.accesses.isNotEmpty && repeater.accesses.first.ctcssHz != null)) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              if (repeater.shiftHz != null || repeater.shiftRaw != null) ...[
                Expanded(
                  child: _InfoCard(
                    icon: Icons.swap_horiz,
                    iconColor: colorScheme.secondary,
                    title: l10n.repeaterShift,
                    value: formatShift(repeater.shiftHz, repeater.shiftRaw),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              if (repeater.accesses.isNotEmpty && repeater.accesses.first.ctcssHz != null) ...[
                Expanded(
                  child: _InfoCard(
                    icon: Icons.tune,
                    iconColor: colorScheme.tertiary,
                    title: l10n.repeaterCtcss,
                    value: formatCtcss(repeater.accesses.first.ctcssHz),
                  ),
                ),
              ],
            ],
          ),
        ],
        // Location & Distance
        if (repeater.locality != null ||
            repeater.region != null ||
            repeater.distanceMeters != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              if (repeater.locality != null || repeater.region != null) ...[
                Expanded(
                  child: _InfoCard(
                    icon: Icons.location_on,
                    iconColor: Colors.green,
                    title: l10n.repeaterLocation,
                    value: [
                      repeater.locality,
                      repeater.region,
                    ].whereType<String>().join(', '),
                  ),
                ),
                if (repeater.distanceMeters != null) const SizedBox(width: 12),
              ],
              if (repeater.distanceMeters != null) ...[
                Expanded(
                  child: _InfoCard(
                    icon: Icons.straighten,
                    iconColor: Colors.orange,
                    title: l10n.repeaterDistance,
                    value: repeater.distanceMeters! < 1000
                        ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                        : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
                  ),
                ),
              ],
            ],
          ),
        ],
        const SizedBox(height: 20),
        // CTA Button
        SizedBox(
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
            icon: const Icon(Icons.arrow_forward),
            label: Text(l10n.repeaterViewFullDetails),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: content,
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 8,
      ),
      child: content,
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
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
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
