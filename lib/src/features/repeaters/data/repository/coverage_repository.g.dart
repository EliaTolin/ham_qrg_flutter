// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverageRepository)
final coverageRepositoryProvider = CoverageRepositoryProvider._();

final class CoverageRepositoryProvider extends $FunctionalProvider<
    CoverageRepository,
    CoverageRepository,
    CoverageRepository> with $Provider<CoverageRepository> {
  CoverageRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'coverageRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coverageRepositoryHash();

  @$internal
  @override
  $ProviderElement<CoverageRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverageRepository create(Ref ref) {
    return coverageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverageRepository>(value),
    );
  }
}

String _$coverageRepositoryHash() =>
    r'375c9d4b790fe7def6bdcf3947aeb4d5c01a5c02';
