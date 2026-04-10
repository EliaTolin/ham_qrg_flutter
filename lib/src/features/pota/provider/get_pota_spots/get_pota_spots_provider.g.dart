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
          isAutoDispose: true,
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

String _$getPotaSpotsHash() => r'a4269f3eb69c91801d0efd4ed18a5b47810f084e';
