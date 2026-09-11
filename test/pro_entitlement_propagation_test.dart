import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

// ---------------------------------------------------------------------------
// L'assunto su cui poggia la correzione del flusso d'acquisto: dopo un
// acquisto NON serve invalidare `isProProvider`, perché RevenueCat aggiorna il
// `CustomerInfo` e `proStatusChanges()` emette. Questi test fissano i due lati
// della cosa — che la propagazione funziona, e che invalidare fa il danno che
// è stato osservato in produzione (paywall riproposta a chi ha appena pagato).
//
// Quello che qui NON si può verificare è che l'SDK vero emetta davvero dopo un
// acquisto vero: quello è un contratto di RevenueCat, e si controlla solo con
// un acquisto in sandbox su dispositivo.
// ---------------------------------------------------------------------------

class _FakeRevenueCatClient extends Fake implements RevenueCatClient {
  _FakeRevenueCatClient({required this.pro});

  /// Valore restituito dalla verifica live.
  bool pro;

  /// Quando è valorizzato, la verifica live resta appesa finché non lo si
  /// completa: è la finestra di rete — fino a 5 secondi — durante la quale
  /// il provider invalidato non ha ancora una risposta.
  Completer<bool>? liveSospesa;

  final _changes = StreamController<bool>.broadcast();

  /// Simula l'aggiornamento del `CustomerInfo` che segue un acquisto.
  void emetteAcquisto() {
    pro = true;
    _changes.add(true);
  }

  @override
  Future<bool> isPro() {
    final sospesa = liveSospesa;
    if (sospesa != null) return sospesa.future;
    return Future.value(pro);
  }

  @override
  Stream<bool> proStatusChanges() => _changes.stream;

  /// Il provider ha raggiunto l'`await for` e sta ascoltando.
  bool get inAscolto => _changes.hasListener;
}

/// Attende che il provider sia effettivamente in ascolto su
/// `proStatusChanges()`. Un `add` su un broadcast controller senza ascoltatori
/// viene semplicemente perso — ed è la stessa ragione per cui invalidare il
/// provider nel momento dell'acquisto poteva far sparire l'aggiornamento.
Future<void> _attendiAscolto(_FakeRevenueCatClient client) async {
  for (var i = 0; i < 100 && !client.inAscolto; i++) {
    await Future<void>.delayed(Duration.zero);
  }
  expect(client.inAscolto, isTrue, reason: 'provider non in ascolto');
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
  test(
    'senza invalidare, un gate passa a sbloccato quando RevenueCat emette',
    () async {
      final client = _FakeRevenueCatClient(pro: false);
      final storage = _InMemoryStorageClient();
      final container = _container(client, storage);

      // Il listener che il root widget tiene vivo su tutta l'app.
      final letture = <bool>[];
      final sbloccato = Completer<void>();
      container.listen(
        isProProvider,
        (_, next) {
          letture.add(next.value ?? false);
          if ((next.value ?? false) && !sbloccato.isCompleted) {
            sbloccato.complete();
          }
        },
        fireImmediately: true,
      );
      await container.read(isProProvider.future);

      // Com'è la schermata prima di comprare.
      expect(container.read(isProProvider).value ?? false, isFalse);

      // L'acquisto: nessun invalidate, nessuna ricostruzione.
      await _attendiAscolto(client);
      client.emetteAcquisto();
      await sbloccato.future.timeout(const Duration(seconds: 5));

      // Il gate è sbloccato, e l'entitlement è stato persistito: al prossimo
      // avvio senza rete l'utente resta Pro.
      expect(container.read(isProProvider).value ?? false, isTrue);
      expect(storage.store['subscription_is_pro_cached'], 'true');

      // Nessuna lettura intermedia ha detto "non Pro" dopo il pagamento.
      expect(letture.last, isTrue);
    },
  );

  test(
    'invalidare fa leggere ai gate il valore PRE-acquisto per tutta la rete',
    () async {
      final client = _FakeRevenueCatClient(pro: false);
      final container = _container(client, _InMemoryStorageClient());

      final sub =
          container.listen(isProProvider, (_, __) {}, fireImmediately: true);
      addTearDown(sub.close);
      expect(await container.read(isProProvider.future), isFalse);

      // L'utente compra. La verifica live riparte e resta appesa sulla rete.
      client
        ..pro = true
        ..liveSospesa = Completer<bool>();

      // Ciò che faceva `_onProPurchased`.
      container
        ..invalidate(isProProvider)
        ..listen(isProProvider, (_, __) {}, fireImmediately: true);
      await Future<void>.delayed(Duration.zero);

      // Il provider è in ricaricamento e NON azzera il valore: conserva
      // quello di prima, che è esattamente `false`. Ogni gate che legge
      // `.value ?? false` mostra la paywall a chi ha appena pagato, per
      // tutta la durata della verifica — fino a 5 secondi di rete.
      final durante = container.read(isProProvider);
      expect(durante.isLoading, isTrue);
      expect(durante.value ?? false, isFalse);

      // Quando la rete risponde, l'entitlement arriva. Ma il danno è già
      // avvenuto: la card dorata è stata mostrata e toccata.
      client.liveSospesa!.complete(true);
      await container.read(isProProvider.future);
      expect(container.read(isProProvider).value ?? false, isTrue);
    },
  );
}
