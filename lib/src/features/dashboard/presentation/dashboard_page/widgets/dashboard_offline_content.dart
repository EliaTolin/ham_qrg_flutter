import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Stato della home quando il device è offline e la cache è vuota: al posto
/// di statistiche a zero e liste vuote dice cosa resta disponibile sul campo
/// (postazioni salvate, mappe scaricate) e offre un Riprova che rivaluta la
/// rete prima di ricaricare. Condiviso fra layout mobile (sheet) e tablet.
class DashboardOfflineContent extends ConsumerWidget {
  const DashboardOfflineContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cloud_off_outlined,
                size: 40,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.dashboardOfflineTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                l10n.dashboardOfflineMessage,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.tonalIcon(
              onPressed: () => context.router.push(const SavedStationsRoute()),
              icon: const Icon(Icons.bookmark_outline_rounded),
              label: Text(l10n.stationsTitle),
            ),
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () async {
                // Prima rivaluta la rete (probe), poi ricarica la home: se la
                // connessione è tornata, questo basta a ripartire online.
                await ref.read(offlineStatusProvider.notifier).refresh();
                await ref.read(dashboardControllerProvider.notifier).reload();
              },
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
