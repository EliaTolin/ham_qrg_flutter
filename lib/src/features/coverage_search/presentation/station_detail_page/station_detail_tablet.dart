import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/hydrated_station.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/station_detail_page/widgets/station_body.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

/// Su tablet il riepilogo del punto sta in una colonna a sinistra e la lista
/// scorre a destra: la larghezza c'è, e tenere il contesto sempre visibile
/// evita di dover risalire in cima per ricordarsi di che postazione si tratta.
class StationDetailTablet extends StatelessWidget {
  const StationDetailTablet({
    required this.hydrated,
    required this.selectedModes,
    required this.onRefresh,
    super.key,
  });

  final HydratedStation hydrated;
  final Set<AccessMode> selectedModes;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 320,
          child: Container(
            color: theme.colorScheme.surfaceContainerLowest,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hydrated.station.name,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  hydrated.station.point.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.coverageResultCount(hydrated.station.reachableCount),
                  style: theme.textTheme.titleMedium,
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: onRefresh,
                  icon: const Icon(Icons.refresh_rounded),
                  label: Text(l10n.stationRefresh),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: StationBody(
            hydrated: hydrated,
            selectedModes: selectedModes,
            onRefresh: onRefresh,
          ),
        ),
      ],
    );
  }
}
