// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brandmeister_api_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(brandmeisterDatasource)
final brandmeisterDatasourceProvider = BrandmeisterDatasourceProvider._();

final class BrandmeisterDatasourceProvider extends $FunctionalProvider<
    BrandmeisterDatasource,
    BrandmeisterDatasource,
    BrandmeisterDatasource> with $Provider<BrandmeisterDatasource> {
  BrandmeisterDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'brandmeisterDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$brandmeisterDatasourceHash();

  @$internal
  @override
  $ProviderElement<BrandmeisterDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrandmeisterDatasource create(Ref ref) {
    return brandmeisterDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrandmeisterDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrandmeisterDatasource>(value),
    );
  }
}

String _$brandmeisterDatasourceHash() =>
    r'c38dd5156c4409bf23225f99f0cdc4f451f54b15';
