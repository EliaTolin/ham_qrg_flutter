import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/saved_stations_page/widgets/station_tile.dart';
import 'package:hamqrg/src/features/coverage_search/presentation/station_detail_page/widgets/station_body.dart';
import 'package:hamqrg/src/features/coverage_search/provider/hydrate_station/hydrate_station_provider.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Su tablet il dettaglio si affianca alla lista invece di sostituirla
/// (FR-059): la larghezza c'è, e passare da una postazione all'altra senza
/// perdere l'elenco è il modo in cui si usa un tablet al banco radio.
class SavedStationsTablet extends HookConsumerWidget {
  const SavedStationsTablet({required this.stations, super.key});

  final List<SavedStation> stations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final selectedId = useState<String>(stations.first.id);
    final selectedModes =
        ref.watch(repeatersMapControllerProvider).value?.selectedModes ??
            const {};
    final hydrated = ref.watch(hydrateStationProvider(selectedId.value));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 340,
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 32),
            itemCount: stations.length,
            itemBuilder: (context, index) {
              final station = stations[index];
              return StationTile(
                station: station,
                selected: station.id == selectedId.value,
                onTap: () => selectedId.value = station.id,
              );
            },
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: hydrated.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Center(child: Text(l10n.error_message)),
            data: (station) => station == null
                ? Center(child: Text(l10n.stationsEmptyTitle))
                : StationBody(
                    hydrated: station,
                    selectedModes: selectedModes,
                    onRefresh: () async {
                      await ref
                          .read(savedStationsProvider.notifier)
                          .refresh(station.station.id);
                      ref.invalidate(
                        hydrateStationProvider(station.station.id),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
