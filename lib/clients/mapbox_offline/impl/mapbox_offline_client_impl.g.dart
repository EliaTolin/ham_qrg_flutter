// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapbox_offline_client_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapboxOfflineClient)
final mapboxOfflineClientProvider = MapboxOfflineClientProvider._();

final class MapboxOfflineClientProvider extends $FunctionalProvider<
    MapboxOfflineClient,
    MapboxOfflineClient,
    MapboxOfflineClient> with $Provider<MapboxOfflineClient> {
  MapboxOfflineClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'mapboxOfflineClientProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mapboxOfflineClientHash();

  @$internal
  @override
  $ProviderElement<MapboxOfflineClient> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapboxOfflineClient create(Ref ref) {
    return mapboxOfflineClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapboxOfflineClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapboxOfflineClient>(value),
    );
  }
}

String _$mapboxOfflineClientHash() =>
    r'31729416432cd347dd6031ae7ec04418cb922b7d';
