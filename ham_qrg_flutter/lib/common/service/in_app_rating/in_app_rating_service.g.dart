// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_rating_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inAppRatingService)
final inAppRatingServiceProvider = InAppRatingServiceProvider._();

final class InAppRatingServiceProvider extends $FunctionalProvider<
    InAppRatingService,
    InAppRatingService,
    InAppRatingService> with $Provider<InAppRatingService> {
  InAppRatingServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'inAppRatingServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$inAppRatingServiceHash();

  @$internal
  @override
  $ProviderElement<InAppRatingService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppRatingService create(Ref ref) {
    return inAppRatingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppRatingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppRatingService>(value),
    );
  }
}

String _$inAppRatingServiceHash() =>
    r'615f77006b6771083798d25fd728e3adc7cfa246';
