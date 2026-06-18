import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_pro_provider.g.dart';

/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.
///
/// `keepAlive`: Pro status is global, app-wide and rarely changes, so we keep
/// it warm. Otherwise each gate that mounts restarts the provider from
/// `AsyncLoading` (a one-frame false → flash of "locked") and a cold
/// `ref.read` from an event handler can read `false` before the stream
/// resolves. Kept alive, once it resolves to `true` every reader sees `true`.
@Riverpod(keepAlive: true)
Stream<bool> isPro(Ref ref) async* {
  final client = ref.watch(revenueCatClientProvider);
  yield await client.isPro();
  yield* client.proStatusChanges();
}
