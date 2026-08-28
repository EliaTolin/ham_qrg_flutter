import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';

/// Una postazione nella lista: nome, riferimento geografico, quanti ripetitori
/// raggiunge e quando è stata aggiornata l'ultima volta (FR-055).
class StationTile extends StatelessWidget {
  const StationTile({
    required this.station,
    required this.onTap,
    this.selected = false,
    super.key,
  });

  final SavedStation station;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final date = station.lastRefreshedAt;

    return Card(
      elevation: selected ? 2 : 0,
      color: selected
          ? theme.colorScheme.secondaryContainer
          : theme.colorScheme.surfaceContainerLowest,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.place_rounded, color: theme.colorScheme.primary),
        title: Text(
          station.name,
          style:
              theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.point.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${l10n.coverageResultCount(station.reachableCount)} · '
              '${date.day.toString().padLeft(2, '0')}/'
              '${date.month.toString().padLeft(2, '0')}/${date.year}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
