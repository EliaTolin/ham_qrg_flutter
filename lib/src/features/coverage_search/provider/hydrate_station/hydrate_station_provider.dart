import 'package:hamqrg/src/features/coverage_search/data/repository/saved_stations_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/hydrated_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydrate_station_provider.g.dart';

/// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
///
/// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
/// identica online e offline e si apre in un istante (SC-005).
@riverpod
Future<HydratedStation?> hydrateStation(Ref ref, String stationId) async {
  final repository = await ref.watch(savedStationsRepositoryProvider.future);
  final station = await repository.read(stationId);
  if (station == null) return null;
  return repository.hydrate(station);
}
