// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationService)
final locationServiceProvider = LocationServiceProvider._();

final class LocationServiceProvider extends $FunctionalProvider<LocationService,
    LocationService, LocationService> with $Provider<LocationService> {
  LocationServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'locationServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$locationServiceHash();

  @$internal
  @override
  $ProviderElement<LocationService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationService create(Ref ref) {
    return locationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationService>(value),
    );
  }
}

String _$locationServiceHash() => r'5c196f0dc11a166a14bfa4e9d1af43d8a9341442';

/// Cached user position — fetched once and shared across providers/pages.

@ProviderFor(cachedUserPosition)
final cachedUserPositionProvider = CachedUserPositionProvider._();

/// Cached user position — fetched once and shared across providers/pages.

final class CachedUserPositionProvider extends $FunctionalProvider<
        AsyncValue<
            ({
              double latitude,
              double longitude,
            })>,
        ({
          double latitude,
          double longitude,
        }),
        FutureOr<
            ({
              double latitude,
              double longitude,
            })>>
    with
        $FutureModifier<
            ({
              double latitude,
              double longitude,
            })>,
        $FutureProvider<
            ({
              double latitude,
              double longitude,
            })> {
  /// Cached user position — fetched once and shared across providers/pages.
  CachedUserPositionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cachedUserPositionProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cachedUserPositionHash();

  @$internal
  @override
  $FutureProviderElement<
      ({
        double latitude,
        double longitude,
      })> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      ({
        double latitude,
        double longitude,
      })> create(Ref ref) {
    return cachedUserPosition(ref);
  }
}

String _$cachedUserPositionHash() =>
    r'24792aeb43b31d04671696864842915967b5dfd9';
