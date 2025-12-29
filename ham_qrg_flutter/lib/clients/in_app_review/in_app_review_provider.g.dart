// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inAppReview)
final inAppReviewProvider = InAppReviewProvider._();

final class InAppReviewProvider
    extends $FunctionalProvider<InAppReview, InAppReview, InAppReview>
    with $Provider<InAppReview> {
  InAppReviewProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'inAppReviewProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$inAppReviewHash();

  @$internal
  @override
  $ProviderElement<InAppReview> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InAppReview create(Ref ref) {
    return inAppReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppReview value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppReview>(value),
    );
  }
}

String _$inAppReviewHash() => r'1c7c3ee2be93e5001b5e740a9839b2c46be0e0c6';
