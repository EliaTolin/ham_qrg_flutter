import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/breadth_selector.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/coverage_teaser.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/save_station_sheet.dart';
import 'package:hamqrg/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Elenco dei ripetitori raggiungibili dal punto scelto, dal segnale più forte
/// al più debole.
///
/// I filtri di modo attivi sulla mappa agiscono qui come **lente**: il calcolo
/// dietro comprende sempre tutti i modi (FR-027), quindi togliere un filtro
/// non richiede di rifare nulla.
class CoverageResultSheet extends HookConsumerWidget {
  const CoverageResultSheet({
    required this.point,
    required this.breadth,
    required this.selectedModes,
    required this.onBreadthChanged,
    this.onClearFilters,
    this.asPanel = false,
    super.key,
  });

  final SearchPoint point;
  final SearchBreadth breadth;
  final Set<AccessMode> selectedModes;
  final ValueChanged<SearchBreadth> onBreadthChanged;
  final VoidCallback? onClearFilters;

  /// Su tablet il contenuto vive in un pannello fisso affiancato alla mappa,
  /// quindi non serve — e anzi disturba — l'involucro trascinabile.
  final bool asPanel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    final async =
        ref.watch(evaluatePointProvider(point: point, breadth: breadth));

    // Ultimo risultato buono: un errore su un ricalcolo (tipicamente un cambio
    // di ampiezza andato male) mostra il banner ma NON porta via la lista che
    // l'utente sta leggendo (FR-022, Principio III).
    final lastGood = useRef<CoverageEvaluation?>(null);
    if (async.hasValue) lastGood.value = async.value;

    // Il gate Pro non è un guasto: porta al percorso di acquisto, non a un
    // banner di errore. Il calcolo, per un non Pro, non è nemmeno partito.
    final isProRequired = async.error is ProRequiredException;

    final evaluation = async.value ?? lastGood.value;
    final filtered = evaluation?.entries.filteredBy(selectedModes);

    Widget content(ScrollController? scrollController) => CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point.label,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      l10n.coverageResultSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BreadthSelector(
                      selected: breadth,
                      onChanged: onBreadthChanged,
                    ),
                    const SizedBox(height: 16),
                    if (async.isLoading)
                      _ComputingRow(
                        onCancel: () => ref.invalidate(
                          evaluatePointProvider(point: point, breadth: breadth),
                        ),
                      ),
                    if (isProRequired)
                      CoverageTeaser(point: point)
                    else if (async.hasError && !async.isLoading)
                      _ErrorBanner(
                        onRetry: () => ref.invalidate(
                          evaluatePointProvider(point: point, breadth: breadth),
                        ),
                      ),
                    if (evaluation != null &&
                        !async.isLoading &&
                        !isProRequired) ...[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.coverageResultCount(
                                evaluation.reachableCount,
                              ),
                              style: theme.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ),
                          if (evaluation.entries.isNotEmpty)
                            FilledButton.tonalIcon(
                              onPressed: () =>
                                  showSaveStationFlow(context, ref, evaluation),
                              icon: const Icon(Icons.bookmark_add_outlined),
                              label: Text(l10n.stationSaveCta),
                            ),
                        ],
                      ),
                      if ((filtered?.hiddenReachableCount ?? 0) > 0)
                        _HiddenByFiltersRow(
                          hidden: filtered!.hiddenReachableCount,
                          onClearFilters: onClearFilters,
                        ),
                    ],
                  ],
                ),
              ),
            ),
            if (evaluation != null && filtered != null && !isProRequired)
              ..._resultSlivers(context, evaluation, filtered),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        );

    if (asPanel) return content(null);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.62,
      maxChildSize: 0.92,
      builder: (context, scrollController) => content(scrollController),
    );
  }

  List<Widget> _resultSlivers(
    BuildContext context,
    CoverageEvaluation evaluation,
    FilteredEntries filtered,
  ) {
    final visible = filtered.visible.where((e) => e.verdict.reachable).toList();
    if (visible.isNotEmpty) {
      return [
        SliverList.builder(
          itemCount: visible.length,
          itemBuilder: (context, index) {
            final entry = visible[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              // RepeaterCard passa già alla rotta di dettaglio con il solo ID
              // (Principio I: le pagine ricevono identificatori, non entità).
              child: RepeaterCard(
                repeater: entry.repeater,
                signalDbm: entry.verdict.dbm,
              ),
            );
          },
        ),
      ];
    }

    // Tre stati vuoti distinti: per l'operatore "nessuno raggiungibile" e
    // "nessuno censito" sono due informazioni diverse, e "tutti nascosti dai
    // filtri" non è affatto uno stato vuoto (FR-021, FR-030).
    final l10n = context.localization;
    final hiddenByFilters = filtered.hiddenReachableCount > 0;
    final message = hiddenByFilters
        ? l10n.coverageResultHiddenByFilters(filtered.hiddenReachableCount)
        : evaluation.entries.isEmpty
            ? l10n.coverageResultEmptyNoRepeaters
            : l10n.coverageResultEmptyNoReachable;

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Column(
            children: [
              Icon(
                hiddenByFilters
                    ? Icons.filter_alt_off_outlined
                    : Icons.cell_tower_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              if (hiddenByFilters && onClearFilters != null) ...[
                const SizedBox(height: 12),
                TextButton(
                  onPressed: onClearFilters,
                  child: Text(l10n.coverageResultClearFilters),
                ),
              ],
            ],
          ),
        ),
      ),
    ];
  }
}

class _ComputingRow extends StatelessWidget {
  const _ComputingRow({required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.localization.coverageResultComputing,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          TextButton(
            onPressed: onCancel,
            child: Text(context.localization.coverageResultCancel),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 18,
            color: theme.colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              context.localization.coverageResultError,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(context.localization.retry),
          ),
        ],
      ),
    );
  }
}

class _HiddenByFiltersRow extends StatelessWidget {
  const _HiddenByFiltersRow({
    required this.hidden,
    required this.onClearFilters,
  });

  final int hidden;
  final VoidCallback? onClearFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(
            Icons.filter_alt_outlined,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              context.localization.coverageResultHiddenByFilters(hidden),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          if (onClearFilters != null)
            TextButton(
              onPressed: onClearFilters,
              child: Text(context.localization.coverageResultClearFilters),
            ),
        ],
      ),
    );
  }
}
