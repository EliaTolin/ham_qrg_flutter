// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spots_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(spotsRepository)
final spotsRepositoryProvider = SpotsRepositoryProvider._();

final class SpotsRepositoryProvider extends $FunctionalProvider<SpotsRepository,
    SpotsRepository, SpotsRepository> with $Provider<SpotsRepository> {
  SpotsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'spotsRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$spotsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SpotsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SpotsRepository create(Ref ref) {
    return spotsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SpotsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SpotsRepository>(value),
    );
  }
}

String _$spotsRepositoryHash() => r'f51aaad52b2e8a1b3e2e85da43c827e8331296cf';
