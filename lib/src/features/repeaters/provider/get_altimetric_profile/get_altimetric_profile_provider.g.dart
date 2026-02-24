// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_altimetric_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAltimetricProfile)
final getAltimetricProfileProvider = GetAltimetricProfileFamily._();

final class GetAltimetricProfileProvider extends $FunctionalProvider<
        AsyncValue<AltimetricProfile>,
        AltimetricProfile,
        FutureOr<AltimetricProfile>>
    with
        $FutureModifier<AltimetricProfile>,
        $FutureProvider<AltimetricProfile> {
  GetAltimetricProfileProvider._(
      {required GetAltimetricProfileFamily super.from,
      required ({
        double repeaterLat,
        double repeaterLon,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getAltimetricProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getAltimetricProfileHash();

  @override
  String toString() {
    return r'getAltimetricProfileProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AltimetricProfile> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AltimetricProfile> create(Ref ref) {
    final argument = this.argument as ({
      double repeaterLat,
      double repeaterLon,
    });
    return getAltimetricProfile(
      ref,
      repeaterLat: argument.repeaterLat,
      repeaterLon: argument.repeaterLon,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetAltimetricProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getAltimetricProfileHash() =>
    r'c2196b9204ad9718d9c657e6756869638e4207be';

final class GetAltimetricProfileFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<AltimetricProfile>,
            ({
              double repeaterLat,
              double repeaterLon,
            })> {
  GetAltimetricProfileFamily._()
      : super(
          retry: null,
          name: r'getAltimetricProfileProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetAltimetricProfileProvider call({
    required double repeaterLat,
    required double repeaterLon,
  }) =>
      GetAltimetricProfileProvider._(argument: (
        repeaterLat: repeaterLat,
        repeaterLon: repeaterLon,
      ), from: this);

  @override
  String toString() => r'getAltimetricProfileProvider';
}
