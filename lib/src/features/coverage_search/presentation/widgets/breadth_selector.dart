import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';

/// Scelta dell'ampiezza di ricerca (FR-024).
///
/// Le etichette dichiarano il **compromesso**, non i soli chilometri (FR-025):
/// "80 km" non dice nulla a chi non ha in testa la portata di una VHF, mentre
/// "risposta più veloce" e "più lontano, attesa maggiore" permettono di
/// scegliere sapendo cosa si sta scambiando.
class BreadthSelector extends StatelessWidget {
  const BreadthSelector({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final SearchBreadth selected;
  final ValueChanged<SearchBreadth> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    String labelOf(SearchBreadth breadth) => switch (breadth) {
          SearchBreadth.quick => l10n.coverageBreadthQuick,
          SearchBreadth.medium => l10n.coverageBreadthMedium,
          SearchBreadth.extended => l10n.coverageBreadthExtended,
        };

    // Il raggio esce dal testo tradotto e diventa un parametro: l'identità
    // metrica del preset non cambia, cambia solo come è scritta (FR-009).
    String hintOf(SearchBreadth breadth) {
      final radius = context.units.presetRadius(breadth.radiusKm);
      return switch (breadth) {
        SearchBreadth.quick => l10n.coverageBreadthQuickHint(radius),
        SearchBreadth.medium => l10n.coverageBreadthMediumHint(radius),
        SearchBreadth.extended => l10n.coverageBreadthExtendedHint(radius),
      };
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.coverageBreadthTitle,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        SegmentedButton<SearchBreadth>(
          segments: [
            for (final breadth in SearchBreadth.values)
              ButtonSegment<SearchBreadth>(
                value: breadth,
                label: Text(labelOf(breadth)),
              ),
          ],
          selected: {selected},
          showSelectedIcon: false,
          onSelectionChanged: (values) => onChanged(values.first),
        ),
        const SizedBox(height: 6),
        Text(
          hintOf(selected),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
