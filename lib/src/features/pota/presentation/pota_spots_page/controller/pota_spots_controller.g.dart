// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_spots_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PotaSpotsController)
final potaSpotsControllerProvider = PotaSpotsControllerProvider._();

final class PotaSpotsControllerProvider
    extends $AsyncNotifierProvider<PotaSpotsController, PotaSpotsState> {
  PotaSpotsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'potaSpotsControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$potaSpotsControllerHash();

  @$internal
  @override
  PotaSpotsController create() => PotaSpotsController();
}

String _$potaSpotsControllerHash() =>
    r'679b69917ea5c765314713c73cdedcf077dab960';

abstract class _$PotaSpotsController extends $AsyncNotifier<PotaSpotsState> {
  FutureOr<PotaSpotsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PotaSpotsState>, PotaSpotsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<PotaSpotsState>, PotaSpotsState>,
        AsyncValue<PotaSpotsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
