import 'package:hamqrg/src/features/coverage_search/data/datasource/prefs_saved_stations_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/repeater_cache_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/saved_stations_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/model/saved_station_model.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/hydrated_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_stations_repository.g.dart';

class SavedStationsRepository {
  SavedStationsRepository(this._datasource, this._cache);

  final SavedStationsDatasource _datasource;
  final RepeaterCacheDatasource _cache;

  /// Le postazioni, dalla più recente.
  ///
  /// Un record illeggibile viene saltato: perdere una postazione corrotta è
  /// spiacevole, non poter aprire la lista lo è molto di più.
  Future<List<SavedStation>> readAll() async {
    final ids = await _datasource.readIndex();
    final stations = <SavedStation>[];
    for (final id in ids) {
      final model = await _datasource.read(id);
      if (model != null) stations.add(model.station);
    }
    return stations;
  }

  Future<SavedStation?> read(String id) async =>
      (await _datasource.read(id))?.station;

  /// Salva la postazione e **scrive in cache tutti i suoi ripetitori**, così
  /// che sia consultabile offline dal primo istante, senza dipendere da
  /// visite precedenti alle singole schede.
  Future<void> save(
    SavedStation station, {
    required List<ResolvedCoverageEntry> resolved,
  }) async {
    await _cache.writeAll(resolved.map((e) => e.repeater).toList());
    await _datasource.write(SavedStationModel(station: station));
  }

  Future<void> rename(String id, String name) async {
    final existing = await read(id);
    if (existing == null) return;
    await _datasource.write(
      SavedStationModel(station: existing.copyWith(name: name)),
    );
  }

  /// Unica rimozione ammessa (FR-051).
  Future<void> delete(String id) => _datasource.delete(id);

  /// La postazione già salvata entro 200 m da [point], se esiste (FR-048).
  Future<SavedStation?> findNear(SearchPoint point) async {
    for (final station in await readAll()) {
      if (station.point.isSamePlace(point)) return station;
    }
    return null;
  }

  /// Risolve i ripetitori dalla cache condivisa.
  ///
  /// Non tocca mai la rete: le voci non scadono, quindi la lettura è locale e
  /// istantanea anche con trecento ripetitori. Le voci mancanti finiscono in
  /// `missingIds` e degradano da sole.
  Future<HydratedStation> hydrate(SavedStation station) async {
    final resolved = <String, CachedRepeater>{};
    final missing = <String>{};

    for (final entry in station.entries) {
      final cached = await _cache.readCached(entry.repeaterId);
      if (cached == null) {
        missing.add(entry.repeaterId);
      } else {
        resolved[entry.repeaterId] = cached;
      }
    }

    return HydratedStation(
      station: station,
      repeaters: resolved,
      missingIds: missing,
    );
  }
}

@riverpod
Future<SavedStationsRepository> savedStationsRepository(Ref ref) async {
  final datasource = await ref.watch(savedStationsDatasourceProvider.future);
  return SavedStationsRepository(
    datasource,
    ref.watch(repeaterCacheDatasourceProvider),
  );
}
