import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/widgets/empty_state_widget.dart';
import 'package:hamqrg/common/widgets/mode_filter_chips_horizontal.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/coverage_teaser.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/range_selector.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/save_station_button.dart';
import 'package:hamqrg/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Cosa raggiungi dal punto scelto.
///
/// Quattro zone fisse invece di un unico blocco che scorre: in alto il
/// **responso** (dove, quanti, entro quanto), sotto i due controlli della
/// lente — raggio e modi — poi la lista, e in fondo il salvataggio ancorato,
/// che con cinquanta risultati non deve costringere a risalire in cima per
/// essere raggiunto.
/// Altezza indicativa delle zone fisse del foglio — responso, selettore di
/// raggio, filtri di modo e pulsante di salvataggio — con un margine per le
/// dimensioni di testo maggiorate. Serve solo a calcolare fin dove il foglio
/// può rimpicciolire.
const double _chromeHeight = 350;

class CoverageResultSheet extends HookConsumerWidget {
  const CoverageResultSheet({
    required this.point,
    required this.breadth,
    required this.selectedModes,
    required this.onBreadthChanged,
    this.onModeToggled,
    this.onAllModes,
    this.asPanel = false,
    super.key,
  });

  final SearchPoint point;
  final SearchBreadth breadth;
  final Set<AccessMode> selectedModes;
  final ValueChanged<SearchBreadth> onBreadthChanged;

  /// Attiva o disattiva un modo: gli stessi filtri della mappa, ma regolabili
  /// **da qui**.
  ///
  /// Con il foglio aperto i chip in cima alla mappa sono coperti, e una lente
  /// che si può muovere solo chiudendo ciò che si sta guardando, per chi la
  /// userebbe, non esiste. Quando è null i chip non compaiono e la lista resta
  /// governata dai soli filtri della mappa.
  final ValueChanged<AccessMode>? onModeToggled;

  /// Torna a "tutti i modi". È insieme il chip "Tutti" e la via d'uscita da
  /// una lista svuotata dai filtri.
  final VoidCallback? onAllModes;

  /// Su tablet il contenuto vive in un pannello fisso affiancato alla mappa,
  /// quindi non serve l'involucro trascinabile.
  final bool asPanel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = evaluatePointProvider(point: point, breadth: breadth);
    final async = ref.watch(provider);

    final isProRequired = async.hasError && async.error is ProRequiredException;

    // L'ultimo risultato buono si conserva SOLO se appartiene allo stesso
    // raggio. Cambiare raggio pone una domanda diversa: tenere in vista la
    // risposta precedente mentre arriva la nuova mostrerebbe ripetitori che
    // non appartengono più a nulla di ciò che è scritto sopra di loro.
    //
    // I modi invece non toccano il calcolo (FR-027): cambiarli riordina solo
    // ciò che è già in mano, senza far ripartire nulla.
    final cached = useRef<_Cached?>(null);
    if (async.hasValue) {
      cached.value = _Cached(breadth: breadth, evaluation: async.value!);
    }
    final previous =
        cached.value?.breadth == breadth ? cached.value?.evaluation : null;

    final evaluation = async.value ?? previous;
    final isRecalculating = async.isLoading && evaluation == null;

    // Rimuovere i filtri ha senso solo quando ce n'è almeno uno: è la stessa
    // azione del chip "Tutti", offerta dove l'utente ne sente il bisogno.
    final onClearFilters = selectedModes.isEmpty ? null : onAllModes;

    Widget body(ScrollController? controller) {
      // La lente si applica una volta sola, qui: il responso in cima e la
      // lista sotto devono rispondere alla stessa domanda. Era il conteggio
      // non filtrato sopra una lista filtrata a far sembrare che il filtro
      // non esistesse affatto.
      final filtered = evaluation?.entries.filteredBy(selectedModes);
      final visible =
          filtered?.visible.where((e) => e.verdict.reachable).toList() ??
              const <ResolvedCoverageEntry>[];

      final canFilter =
          !isProRequired && onModeToggled != null && onAllModes != null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: _Verdict(
              point: point,
              breadth: breadth,
              evaluation: evaluation,
              shownCount: visible.length,
              isFiltered: selectedModes.isNotEmpty,
              isRecalculating: isRecalculating,
              onCancel: () => ref.invalidate(provider),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RangeSelector(
              selected: breadth,
              onChanged: onBreadthChanged,
              enabled: !isProRequired,
            ),
          ),
          if (canFilter) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ModeFilterChipsHorizontal(
                allLabel: context.localization.repeaterModeAllmode,
                selectedModes: selectedModes,
                onModeToggled: onModeToggled!,
                onAllSelected: onAllModes!,
              ),
            ),
          ],
          const SizedBox(height: 16),
          const Divider(height: 1),
          Expanded(
            child: _Body(
              controller: controller,
              point: point,
              evaluation: evaluation,
              visible: visible,
              hiddenCount: filtered?.hiddenReachableCount ?? 0,
              isProRequired: isProRequired,
              isRecalculating: isRecalculating,
              hasError: async.hasError && !isProRequired,
              onRetry: () => ref.invalidate(provider),
              onClearFilters: onClearFilters,
            ),
          ),
          if (evaluation != null &&
              evaluation.entries.isNotEmpty &&
              !isProRequired)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: SaveStationButton(evaluation: evaluation),
              ),
            ),
        ],
      );
    }

    if (asPanel) return body(null);

    // Il minimo lo detta il contenuto fisso, non una frazione arbitraria: sotto
    // l'altezza di responso + selettore + pulsante non resta nulla da mostrare,
    // e la frazione predefinita (0.25) portava il foglio in uno stato in cui
    // quelle tre zone non ci stavano più — con la lista schiacciata a zero e il
    // Column in overflow.
    final minExtent =
        (_chromeHeight / MediaQuery.sizeOf(context).height).clamp(0.3, 0.66);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.66,
      minChildSize: minExtent,
      maxChildSize: 0.92,
      // Il controller va alla lista interna: è così che il trascinamento del
      // foglio e lo scorrimento dei risultati diventano un gesto solo, invece
      // di due aree di scorrimento che si contendono il dito.
      //
      // Il ritaglio è la rete di sicurezza per i fotogrammi di transizione, in
      // cui l'altezza può scendere sotto il minimo prima di assestarsi: meglio
      // un pulsante temporaneamente tagliato di un errore di layout.
      builder: (context, controller) => ClipRect(child: body(controller)),
    );
  }
}

/// Un risultato con il raggio a cui appartiene: senza questa coppia non si
/// potrebbe sapere se ciò che si ha in mano risponde ancora alla domanda posta.
class _Cached {
  const _Cached({required this.breadth, required this.evaluation});

  final SearchBreadth breadth;
  final CoverageEvaluation evaluation;
}

/// Il responso: da dove, quanti, entro quanto.
///
/// Il conteggio è l'unica cosa grande della schermata. Tutto il resto —
/// nome del luogo in alto, portata e candidati valutati sotto — gli fa da
/// contorno, perché è l'unica informazione per cui si è aperto il foglio.
///
/// Con un filtro attivo il conteggio diventa "quanti su quanti": la lente
/// nasconde risultati, e un numero che li contasse comunque smentirebbe la
/// lista che ha sotto.
class _Verdict extends StatelessWidget {
  const _Verdict({
    required this.point,
    required this.breadth,
    required this.evaluation,
    required this.shownCount,
    required this.isFiltered,
    required this.isRecalculating,
    required this.onCancel,
  });

  final SearchPoint point;
  final SearchBreadth breadth;
  final CoverageEvaluation? evaluation;
  final int shownCount;
  final bool isFiltered;
  final bool isRecalculating;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Eyebrow nel linguaggio "console" già in uso nell'app.
        Text(
          point.label.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelMedium?.copyWith(
            fontFamily: 'monospace',
            letterSpacing: 1.2,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 6),
        if (isRecalculating)
          Row(
            children: [
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.coverageResultRecalculating,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              TextButton(
                onPressed: onCancel,
                child: Text(l10n.coverageResultCancel),
              ),
            ],
          )
        else if (evaluation != null) ...[
          Text(
            isFiltered
                ? l10n.coverageResultCountFiltered(
                    shownCount,
                    evaluation!.reachableCount,
                  )
                : l10n.coverageResultCount(evaluation!.reachableCount),
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          // La portata e quanti candidati sono stati valutati dicono il
          // compromesso meglio di qualunque frase: sono il compromesso.
          Text(
            l10n.coverageResultScope(
              context.units.presetRadius(breadth.radiusKm),
              evaluation!.entries.length,
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.controller,
    required this.point,
    required this.evaluation,
    required this.visible,
    required this.hiddenCount,
    required this.isProRequired,
    required this.isRecalculating,
    required this.hasError,
    required this.onRetry,
    required this.onClearFilters,
  });

  final ScrollController? controller;
  final SearchPoint point;
  final CoverageEvaluation? evaluation;

  /// Le voci raggiungibili che superano la lente dei modi.
  final List<ResolvedCoverageEntry> visible;

  /// Quante raggiungibili la lente sta nascondendo (FR-030).
  final int hiddenCount;

  final bool isProRequired;
  final bool isRecalculating;
  final bool hasError;
  final VoidCallback onRetry;
  final VoidCallback? onClearFilters;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;

    if (isProRequired) {
      return SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: CoverageTeaser(point: point),
      );
    }

    if (isRecalculating) return _SkeletonList(controller: controller);

    if (hasError && evaluation == null) {
      return EmptyStateWidget(
        icon: Icons.error_outline_rounded,
        message: l10n.coverageResultError,
        cta: l10n.retry,
        onCtaTap: onRetry,
      );
    }

    if (evaluation == null) return const SizedBox.shrink();

    if (visible.isEmpty) {
      // Tre esiti diversi, tre messaggi diversi: per l'operatore "nessuno
      // raggiungibile" e "nessuno censito" sono informazioni distinte, e
      // "tutti nascosti dai filtri" non è affatto un risultato vuoto.
      final hiddenByFilters = hiddenCount > 0;
      return EmptyStateWidget(
        icon: hiddenByFilters
            ? Icons.filter_alt_off_outlined
            : Icons.cell_tower_outlined,
        message: hiddenByFilters
            ? l10n.coverageResultHiddenByFilters(hiddenCount)
            : evaluation!.entries.isEmpty
                ? l10n.coverageResultEmptyNoRepeaters
                : l10n.coverageResultEmptyNoReachable,
        cta: hiddenByFilters ? l10n.coverageResultClearFilters : null,
        onCtaTap: hiddenByFilters ? onClearFilters : null,
      );
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      itemCount: visible.length + (hiddenCount > 0 ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == visible.length) {
          return _HiddenByFilters(
            hidden: hiddenCount,
            onClearFilters: onClearFilters,
          );
        }
        final entry = visible[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: RepeaterCard(
            repeater: entry.repeater,
            signalDbm: entry.verdict.dbm,
          ),
        );
      },
    );
  }
}

/// Sagome al posto della lista durante un ricalcolo.
///
/// Non è decorazione: rimpiazzando la lista invece di sovrapporsi a essa,
/// dichiara che i risultati di prima non valgono più per il raggio appena
/// scelto — che è esattamente ciò che una rotella sopra una lista vecchia non
/// riusciva a dire.
class _SkeletonList extends StatelessWidget {
  const _SkeletonList({required this.controller});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        height: 92,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest
              .withValues(alpha: 1 - index * 0.18),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class _HiddenByFilters extends StatelessWidget {
  const _HiddenByFilters({required this.hidden, required this.onClearFilters});

  final int hidden;
  final VoidCallback? onClearFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 4),
      child: Row(
        children: [
          Icon(
            Icons.filter_alt_outlined,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
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
