// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_image_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Istanza unica dell'archivio PNG: condivisa fra il datasource di coverage e
/// il watcher che la svuota alla decadenza dell'entitlement.

@ProviderFor(coverageImageCache)
final coverageImageCacheProvider = CoverageImageCacheProvider._();

/// Istanza unica dell'archivio PNG: condivisa fra il datasource di coverage e
/// il watcher che la svuota alla decadenza dell'entitlement.

final class CoverageImageCacheProvider extends $FunctionalProvider<
    CoverageImageCache,
    CoverageImageCache,
    CoverageImageCache> with $Provider<CoverageImageCache> {
  /// Istanza unica dell'archivio PNG: condivisa fra il datasource di coverage e
  /// il watcher che la svuota alla decadenza dell'entitlement.
  CoverageImageCacheProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'coverageImageCacheProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coverageImageCacheHash();

  @$internal
  @override
  $ProviderElement<CoverageImageCache> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverageImageCache create(Ref ref) {
    return coverageImageCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverageImageCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverageImageCache>(value),
    );
  }
}

String _$coverageImageCacheHash() =>
    r'd6c7d539d272a76eaf887c1a4ae7faee770165fd';
