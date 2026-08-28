// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverageSearchRepository)
final coverageSearchRepositoryProvider = CoverageSearchRepositoryProvider._();

final class CoverageSearchRepositoryProvider extends $FunctionalProvider<
    CoverageSearchRepository,
    CoverageSearchRepository,
    CoverageSearchRepository> with $Provider<CoverageSearchRepository> {
  CoverageSearchRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'coverageSearchRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coverageSearchRepositoryHash();

  @$internal
  @override
  $ProviderElement<CoverageSearchRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverageSearchRepository create(Ref ref) {
    return coverageSearchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverageSearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverageSearchRepository>(value),
    );
  }
}

String _$coverageSearchRepositoryHash() =>
    r'1f23b60029e744a337911bff35ce59a587c9336a';
