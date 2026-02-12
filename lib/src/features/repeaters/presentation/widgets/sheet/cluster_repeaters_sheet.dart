import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/repeater_details_sheet.dart';

/// Shows a bottom sheet with a list of repeaters at the same location
void showClusterRepeatersSheet(BuildContext context, List<Repeater> repeaters) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ClusterRepeatersSheet(repeaters: repeaters),
  );
}

class ClusterRepeatersSheet extends StatelessWidget {
  const ClusterRepeatersSheet({
    required this.repeaters,
    super.key,
  });

  final List<Repeater> repeaters;

  String? _buildLocationLabel() {
    for (final repeater in repeaters) {
      final parts = [
        repeater.locality,
        repeater.provinceCode ?? repeater.region,
      ].whereType<String>();
      if (parts.isNotEmpty) return parts.join(', ');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final locationLabel = _buildLocationLabel();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.cell_tower_rounded,
                  color: colorScheme.primary,
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.clusterRepeatersTitle(repeaters.length),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (locationLabel != null) ...[
                        const Gap(2),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const Gap(4),
                            Expanded(
                              child: Text(
                                locationLabel,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // List of repeaters
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: repeaters.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 16),
              itemBuilder: (context, index) {
                final repeater = repeaters[index];
                return _RepeaterListTile(
                  repeater: repeater,
                  onTap: () {
                    Navigator.pop(context);
                    showRepeaterDetailsSheet(context, repeater.id);
                  },
                );
              },
            ),
          ),
          // Safe area padding
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

class _RepeaterListTile extends StatelessWidget {
  const _RepeaterListTile({
    required this.repeater,
    required this.onTap,
  });

  final Repeater repeater;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      onTap: onTap,
      leading: RepeaterAccessIcon(accesses: repeater.accesses),
      title: Text(
        repeater.callsign ?? repeater.locality ?? 'Repeater',
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
