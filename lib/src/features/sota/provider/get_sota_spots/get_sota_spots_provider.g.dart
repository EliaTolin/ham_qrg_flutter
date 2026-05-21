// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sota_spots_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getSotaSpots)
final getSotaSpotsProvider = GetSotaSpotsProvider._();

final class GetSotaSpotsProvider extends $FunctionalProvider<
        AsyncValue<List<SotaSpot>>, List<SotaSpot>, FutureOr<List<SotaSpot>>>
    with $FutureModifier<List<SotaSpot>>, $FutureProvider<List<SotaSpot>> {
  GetSotaSpotsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getSotaSpotsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getSotaSpotsHash();

  @$internal
  @override
  $FutureProviderElement<List<SotaSpot>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<SotaSpot>> create(Ref ref) {
    return getSotaSpots(ref);
  }
}

String _$getSotaSpotsHash() => r'd7589cb6b98eb0a2c8af6bc0604741e63c2cc64f';
