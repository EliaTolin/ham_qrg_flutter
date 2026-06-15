// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_spots_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SotaSpotsController)
final sotaSpotsControllerProvider = SotaSpotsControllerProvider._();

final class SotaSpotsControllerProvider
    extends $AsyncNotifierProvider<SotaSpotsController, SotaSpotsState> {
  SotaSpotsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sotaSpotsControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sotaSpotsControllerHash();

  @$internal
  @override
  SotaSpotsController create() => SotaSpotsController();
}

String _$sotaSpotsControllerHash() =>
    r'7b0843e1315b3e5dd8a4c6f1b8a3a1ecd2d58dc9';

abstract class _$SotaSpotsController extends $AsyncNotifier<SotaSpotsState> {
  FutureOr<SotaSpotsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SotaSpotsState>, SotaSpotsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SotaSpotsState>, SotaSpotsState>,
        AsyncValue<SotaSpotsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
