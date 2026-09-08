import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/altimetric_profile_chart.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_drag_handle.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_altimetric_profile/get_altimetric_profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AltimetricProfileBottomSheet extends ConsumerWidget {
  const AltimetricProfileBottomSheet({
    required this.repeaterLat,
    required this.repeaterLon,
    super.key,
  });

  final double repeaterLat;
  final double repeaterLon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final profileAsync = ref.watch(
      getAltimetricProfileProvider(
        repeaterLat: repeaterLat,
        repeaterLon: repeaterLon,
      ),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: SheetDragHandle(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.terrain,
                      color: colorScheme.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.repeaterDetailAltimetricProfile,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: profileAsync.when(
                  data: (profile) => AltimetricProfileChart(
                    profile: profile,
                    scrollController: scrollController,
                    sourceLabel: l10n.repeaterDetailYou,
                    sourceElevationLabel: l10n.repeaterDetailYourElevation,
                    totalDistanceLabel: l10n.repeaterDetailTotalDistance,
                    destinationElevationLabel:
                        l10n.repeaterDetailRepeaterElevation,
                    terrainLabel: l10n.repeaterDetailTerrainProfile,
                    lineOfSightLabel: l10n.repeaterDetailLineOfSight,
                    losClearLabel: l10n.repeaterDetailLosClear,
                    losObstructedLabel: l10n.repeaterDetailLosObstructed,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  error: (error, stackTrace) {
                    debugPrint(
                      '[AltimetricProfile] Error: $error\n$stackTrace',
                    );
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: colorScheme.error,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              l10n.error_message,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$error',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
