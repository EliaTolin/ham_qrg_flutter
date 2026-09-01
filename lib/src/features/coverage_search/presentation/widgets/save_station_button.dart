import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/save_station_sheet.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Azione di salvataggio di una valutazione, che **mostra il proprio esito**.
///
/// Finché il punto non è salvato è un invito a salvarlo; appena lo è diventa
/// la conferma che lo è, con accanto il modo di tornare indietro. Un pulsante
/// che resta identico dopo essere stato premuto lascia l'utente senza sapere
/// se l'azione sia andata a buon fine.
class SaveStationButton extends ConsumerWidget {
  const SaveStationButton({required this.evaluation, super.key});

  final CoverageEvaluation evaluation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final saved = _savedHere(ref);

    if (saved == null) {
      return FilledButton.icon(
        onPressed: () => showSaveStationFlow(context, ref, evaluation),
        icon: const Icon(Icons.bookmark_add_outlined),
        label: Text(l10n.stationSaveCta),
      );
    }

    return Row(
      children: [
        Icon(Icons.bookmark_added, size: 20, color: colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            saved.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () => showRemoveStationFlow(context, ref, saved),
          icon: const Icon(Icons.delete_outline, size: 18),
          label: Text(l10n.stationRemoveCta),
          style: TextButton.styleFrom(foregroundColor: colorScheme.error),
        ),
      ],
    );
  }

  /// La postazione già salvata su questo punto, se c'è.
  ///
  /// Osservare la lista (invece di interrogare il repository) fa due cose in
  /// una: aggiorna il pulsante nell'istante del salvataggio, e tiene vivo il
  /// notifier per tutta la durata del foglio.
  SavedStation? _savedHere(WidgetRef ref) {
    final stations = ref.watch(savedStationsProvider).asData?.value;
    if (stations == null) return null;
    for (final station in stations) {
      if (station.point.isSamePlace(evaluation.point)) return station;
    }
    return null;
  }
}
