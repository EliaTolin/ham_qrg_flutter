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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => context.router.push(const RepeatersMapRoute()),
              icon: const Icon(Icons.map_outlined),
              label: Text(l10n.stationsGoToMap),
            ),
          ],
        ),
      ),
    );
  }
}
