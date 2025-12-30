import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/common/widgets/icons/repeater_icon.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/sheet/repeater_details_sheet.dart';

class RepeaterListItem extends StatelessWidget {
  const RepeaterListItem({
    required this.repeater,
    super.key,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colorMode = RepeaterModeHelper.getModeColorObject(repeater.mode);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          _showRepeaterDetails(context, repeater);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RepeaterIcon(mode: repeater.mode),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (repeater.callsign != null) ...[
                          Text(
                            repeater.callsign!,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        if (repeater.name != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            repeater.name!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorMode.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorMode.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorMode,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.waves,
                    size: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    RepeaterDetailsSheet.formatFrequency(repeater.frequencyHz),
                    style: theme.textTheme.bodyMedium,
                  ),
                  if (repeater.distanceMeters != null) ...[
                    const SizedBox(width: 24),
                    Icon(
                      Icons.straighten,
                      size: 16,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      repeater.distanceMeters! < 1000
                          ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                          : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
              if (repeater.locality != null || repeater.region != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        [
                          repeater.locality,
                          repeater.region,
                        ].whereType<String>().join(', '),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showRepeaterDetails(BuildContext context, Repeater repeater) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: RepeaterDetailsSheet(
            repeater: repeater,
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }
}
