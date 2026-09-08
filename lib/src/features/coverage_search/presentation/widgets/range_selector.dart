import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';

/// Scelta del raggio di ricerca (FR-024, FR-025).
///
/// Tre pastiglie affiancate invece di un selettore a segmenti con una riga di
/// spiegazione sotto: ogni opzione dichiara **da sé** i propri chilometri,
/// quindi si confrontano a colpo d'occhio e nulla si sposta quando cambi
/// scelta. La riga che si riscriveva sotto il selettore era la ragione per cui
/// il controllo sembrava un menu a tendina travestito.
///
/// Il compromesso in parole resta disponibile come tooltip, per chi vuole
/// sapere cosa sta scambiando prima di toccare.
class RangeSelector extends StatelessWidget {
  const RangeSelector({
    required this.selected,
    required this.onChanged,
    this.enabled = true,
    super.key,
  });

  final SearchBreadth selected;
  final ValueChanged<SearchBreadth> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;

    String labelOf(SearchBreadth b) => switch (b) {
          SearchBreadth.quick => l10n.coverageBreadthQuick,
          SearchBreadth.medium => l10n.coverageBreadthMedium,
          SearchBreadth.extended => l10n.coverageBreadthExtended,
        };

    // Il raggio esce dal testo tradotto e diventa un parametro: l'identità
    // metrica del preset non cambia, cambia solo come è scritta (FR-009).
    String hintOf(SearchBreadth b) {
      final radius = context.units.presetRadius(b.radiusKm);
      return switch (b) {
        SearchBreadth.quick => l10n.coverageBreadthQuickHint(radius),
        SearchBreadth.medium => l10n.coverageBreadthMediumHint(radius),
        SearchBreadth.extended => l10n.coverageBreadthExtendedHint(radius),
      };
    }

    return Row(
      children: [
        for (final breadth in SearchBreadth.values) ...[
          Expanded(
            child: _RangePill(
              label: labelOf(breadth),
              semanticsLabel: '${l10n.coverageBreadthTitle}: '
                  '${labelOf(breadth)}, ${hintOf(breadth)}',
              radiusLabel: context.units.presetRadius(breadth.radiusKm),
              isSelected: breadth == selected,
              onTap: enabled ? () => onChanged(breadth) : null,
            ),
          ),
          if (breadth != SearchBreadth.values.last) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _RangePill extends StatelessWidget {
  const _RangePill({
    required this.label,
    required this.semanticsLabel,
    required this.radiusLabel,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String semanticsLabel;
  final String radiusLabel;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = isSelected
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.surfaceContainerHighest;
    final foreground = isSelected
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSurfaceVariant;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        // L'etichetta accessibile sta qui, sul singolo controllo, e non su un
        // Semantics attorno alla Row: lì avvolgerebbe figli Expanded e farebbe
        // scattare l'assertion sui parent data.
        focusColor:
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                semanticsLabel: semanticsLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: foreground,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                radiusLabel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: foreground.withValues(alpha: 0.75),
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
