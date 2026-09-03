// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pro_price_hint_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(proPriceHint)
final proPriceHintProvider = ProPriceHintFamily._();

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

final class ProPriceHintProvider extends $FunctionalProvider<
        AsyncValue<ProPriceHint?>, ProPriceHint?, FutureOr<ProPriceHint?>>
    with $FutureModifier<ProPriceHint?>, $FutureProvider<ProPriceHint?> {
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
  ProPriceHintProvider._(
      {required ProPriceHintFamily super.from,
      required PaywallPlacement super.argument})
      : super(
          retry: null,
          name: r'proPriceHintProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$proPriceHintHash();

  @override
  String toString() {
    return r'proPriceHintProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProPriceHint?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ProPriceHint?> create(Ref ref) {
    final argument = this.argument as PaywallPlacement;
    return proPriceHint(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProPriceHintProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$proPriceHintHash() => r'b2da794d85c48b1e73ac033190d62011ea3fdb6a';

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

final class ProPriceHintFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProPriceHint?>, PaywallPlacement> {
  ProPriceHintFamily._()
      : super(
          retry: null,
          name: r'proPriceHintProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

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

  ProPriceHintProvider call(
    PaywallPlacement placement,
  ) =>
      ProPriceHintProvider._(argument: placement, from: this);

  @override
  String toString() => r'proPriceHintProvider';
}
