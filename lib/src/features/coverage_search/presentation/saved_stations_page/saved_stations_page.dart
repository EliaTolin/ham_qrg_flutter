import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/saved_stations_page/saved_stations_tablet.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/saved_stations_page/widgets/bulk_refresh_bar.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/saved_stations_page/widgets/station_tile.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/saved_stations_page/widgets/stations_showcase.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/bulk_refresh_progress.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// "Le mie postazioni": raggiungibile da tutti (FR-054).
///
/// Un utente Pro trova le proprie postazioni; un non Pro trova la vetrina, che
/// è il secondo punto d'ingresso alla conversione.
@RoutePage()
class SavedStationsPage extends HookConsumerWidget {
  const SavedStationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final isPro = ref.watch(isProProvider).value ?? false;
    final async = ref.watch(savedStationsProvider);
    final progress = useState<BulkRefreshProgress?>(null);

    Future<void> refreshAll() async {
      final notifier = ref.read(savedStationsProvider.notifier);
      await for (final step in notifier.refreshAll()) {
        progress.value = step;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stationsTitle),
        actions: [
          if (isPro && (async.value?.isNotEmpty ?? false))
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: l10n.stationRefreshAll,
              onPressed: refreshAll,
            ),
        ],
      ),
      body: !isPro
          ? const StationsShowcase()
          : async.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => Center(child: Text(l10n.error_message)),
              data: (stations) {
                if (stations.isEmpty) return const _EmptyState();
                return Column(
                  children: [
                    if (progress.value != null)
                      BulkRefreshBar(
                        progress: progress.value!,
                        onCancel: () => ref
                            .read(savedStationsProvider.notifier)
                            .cancelBulkRefresh(),
                      ),
                    Expanded(
                      child: ResponsiveLayout(
                        mobile: (context) => _StationList(stations: stations),
                        tablet: (context) =>
                            SavedStationsTablet(stations: stations),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _StationList extends StatelessWidget {
  const _StationList({required this.stations});

  final List<SavedStation> stations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        final station = stations[index];
        return StationTile(
          station: station,
          onTap: () => context.router.push(
            StationDetailRoute(stationId: station.id),
          ),
        );
      },
    );
  }
}

/// La lista vuota è il primo posto in cui la maggior parte degli utenti
/// incontra il concetto di "postazione": ci arrivano dal profilo, prima ancora
/// di aver salvato qualcosa. Una riga sola non basta — chi non ha ancora
/// capito **cosa sia** una postazione non capisce nemmeno perché la sua lista
/// sia vuota, e legge la schermata come un guasto. Quindi qui si spiega prima
/// cos'è, poi i tre passi per farne una, poi si porta l'utente al primo passo.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return ListView(
      padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
      children: [
        Icon(
          Icons.place_outlined,
          size: 48,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.stationsEmptyTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.stationsEmptyBody,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 28),
        _Step(number: 1, text: l10n.stationsEmptyStep1),
        _Step(number: 2, text: l10n.stationsEmptyStep2(l10n.reachMapButton)),
        _Step(number: 3, text: l10n.stationsEmptyStep3),
        const SizedBox(height: 28),
        FilledButton.icon(
          onPressed: () => context.router.push(const RepeatersMapRoute()),
          icon: const Icon(Icons.map_outlined),
          label: Text(l10n.stationsGoToMap),
        ),
      ],
    );
  }
}

/// Un passo della procedura, numerato.
///
/// Il numero è dentro un cerchio e non un semplice "1." perché i tre passi
/// vanno letti come una sequenza da seguire, non come un elenco di opzioni.
class _Step extends StatelessWidget {
  const _Step({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
