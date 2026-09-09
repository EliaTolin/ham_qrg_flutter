// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_review_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appReviewClient)
final appReviewClientProvider = AppReviewClientProvider._();

final class AppReviewClientProvider extends $FunctionalProvider<AppReviewClient,
    AppReviewClient, AppReviewClient> with $Provider<AppReviewClient> {
  AppReviewClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appReviewClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appReviewClientHash();

  @$internal
  @override
  $ProviderElement<AppReviewClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppReviewClient create(Ref ref) {
    return appReviewClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppReviewClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppReviewClient>(value),
    );
  }
}

String _$appReviewClientHash() => r'c01b5f9d7a2dc0e3fada76a207d6edbf7061dbdd';
