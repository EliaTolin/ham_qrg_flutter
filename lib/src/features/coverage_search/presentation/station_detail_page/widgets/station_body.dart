import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/hydrated_station.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';

/// Contenuto di una postazione salvata, condiviso fra telefono e tablet.
class StationBody extends StatelessWidget {
  const StationBody({
    required this.hydrated,
    required this.selectedModes,
    required this.onRefresh,
    this.scrollController,
    super.key,
  });

  final HydratedStation hydrated;
  final Set<AccessMode> selectedModes;
  final VoidCallback onRefresh;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final now = DateTime.now();

    // Il filtro agisce sulla sola presentazione: la copia conservata contiene
    // tutti i modi, quindi toglierlo qui fa ricomparire i ripetitori anche
    // senza rete (FR-029).
    final filtered = hydrated.entries.filteredBy(selectedModes);
    final visible = filtered.visible.where((e) => e.verdict.reachable).toList();

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        _Notice(
          icon: Icons.sd_storage_outlined,
          message: l10n.stationOfflineNotice,
          detail: hydrated.oldestDataAt == null
              ? null
              : _formatDate(hydrated.oldestDataAt!),
        ),
        if (hydrated.isStaleAt(now)) ...[
          const SizedBox(height: 8),
          _Notice(
            icon: Icons.schedule_rounded,
            message: l10n.stationStaleNotice,
            isWarning: true,
            action: TextButton(
              onPressed: onRefresh,
              child: Text(l10n.stationRefresh),
            ),
          ),
        ],
        if (hydrated.missingIds.isNotEmpty) ...[
          const SizedBox(height: 8),
          _Notice(
            icon: Icons.cloud_off_rounded,
            message: l10n.stationMissingEntry,
            detail: '${hydrated.missingIds.length}',
          ),
        ],
        const SizedBox(height: 16),
        Text(
          l10n.coverageResultCount(hydrated.station.reachableCount),
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        if (filtered.hiddenReachableCount > 0)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.coverageResultHiddenByFilters(filtered.hiddenReachableCount),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        const SizedBox(height: 12),
        for (final entry in visible)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: RepeaterCard(
              repeater: entry.repeater,
              signalDbm: entry.verdict.dbm,
            ),
          ),
      ],
    );
  }

  static String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/${date.year}';
}

class _Notice extends StatelessWidget {
  const _Notice({
    required this.icon,
    required this.message,
    this.detail,
    this.action,
    this.isWarning = false,
  });

  final IconData icon;
  final String message;
  final String? detail;
  final Widget? action;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = isWarning
        ? theme.colorScheme.tertiaryContainer
        : theme.colorScheme.surfaceContainerHighest;
    final foreground = isWarning
        ? theme.colorScheme.onTertiaryContainer
        : theme.colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: foreground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              detail == null ? message : '$message · $detail',
              style: theme.textTheme.bodySmall?.copyWith(color: foreground),
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}
