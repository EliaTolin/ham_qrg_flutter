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

@ProviderFor(reverseGeocodeLocation)
final reverseGeocodeLocationProvider = ReverseGeocodeLocationFamily._();

final class ReverseGeocodeLocationProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  ReverseGeocodeLocationProvider._(
      {required ReverseGeocodeLocationFamily super.from,
      required ({
        double latitude,
        double longitude,
      })
          super.argument})
      : super(
          retry: null,
          name: r'reverseGeocodeLocationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reverseGeocodeLocationHash();

  @override
  String toString() {
    return r'reverseGeocodeLocationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as ({
      double latitude,
      double longitude,
    });
    return reverseGeocodeLocation(
      ref,
      latitude: argument.latitude,
      longitude: argument.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReverseGeocodeLocationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reverseGeocodeLocationHash() =>
    r'36156795772418ff0937979b237c4f7918c6c24f';

final class ReverseGeocodeLocationFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<String?>,
            ({
              double latitude,
              double longitude,
            })> {
  ReverseGeocodeLocationFamily._()
      : super(
          retry: null,
          name: r'reverseGeocodeLocationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReverseGeocodeLocationProvider call({
    required double latitude,
    required double longitude,
  }) =>
      ReverseGeocodeLocationProvider._(argument: (
        latitude: latitude,
        longitude: longitude,
      ), from: this);

  @override
  String toString() => r'reverseGeocodeLocationProvider';
}
