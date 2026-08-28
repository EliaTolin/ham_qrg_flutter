import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/bulk_refresh_progress.dart';

/// Avanzamento dell'aggiornamento massivo, con annullamento (FR-053).
class BulkRefreshBar extends StatelessWidget {
  const BulkRefreshBar({
    required this.progress,
    required this.onCancel,
    super.key,
  });

  final BulkRefreshProgress progress;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final done = progress.isComplete;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          if (!done)
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            Icon(
              progress.failedNames.isEmpty
                  ? Icons.check_circle_rounded
                  : Icons.warning_amber_rounded,
              size: 18,
              color: theme.colorScheme.onSecondaryContainer,
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              done
                  // Esito per singola postazione: quelle fallite restano alla
                  // copia precedente e vanno nominate, non nascoste.
                  ? progress.failedNames.isEmpty
                      ? l10n.stationsRefreshDone
                      : '${l10n.stationsRefreshDone} · '
                          '${progress.failedNames.join(', ')}'
                  : '${progress.done}/${progress.total}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          if (!done)
            TextButton(
              onPressed: onCancel,
              child: Text(l10n.coverageResultCancel),
            ),
        ],
      ),
    );
  }
}
