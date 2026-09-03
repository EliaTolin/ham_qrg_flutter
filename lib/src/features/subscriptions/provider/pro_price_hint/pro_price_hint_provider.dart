import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/model/pro_price_hint.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pro_price_hint_provider.g.dart';

/// Prezzo d'ingresso da mostrare accanto alla CTA di [placement].
///
/// La famiglia è per placement e non globale perché due punti vendita possono
/// risolvere offering diverse — è tutto il senso delle placement RevenueCat:
/// se una superficie serve un listino scontato, la riga di prezzo deve dire
/// *quel* prezzo, non quello di un'altra schermata.
///
/// Restituisce `null` in tutti i casi in cui il prezzo non è disponibile
/// (offline, SDK non configurato, offering vuota): chi lo legge non mostra
/// nulla. Il prezzo è un rinforzo della CTA, mai una sua precondizione.
@riverpod
Future<ProPriceHint?> proPriceHint(Ref ref, PaywallPlacement placement) {
  return ref.watch(revenueCatClientProvider).priceHint(
        placementId: placement.id,
      );
}
