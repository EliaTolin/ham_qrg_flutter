// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pota_spots_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPotaSpots)
final getPotaSpotsProvider = GetPotaSpotsProvider._();

final class GetPotaSpotsProvider extends $FunctionalProvider<
        AsyncValue<List<PotaSpot>>, List<PotaSpot>, FutureOr<List<PotaSpot>>>
    with $FutureModifier<List<PotaSpot>>, $FutureProvider<List<PotaSpot>> {
  GetPotaSpotsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPotaSpotsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPotaSpotsHash();

  @$internal
  @override
  $FutureProviderElement<List<PotaSpot>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<PotaSpot>> create(Ref ref) {
    return getPotaSpots(ref);
  }
}

String _$getPotaSpotsHash() => r'd4041c112c297e4319f3acd4a3965691c36adb9d';
