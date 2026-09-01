@Tags(['integration'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/prefs_saved_stations_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/repeater_cache_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/repository/saved_stations_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remote_caching/remote_caching.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/in_memory_storage_client.dart';

// ---------------------------------------------------------------------------
// Il notifier delle postazioni salvate visto dal flusso reale della UI:
// si ottiene con un `ref.read`, si apre un dialog per il nome, e solo dopo
// qualche secondo si salva.
// ---------------------------------------------------------------------------

const _point = SearchPoint(
  latitude: 46.4879,
  longitude: 11.8123,
  label: 'Passo Pordoi',
  origin: SearchPointOrigin.placeSearch,
);

DateTime _now() => DateTime.utc(2026, 8, 26, 12);

Repeater _repeater(String id) => Repeater(
      id: id,
      createdAt: _now(),
      updatedAt: _now(),
      frequencyHz: 145725000,
      source: 'test',
      callsign: 'IR3UHF',
      name: 'Ponte $id',
      accesses: [
        RepeaterAccess(
          id: 'acc-1',
          repeaterId: id,
          mode: AccessMode.analog,
          source: 'test',
          createdAt: _now(),
          updatedAt: _now(),
        ),
      ],
    );

CoverageEvaluation _evaluation() {
  final repeaters = [_repeater('r1')];
  final entries = [
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
  return CoverageEvaluation(
    point: _point,
    breadth: SearchBreadth.quick,
    computedAt: _now(),
    entries: entries,
  );
}

void main() {
  late ProviderContainer container;
  late InMemoryStorageClient storage;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await RemoteCaching.instance.init(
      databasePath: getInMemoryDatabasePath(),
      defaultCacheDuration: const Duration(days: 365),
    );
    storage = InMemoryStorageClient();
    container = ProviderContainer(
      overrides: [
        savedStationsRepositoryProvider.overrideWith(
          (ref) async => SavedStationsRepository(
            PrefsSavedStationsDatasource(storage),
            RemoteCachingRepeaterDatasource(RemoteCaching.instance),
          ),
        ),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    await RemoteCaching.instance.clearCache();
    await RemoteCaching.instance.dispose();
  });

  test('should save after the name dialog, with nobody watching the notifier',
      () async {
    // Regressione: il notifier era autoDispose e chi lo otteneva con un
    // `ref.read` se lo ritrovava distrutto durante il dialog del nome. Il
    // salvataggio moriva su un Ref smontato, senza salvare e senza dirlo.
    final notifier = container.read(savedStationsProvider.notifier);
    await notifier.findDuplicate(_point);

    // Il tempo che l'utente impiega a digitare un nome.
    await Future<void>.delayed(const Duration(milliseconds: 300));

    await notifier.save(evaluation: _evaluation(), name: 'Pordoi');

    final stations = await container.read(savedStationsProvider.future);
    expect(stations, hasLength(1));
    expect(stations.single.name, 'Pordoi');
    expect(stations.single.entries, hasLength(1));
  });

  test('should still save the station when the offline cache is unavailable',
      () async {
    // La cache dei ripetitori è un acceleratore: se il database locale è
    // inagibile la postazione deve comunque essere conservata, perché è
    // l'unica cosa che l'utente ha chiesto di fare.
    final broken = ProviderContainer(
      overrides: [
        savedStationsRepositoryProvider.overrideWith(
          (ref) async => SavedStationsRepository(
            PrefsSavedStationsDatasource(storage),
            _FailingCache(),
          ),
        ),
      ],
    );
    addTearDown(broken.dispose);

    await broken
        .read(savedStationsProvider.notifier)
        .save(evaluation: _evaluation(), name: 'Pordoi');

    final stations = await broken.read(savedStationsProvider.future);
    expect(stations, hasLength(1));

    // L'offline degrada, la postazione no.
    final repository =
        await broken.read(savedStationsRepositoryProvider.future);
    final hydrated = await repository.hydrate(stations.single);
    expect(hydrated.missingIds, hasLength(1));
  });
}

/// Cache inagibile: ogni operazione solleva, come farebbe `remote_caching`
/// non inizializzato.
class _FailingCache implements RepeaterCacheDatasource {
  @override
  Future<CachedRepeater?> readCached(String repeaterId) async => null;

  @override
  Future<Repeater> readFresh(
    String repeaterId, {
    required Future<Repeater> Function() remote,
  }) async =>
      throw StateError('cache unavailable');

  @override
  Future<void> writeAll(List<Repeater> repeaters) async =>
      throw StateError('cache unavailable');
}
