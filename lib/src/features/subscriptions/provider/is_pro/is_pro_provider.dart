import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_pro_provider.g.dart';

/// Chiave SharedPreferences dell'ultimo entitlement noto.
const _kIsProCacheKey = 'subscription_is_pro_cached';

/// Tetto alla verifica live: senza internet `getCustomerInfo()` può restare
/// appeso a lungo, e ogni gate dell'app leggerebbe `false` nel frattempo.
const _kLiveCheckTimeout = Duration(seconds: 5);

/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.
///
/// **Resilienza offline**: ogni valore verificato viene persistito; se la
/// verifica live fallisce o scade (device senza rete, RevenueCat giù),
/// vale l'ultimo entitlement noto. Un Pro sul campo resta Pro — la revoca
/// vera arriva alla prima verifica riuscita, che riallinea il valore
/// persistito (e fa scattare la pulizia cache del lifecycle watcher).
///
/// `keepAlive`: Pro status is global, app-wide and rarely changes, so we keep
/// it warm. Otherwise each gate that mounts restarts the provider from
/// `AsyncLoading` (a one-frame false → flash of "locked") and a cold
/// `ref.read` from an event handler can read `false` before the stream
/// resolves. Kept alive, once it resolves to `true` every reader sees `true`.
@Riverpod(keepAlive: true)
Stream<bool> isPro(Ref ref) async* {
  final client = ref.watch(revenueCatClientProvider);
  final storage = await ref.watch(sharedPrefStorageClientProvider.future);

  Future<void> persist(bool value) async {
    await storage.write(_kIsProCacheKey, value.toString());
  }

  bool initial;
  try {
    initial = await client.isPro().timeout(_kLiveCheckTimeout);
    await persist(initial);
  } catch (_) {
    initial = await storage.read(_kIsProCacheKey) == 'true';
  }
  yield initial;

  await for (final value in client.proStatusChanges()) {
    await persist(value);
    yield value;
  }
}
