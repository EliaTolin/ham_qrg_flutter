// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brandmeister_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(brandmeisterRepository)
final brandmeisterRepositoryProvider = BrandmeisterRepositoryProvider._();

final class BrandmeisterRepositoryProvider extends $FunctionalProvider<
    BrandmeisterRepository,
    BrandmeisterRepository,
    BrandmeisterRepository> with $Provider<BrandmeisterRepository> {
  BrandmeisterRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'brandmeisterRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$brandmeisterRepositoryHash();

  @$internal
  @override
  $ProviderElement<BrandmeisterRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrandmeisterRepository create(Ref ref) {
    return brandmeisterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandmeisterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandmeisterRepository>(value),
    );
  }
}

String _$brandmeisterRepositoryHash() =>
    r'b32e2fbe120d6000d2b373dba6f42c5480ceaa00';
