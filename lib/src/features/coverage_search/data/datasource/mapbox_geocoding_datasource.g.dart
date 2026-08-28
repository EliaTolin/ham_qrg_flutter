// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapbox_geocoding_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(geocodingDatasource)
final geocodingDatasourceProvider = GeocodingDatasourceProvider._();

final class GeocodingDatasourceProvider extends $FunctionalProvider<
    GeocodingDatasource,
    GeocodingDatasource,
    GeocodingDatasource> with $Provider<GeocodingDatasource> {
  GeocodingDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'geocodingDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$geocodingDatasourceHash();

  @$internal
  @override
  $ProviderElement<GeocodingDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GeocodingDatasource create(Ref ref) {
    return geocodingDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeocodingDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeocodingDatasource>(value),
    );
  }
}

String _$geocodingDatasourceHash() =>
    r'62b3b5264068fd762293c9c279bfad022a4907b7';
