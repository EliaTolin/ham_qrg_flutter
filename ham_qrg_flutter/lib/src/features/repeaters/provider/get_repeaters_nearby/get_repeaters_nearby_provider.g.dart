// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeaters_nearby_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeatersNearby)
final getRepeatersNearbyProvider = GetRepeatersNearbyFamily._();

final class GetRepeatersNearbyProvider extends $FunctionalProvider<
        AsyncValue<List<Repeater>>, List<Repeater>, FutureOr<List<Repeater>>>
    with $FutureModifier<List<Repeater>>, $FutureProvider<List<Repeater>> {
  GetRepeatersNearbyProvider._(
      {required GetRepeatersNearbyFamily super.from,
      required ({
        double latitude,
        double longitude,
        double radiusKm,
        List<AccessMode>? accessModes,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getRepeatersNearbyProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeatersNearbyHash();

  @override
  String toString() {
    return r'getRepeatersNearbyProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Repeater>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Repeater>> create(Ref ref) {
    final argument = this.argument as ({
      double latitude,
      double longitude,
      double radiusKm,
      List<AccessMode>? accessModes,
    });
    return getRepeatersNearby(
      ref,
      latitude: argument.latitude,
      longitude: argument.longitude,
      radiusKm: argument.radiusKm,
      accessModes: argument.accessModes,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeatersNearbyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeatersNearbyHash() =>
    r'443baa5e062e522773ed5a4b177e0e2b964d4b63';

final class GetRepeatersNearbyFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Repeater>>,
            ({
              double latitude,
              double longitude,
              double radiusKm,
              List<AccessMode>? accessModes,
            })> {
  GetRepeatersNearbyFamily._()
      : super(
          retry: null,
          name: r'getRepeatersNearbyProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeatersNearbyProvider call({
    required double latitude,
    required double longitude,
    double radiusKm = 50.0,
    List<AccessMode>? accessModes,
  }) =>
      GetRepeatersNearbyProvider._(argument: (
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
        accessModes: accessModes,
      ), from: this);

  @override
  String toString() => r'getRepeatersNearbyProvider';
}
