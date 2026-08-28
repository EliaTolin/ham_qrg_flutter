import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/station_detail_page/station_detail_tablet.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/station_detail_page/widgets/station_body.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/widgets/save_station_sheet.dart';
import 'package:hamqrg/src/features/coverage_search/provider/hydrate_station/hydrate_station_provider.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Una postazione salvata, consultabile **senza rete**.
///
/// Riceve solo l'identificatore, mai l'entità (Principio I).
@RoutePage()
class StationDetailPage extends ConsumerWidget {
  const StationDetailPage({
    @PathParam('stationId') required this.stationId,
    super.key,
  });

  final String stationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final async = ref.watch(hydrateStationProvider(stationId));
    final selectedModes =
        ref.watch(repeatersMapControllerProvider).value?.selectedModes ??
            const {};

    return Scaffold(
      appBar: AppBar(
        title: Text(async.value?.station.name ?? l10n.stationsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: l10n.stationRefresh,
            onPressed: () => _refresh(ref),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              final station = async.value?.station;
              if (station == null) return;
              if (value == 'rename') {
                await showRenameStationDialog(context, ref, station);
                ref.invalidate(hydrateStationProvider(stationId));
              } else if (value == 'delete') {
                await ref
                    .read(savedStationsProvider.notifier)
                    .delete(stationId);
                if (context.mounted) await context.router.maybePop();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'rename', child: Text(l10n.stationRename)),
              PopupMenuItem(value: 'delete', child: Text(l10n.stationDelete)),
            ],
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.error_message)),
        data: (hydrated) {
          if (hydrated == null) {
            return Center(child: Text(l10n.stationsEmptyTitle));
          }
          return ResponsiveLayout(
            mobile: (context) => StationBody(
              hydrated: hydrated,
              selectedModes: selectedModes,
              onRefresh: () => _refresh(ref),
            ),
            tablet: (context) => StationDetailTablet(
              hydrated: hydrated,
              selectedModes: selectedModes,
              onRefresh: () => _refresh(ref),
            ),
          );
        },
      ),
    );
  }

  Future<void> _refresh(WidgetRef ref) async {
    await ref.read(savedStationsProvider.notifier).refresh(stationId);
    ref.invalidate(hydrateStationProvider(stationId));
  }
}
