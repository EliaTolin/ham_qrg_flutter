// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(geocodingService)
final geocodingServiceProvider = GeocodingServiceProvider._();

final class GeocodingServiceProvider extends $FunctionalProvider<
    GeocodingService,
    GeocodingService,
    GeocodingService> with $Provider<GeocodingService> {
  GeocodingServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'geocodingServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$geocodingServiceHash();

  @$internal
  @override
  $ProviderElement<GeocodingService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GeocodingService create(Ref ref) {
    return geocodingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeocodingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeocodingService>(value),
    );
  }
}

String _$geocodingServiceHash() => r'5913d99686a7bb24f88506762461d41172074e6d';
