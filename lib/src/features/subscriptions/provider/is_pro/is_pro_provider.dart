import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_pro_provider.g.dart';

/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.
@riverpod
Stream<bool> isPro(Ref ref) async* {
  final client = ref.watch(revenueCatClientProvider);
  yield await client.isPro();
  yield* client.proStatusChanges();
}
