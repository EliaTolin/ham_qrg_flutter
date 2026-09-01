import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/src/features/subscriptions/provider/offline_cache_lifecycle/offline_cache_lifecycle_provider.dart';
import 'package:remote_caching/remote_caching.dart';

class _FakeRevenueCatClient extends Fake implements RevenueCatClient {
  final changes = StreamController<bool>.broadcast();
  @override
  Future<bool> isPro() async => true;
  @override
  Stream<bool> proStatusChanges() => changes.stream;
}

class _InMemoryStorageClient extends Fake implements StorageClient {
  final store = <String, String>{};
  @override
  Future<String?> read(String key) async => store[key];
  @override
  Future<bool> write(String key, dynamic value) async {
    store[key] = value as String;
    return true;
  }
}

void main() {
  setUpAll(() async {
    await RemoteCaching.instance.init(databasePath: getInMemoryDatabasePath());
  });

  test('montato con ref.read (come in splash), svuota la cache a Pro→free',
      () async {
    final client = _FakeRevenueCatClient();
    final container = ProviderContainer(
      retry: (_, __) => null,
      overrides: [
        revenueCatClientProvider.overrideWithValue(client),
        sharedPrefStorageClientProvider
            .overrideWith((ref) async => _InMemoryStorageClient()),
      ],
    );
    addTearDown(container.dispose);

    // Come nell'app: un listener attivo tiene vivo lo stream dell'entitlement.
    final sub = container.listen(isProProvider, (_, __) {});
    addTearDown(sub.close);
    await container.read(isProProvider.future);

    container.read(offlineCacheLifecycleProvider);

    await RemoteCaching.instance.call<String>(
      'repeaters:v1:probe',
      remote: () async => 'x',
      fromJson: (j) => j! as String,
    );
    expect(await RemoteCaching.instance.isCached('repeaters:v1:probe'), isTrue);

    client.changes.add(false);
    await Future<void>.delayed(const Duration(milliseconds: 300));

    expect(
      await RemoteCaching.instance.isCached('repeaters:v1:probe'),
      isFalse,
      reason: 'il watcher deve reagire alla transizione true → false',
    );
  });
}
