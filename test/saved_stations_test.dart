@Tags(['integration'])
@Timeout(Duration(minutes: 4))
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/prefs_saved_stations_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/repeater_cache_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/repository/saved_stations_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:remote_caching/remote_caching.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/in_memory_storage_client.dart';

// ---------------------------------------------------------------------------
// Ciclo di vita di una postazione salvata: salva → risolvi → aggiorna, con la
// cache reale di remote_caching su database in memoria.
//
// Verifica ciò che nessun mock potrebbe: che la sentinella di scadenza tenga
// davvero, che la postazione si apra senza rete e che l'aggiornamento di un
// singolo ripetitore fatto ALTROVE nell'app si rifletta sulla postazione.
// ---------------------------------------------------------------------------

const _point = SearchPoint(
  latitude: 46.4879,
  longitude: 11.8123,
  label: 'Passo Pordoi',
  origin: SearchPointOrigin.placeSearch,
);

DateTime _now() => DateTime.utc(2026, 8, 26, 12);

Repeater _repeater(String id, {String? name}) => Repeater(
      id: id,
      createdAt: _now(),
      updatedAt: _now(),
      frequencyHz: 145725000,
      source: 'test',
      callsign: 'IR3UHF',
      name: name ?? 'Ponte $id',
      accesses: [
        RepeaterAccess(
          id: 'acc-1',
          repeaterId: id,
          mode: AccessMode.analog,
          source: 'test',
          createdAt: _now(),
          updatedAt: _now(),
          ctcssTxHz: 123,
        ),
      ],
    );

SavedStation _station(List<Repeater> repeaters) => SavedStation(
      id: 'station-test',
      name: 'Pordoi',
      point: _point,
      breadth: SearchBreadth.quick,
      computedAt: _now(),
      lastRefreshedAt: _now(),
      entries: [
        for (final r in repeaters)
          CoverageEntry(
            repeaterId: r.id,
            dbm: -95,
            distanceKm: 12,
            reachable: true,
          ),
      ],
    );

List<ResolvedCoverageEntry> _resolved(List<Repeater> repeaters) => [
      for (final r in repeaters)
        ResolvedCoverageEntry(
          repeater: r,
          verdict: CoverageEntry(
            repeaterId: r.id,
            dbm: -95,
            distanceKm: 12,
            reachable: true,
          ),
        ),
    ];

void main() {
  late RepeaterCacheDatasource cache;
  late SavedStationsRepository repository;
  late InMemoryStorageClient storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await RemoteCaching.instance.init(
      databasePath: getInMemoryDatabasePath(),
      defaultCacheDuration: const Duration(days: 365),
    );
    cache = RemoteCachingRepeaterDatasource(RemoteCaching.instance);
    storage = InMemoryStorageClient();
    repository = SavedStationsRepository(
      PrefsSavedStationsDatasource(storage),
      cache,
    );
  });

  tearDown(() async {
    await RemoteCaching.instance.clearCache();
    await RemoteCaching.instance.dispose();
  });

  group('salvataggio e consultazione', () {
    test('should save a station and read it back with full repeater data',
        () async {
      final repeaters = [_repeater('r1'), _repeater('r2')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      final saved = await repository.read('station-test');
      expect(saved, isNotNull);
      expect(saved!.entries, hasLength(2));
      expect(saved.reachableCount, 2);

      final hydrated = await repository.hydrate(saved);
      expect(hydrated.missingIds, isEmpty);
      expect(hydrated.entries, hasLength(2));

      // I dati operativi necessari a sintonizzarsi ci sono tutti (SC-004).
      final first = hydrated.entries.first.repeater;
      expect(first.frequencyHz, 145725000);
      expect(first.callsign, 'IR3UHF');
      expect(first.accesses.single.mode, AccessMode.analog);
      expect(first.accesses.single.ctcssTxHz, 123);
    });

    test('should keep the station light: only references, no repeater payload',
        () async {
      final repeaters = [_repeater('r1')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      final raw = await storage.read('${kStationKeyPrefix}station-test');
      expect(raw, isNotNull);
      // Il nominativo del ripetitore vive nella cache condivisa, NON nel
      // record: è ciò che tiene una postazione a pochi KB invece di centinaia.
      expect(raw!.contains('IR3UHF'), isFalse);
      expect(raw.contains('r1'), isTrue);
    });

    test('should survive a cache re-init, which deletes expired entries',
        () async {
      final repeaters = [_repeater('r1')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      // `init()` esegue DELETE FROM cache WHERE expires_at < now. Con una
      // scadenza normale la voce sparirebbe qui, portandosi via l'offline
      // della postazione. La sentinella è ciò che lo impedisce (FR-051).
      await RemoteCaching.instance.dispose();
      await RemoteCaching.instance.init(
        databasePath: getInMemoryDatabasePath(),
        defaultCacheDuration: const Duration(days: 365),
      );

      final stats = await RemoteCaching.instance.getCacheStats();
      expect(stats.expiredEntries, 0);
    });
  });

  group('aggiornamento indiretto', () {
    test('should reflect a repeater refreshed elsewhere in the app', () async {
      final original = _repeater('r1', name: 'Nome di ottobre');
      await repository.save(
        _station([original]),
        resolved: _resolved([original]),
      );

      final before =
          await repository.hydrate((await repository.read('station-test'))!);
      expect(before.entries.single.repeater.name, 'Nome di ottobre');

      // L'utente apre la scheda del ripetitore da un'altra parte dell'app:
      // `readFresh` riscrive la voce condivisa.
      await cache.readFresh(
        'r1',
        remote: () async => _repeater('r1', name: 'Nome di febbraio'),
      );

      // La postazione, riaperta, mostra il dato nuovo senza che nessuno abbia
      // rieseguito il calcolo di copertura.
      final after =
          await repository.hydrate((await repository.read('station-test'))!);
      expect(after.entries.single.repeater.name, 'Nome di febbraio');
      expect(
        after.station.entries.single.dbm,
        -95,
        reason: 'il verdetto resta quello del punto',
      );
    });

    test('should share one cached copy across stations', () async {
      final repeaters = [_repeater('shared')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );
      await repository.save(
        _station(repeaters).copyWith(id: 'station-2', name: 'Altra'),
        resolved: _resolved(repeaters),
      );

      final stats = await RemoteCaching.instance.getCacheStats();
      expect(stats.totalEntries, 1, reason: 'una sola copia condivisa');
    });
  });

  group('robustezza', () {
    test('should degrade a missing entry without failing the whole station',
        () async {
      final repeaters = [_repeater('r1'), _repeater('r2')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      await RemoteCaching.instance
          .clearCacheForKey('${kRepeaterCachePrefix}r2');

      final hydrated =
          await repository.hydrate((await repository.read('station-test'))!);
      expect(hydrated.missingIds, {'r2'});
      expect(hydrated.entries, hasLength(1));
    });

    test('should propose the existing station for a point within 200 m',
        () async {
      final repeaters = [_repeater('r1')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      // ~111 m più a nord.
      const near = SearchPoint(
        latitude: 46.4889,
        longitude: 11.8123,
        label: 'vicino',
        origin: SearchPointOrigin.mapLongPress,
      );
      expect((await repository.findNear(near))?.id, 'station-test');

      // ~333 m più a nord: posto diverso.
      const far = SearchPoint(
        latitude: 46.4909,
        longitude: 11.8123,
        label: 'lontano',
        origin: SearchPointOrigin.mapLongPress,
      );
      expect(await repository.findNear(far), isNull);
    });

    test('should remove a station only on explicit delete', () async {
      final repeaters = [_repeater('r1')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );
      expect(await repository.readAll(), hasLength(1));

      await repository.delete('station-test');
      expect(await repository.readAll(), isEmpty);

      // Il payload del ripetitore resta in cache: potrebbe servire ad altre
      // postazioni, e comunque è rigenerabile.
      expect(await cache.readCached('r1'), isA<CachedRepeater>());
    });

    test('should rename without touching the stored result', () async {
      final repeaters = [_repeater('r1')];
      await repository.save(
        _station(repeaters),
        resolved: _resolved(repeaters),
      );

      await repository.rename('station-test', 'Nuovo nome');
      final renamed = await repository.read('station-test');
      expect(renamed!.name, 'Nuovo nome');
      expect(renamed.entries, hasLength(1));
    });
  });
}
