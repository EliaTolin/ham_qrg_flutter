import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Salva una valutazione come postazione, chiedendo un nome e gestendo il
/// caso di un punto già salvato lì vicino.
Future<void> showSaveStationFlow(
  BuildContext context,
  WidgetRef ref,
  CoverageEvaluation evaluation,
) async {
  final l10n = context.localization;
  final notifier = ref.read(savedStationsProvider.notifier);

  final duplicate = await notifier.findDuplicate(evaluation.point);
  if (!context.mounted) return;

  var replaceId = duplicate?.id;
  if (duplicate != null) {
    // Il sistema propone, non impone: a 200 metri il terreno può cambiare il
    // responso, quindi la decisione resta all'utente (FR-048).
    final choice = await showDialog<_DuplicateChoice>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.stationDuplicateTitle),
        content: Text(
          l10n.stationDuplicateBody(
            context.units.threshold(kSamePlaceThresholdMeters),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(_DuplicateChoice.createNew),
            child: Text(l10n.stationDuplicateCreate),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(_DuplicateChoice.update),
            child: Text(l10n.stationDuplicateUpdate),
          ),
        ],
      ),
    );
    if (choice == null) return;
    if (choice == _DuplicateChoice.createNew) replaceId = null;
  }

  if (!context.mounted) return;
  final name = await _askName(
    context,
    initial: duplicate?.name ?? evaluation.point.label,
  );
  if (name == null || name.trim().isEmpty) return;

  // Ogni fallimento va detto. Un salvataggio che non avviene e non si vede è
  // peggio di un errore: l'utente conta su un dato che non ha.
  try {
    await notifier.save(
      evaluation: evaluation,
      name: name.trim(),
      replaceId: replaceId,
    );
  } on StationSaveFailedException {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.stationSaveFailed)),
    );
    return;
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.stationSaveError)),
    );
    return;
  }

  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(l10n.stationSavedCta)),
  );
}

/// Rimuove una postazione salvata, previa conferma esplicita (FR-051).
Future<void> showRemoveStationFlow(
  BuildContext context,
  WidgetRef ref,
  SavedStation station,
) async {
  final l10n = context.localization;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.stationRemoveTitle),
      content: Text(l10n.stationRemoveBody(station.name)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.coverageResultCancel),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.stationRemoveCta),
        ),
      ],
    ),
  );
  if (confirmed != true) return;

  try {
    await ref.read(savedStationsProvider.notifier).delete(station.id);
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.error_message)),
    );
    return;
  }

  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(l10n.stationRemovedSnack)),
  );
}

/// Chiede un nuovo nome per una postazione già salvata.
Future<void> showRenameStationDialog(
  BuildContext context,
  WidgetRef ref,
  SavedStation station,
) async {
  final name = await _askName(context, initial: station.name);
  if (name == null || name.trim().isEmpty) return;
  await ref
      .read(savedStationsProvider.notifier)
      .rename(station.id, name.trim());
}

enum _DuplicateChoice { update, createNew }

Future<String?> _askName(
  BuildContext context, {
  required String initial,
}) async {
  final controller = TextEditingController(text: initial);
  final l10n = context.localization;

  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.stationSaveTitle),
      content: TextField(
        controller: controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.coverageResultCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: Text(l10n.stationSaveCta),
        ),
      ],
    ),
  );
}
