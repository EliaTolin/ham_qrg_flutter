import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
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

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        if (repeater.callsign != null) ...[
          Text(
            repeater.callsign!,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (repeater.name != null) ...[
          Text(
            repeater.name!,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
        _DetailRow(
          icon: Icons.radio,
          label: l10n.repeaterMode,
          value: RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
          modeColor: RepeaterModeHelper.getModeColorObject(repeater.mode),
        ),
        _DetailRow(
          icon: Icons.waves,
          label: l10n.repeaterFrequency,
          value: RepeaterDetailsSheet.formatFrequency(repeater.frequencyHz),
        ),
        if (repeater.shiftHz != null || repeater.shiftRaw != null) ...[
          _DetailRow(
            icon: Icons.swap_horiz,
            label: l10n.repeaterShift,
            value: RepeaterDetailsSheet.formatShift(
              repeater.shiftHz,
              repeater.shiftRaw,
            ),
          ),
        ],
        if (repeater.ctcssHz != null) ...[
          _DetailRow(
            icon: Icons.tune,
            label: l10n.repeaterCtcss,
            value: RepeaterDetailsSheet.formatCtcss(repeater.ctcssHz),
          ),
        ],
        if (repeater.locality != null || repeater.region != null) ...[
          _DetailRow(
            icon: Icons.location_on,
            label: l10n.repeaterLocation,
            value: [
              repeater.locality,
              repeater.region,
            ].whereType<String>().join(', '),
          ),
        ],
        if (repeater.distanceMeters != null) ...[
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.straighten,
            label: l10n.repeaterDistance,
            value: repeater.distanceMeters! < 1000
                ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
          ),
        ],
        const SizedBox(height: 16),
      ],
    );

    if (scrollController != null) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 8,
        ),
        child: content,
      );
    }

    return Padding(
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

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.modeColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? modeColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = modeColor ?? theme.colorScheme.primary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  if (modeColor != null) ...[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: modeColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
