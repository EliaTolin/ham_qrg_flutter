import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

// ---------------------------------------------------------------------------
// `isProProvider` è uno StreamProvider keepAlive. Su Riverpod 3 un provider
// senza listener ATTIVO è sospeso: lo stream non emette nemmeno il primo
// valore e `.future` resta appeso. È il motivo per cui il root widget
// (lib/src/app.dart) e la splash tengono un `ref.listen` sul provider: senza,
// ogni lettura sincrona `.value ?? false` darebbe "free" e i datasource
// nascerebbero senza cache offline.
// ---------------------------------------------------------------------------

class _FakeRevenueCatClient extends Fake implements RevenueCatClient {
  _FakeRevenueCatClient({required this.pro, this.liveFails = false});
  final bool pro;
  final bool liveFails;

  @override
  Future<bool> isPro() async {
    if (liveFails) throw Exception('no network');
    return pro;
  }

  @override
  Stream<bool> proStatusChanges() => const Stream.empty();
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

ProviderContainer _container(RevenueCatClient client, StorageClient storage) {
  final container = ProviderContainer(
    retry: (_, __) => null,
    overrides: [
      revenueCatClientProvider.overrideWithValue(client),
      sharedPrefStorageClientProvider.overrideWith((ref) async => storage),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('senza un listener attivo lo stream non emette (Riverpod 3)', () async {
    final container =
        _container(_FakeRevenueCatClient(pro: true), _InMemoryStorageClient())
          ..read(isProProvider);
    await Future<void>.delayed(const Duration(milliseconds: 300));

    expect(
      container.read(isProProvider).value,
      isNull,
      reason: 'se questo test fallisce, Riverpod ha cambiato semantica: '
          'i listener nel root widget potrebbero non servire più',
    );
  });

  test('con un listener attivo .future si risolve e persiste il valore',
      () async {
    final storage = _InMemoryStorageClient();
    final container = _container(_FakeRevenueCatClient(pro: true), storage);

    final sub = container.listen(isProProvider, (_, __) {});
    addTearDown(sub.close);

    final value = await container
        .read(isProProvider.future)
        .timeout(const Duration(seconds: 2));
    expect(value, isTrue);
    expect(container.read(isProProvider).value, isTrue);
    expect(storage.store['subscription_is_pro_cached'], 'true');
  });

  test('verifica live fallita: vale l’entitlement persistito', () async {
    final storage = _InMemoryStorageClient()
      ..store['subscription_is_pro_cached'] = 'true';
    final container = _container(
      _FakeRevenueCatClient(pro: false, liveFails: true),
      storage,
    );

    final sub = container.listen(isProProvider, (_, __) {});
    addTearDown(sub.close);

    final value = await container
        .read(isProProvider.future)
        .timeout(const Duration(seconds: 2));
    expect(value, isTrue);
  });
}
