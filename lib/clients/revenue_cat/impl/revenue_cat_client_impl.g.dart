// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_cat_client_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(revenueCatClient)
final revenueCatClientProvider = RevenueCatClientProvider._();

final class RevenueCatClientProvider extends $FunctionalProvider<
    RevenueCatClient,
    RevenueCatClient,
    RevenueCatClient> with $Provider<RevenueCatClient> {
  RevenueCatClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'revenueCatClientProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$revenueCatClientHash();

  @$internal
  @override
  $ProviderElement<RevenueCatClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RevenueCatClient create(Ref ref) {
    return revenueCatClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevenueCatClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevenueCatClient>(value),
    );
  }
}

String _$revenueCatClientHash() => r'70df8c526e9407fbb5e48d3751ecc9f70d584ed8';
