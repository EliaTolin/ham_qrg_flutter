import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/common/errors/offline_exception.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/profile/data/datasource/cached_profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/cached_repeaters_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/access/repeater_access_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/network/network_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';
import 'package:remote_caching/remote_caching.dart';

// ---------------------------------------------------------------------------
// Round-trip offline dei decorator: una sessione ONLINE (Pro) popola la
// cache, una sessione OFFLINE (nuova istanza, come dopo un riavvio) deve
// servire la stessa risposta senza toccare la rete.
//
// `remote_caching` usa sqflite_common_ffi internamente: il DB in-memory
// gira nei test VM senza plugin nativi.
// ---------------------------------------------------------------------------

const _repeater = RepeaterModel(
  id: 'rep-1',
  createdAt: '2024-01-01T00:00:00Z',
  updatedAt: '2024-01-02T00:00:00Z',
  frequencyHz: 145600000,
  source: 'test',
  callsign: 'IR4UAA',
  name: 'Monte Test',
  lat: 44.58,
  lon: 10.73,
  distanceM: 1234.5,
  accesses: [
    RepeaterAccessModel(
      id: 'acc-1',
      repeaterId: 'rep-1',
      mode: 'dmr',
      source: 'test',
      createdAt: '2024-01-01T00:00:00Z',
      updatedAt: '2024-01-02T00:00:00Z',
      networkId: 'net-1',
      network: NetworkModel(
        id: 'net-1',
        name: 'BrandMeister',
        kind: 'dmr',
        createdAt: '2024-01-01T00:00:00Z',
      ),
      colorCode: 1,
      ctcssTxHz: 88.5,
    ),
  ],
);

const _profile = ProfileModel(
  id: 'user-1',
  firstName: 'Elia',
  lastName: 'Test',
  callsign: 'IU4TEST',
  propic: null,
  userType: UserType.licensed,
);

/// Datasource "di rete": conta le chiamate e, se [available] è falso, esplode
/// come farebbe Supabase senza connettività.
class _FakeRepeatersDatasource extends Fake implements RepeatersDatasource {
  _FakeRepeatersDatasource({this.available = true});

  final bool available;
  int nearbyCalls = 0;
  int favoritesCalls = 0;

  @override
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    List<String>? accessModes,
    int limit = 50,
  }) async {
    nearbyCalls++;
    if (!available) throw Exception('network down');
    return [_repeater];
  }

  @override
  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId) async {
    favoritesCalls++;
    if (!available) throw Exception('network down');
    return [_repeater];
  }
}

class _FakeProfileDatasource extends Fake implements ProfileDatasource {
  int calls = 0;

  @override
  Future<ProfileModel> getProfile(String userId) async {
    calls++;
    return _profile;
  }
}

void main() {
  setUpAll(() async {
    await RemoteCaching.instance.init(
      databasePath: getInMemoryDatabasePath(),
    );
  });

  setUp(() async {
    await RemoteCaching.instance.clearCacheByPrefix('repeaters:v1:');
    await RemoteCaching.instance.clearCacheByPrefix('favorites:v1:');
    await RemoteCaching.instance.clearCacheByPrefix('profile:v1:');
  });

  group('CachedRepeatersDatasource', () {
    test('Pro: nearby popolato online viene servito offline', () async {
      final online = _FakeRepeatersDatasource();
      final onlineDs = CachedRepeatersDatasource(
        inner: online,
        gate: const OfflineCacheGate(isPro: true, isOffline: false),
      );
      final fetched = await onlineDs.getRepeatersNearby(
        latitude: 44.5833,
        longitude: 10.7333,
        radiusKm: 100,
      );
      expect(fetched, [_repeater]);
      expect(online.nearbyCalls, 1);

      // Riavvio offline: nuova istanza, rete assente, GPS leggermente diverso.
      final offlineInner = _FakeRepeatersDatasource(available: false);
      final offlineDs = CachedRepeatersDatasource(
        inner: offlineInner,
        gate: const OfflineCacheGate(isPro: true, isOffline: true),
      );
      final cached = await offlineDs.getRepeatersNearby(
        latitude: 44.5791,
        longitude: 10.7402,
        radiusKm: 100,
      );
      expect(cached, [_repeater]);
      expect(
        offlineInner.nearbyCalls,
        0,
        reason: 'offline non si chiama la rete',
      );
    });

    test('Pro offline senza cache: OfflineException', () async {
      final ds = CachedRepeatersDatasource(
        inner: _FakeRepeatersDatasource(available: false),
        gate: const OfflineCacheGate(isPro: true, isOffline: true),
      );
      expect(
        () => ds.getRepeatersNearby(latitude: 1, longitude: 1),
        throwsA(isA<OfflineException>()),
      );
    });

    test('Free offline: OfflineException anche con cache piena', () async {
      await CachedRepeatersDatasource(
        inner: _FakeRepeatersDatasource(),
        gate: const OfflineCacheGate(isPro: true, isOffline: false),
      ).getRepeatersNearby(latitude: 1, longitude: 1);

      final free = CachedRepeatersDatasource(
        inner: _FakeRepeatersDatasource(available: false),
        gate: const OfflineCacheGate(isPro: false, isOffline: true),
      );
      expect(
        () => free.getRepeatersNearby(latitude: 1, longitude: 1),
        throwsA(isA<OfflineException>()),
      );
    });

    test('Pro: preferiti popolati online vengono serviti offline', () async {
      await CachedRepeatersDatasource(
        inner: _FakeRepeatersDatasource(),
        gate: const OfflineCacheGate(isPro: true, isOffline: false),
      ).getFavoriteRepeaters('user-1');

      final offline = CachedRepeatersDatasource(
        inner: _FakeRepeatersDatasource(available: false),
        gate: const OfflineCacheGate(isPro: true, isOffline: true),
      );
      expect(await offline.getFavoriteRepeaters('user-1'), [_repeater]);
    });
  });

  group('CachedProfileDatasource', () {
    test('Pro: profilo popolato online viene servito offline', () async {
      final online = _FakeProfileDatasource();
      await CachedProfileDatasource(
        inner: online,
        gate: const OfflineCacheGate(isPro: true, isOffline: false),
      ).getProfile('user-1');
      expect(online.calls, 1);

      final offlineInner = _FakeProfileDatasource();
      final offline = CachedProfileDatasource(
        inner: offlineInner,
        gate: const OfflineCacheGate(isPro: true, isOffline: true),
      );
      expect(await offline.getProfile('user-1'), _profile);
      expect(offlineInner.calls, 0);
    });
  });
}
