// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_http_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverageDatasource)
final coverageDatasourceProvider = CoverageDatasourceProvider._();

final class CoverageDatasourceProvider extends $FunctionalProvider<
    CoverageDatasource,
    CoverageDatasource,
    CoverageDatasource> with $Provider<CoverageDatasource> {
  CoverageDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'coverageDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coverageDatasourceHash();

  @$internal
  @override
  $ProviderElement<CoverageDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverageDatasource create(Ref ref) {
    return coverageDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverageDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverageDatasource>(value),
    );
  }
}

String _$coverageDatasourceHash() =>
    r'489b5568ac6b986f321988ccd82896450892b788';
