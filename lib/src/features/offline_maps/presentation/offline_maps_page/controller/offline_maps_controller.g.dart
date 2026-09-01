// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_maps_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OfflineMapsController)
final offlineMapsControllerProvider = OfflineMapsControllerProvider._();

final class OfflineMapsControllerProvider
    extends $AsyncNotifierProvider<OfflineMapsController, OfflineMapsState> {
  OfflineMapsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'offlineMapsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$offlineMapsControllerHash();

  @$internal
  @override
  OfflineMapsController create() => OfflineMapsController();
}

String _$offlineMapsControllerHash() =>
    r'06ed6e386db53a6bffae1c238c75f0bd92bd2b8b';

abstract class _$OfflineMapsController
    extends $AsyncNotifier<OfflineMapsState> {
  FutureOr<OfflineMapsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<OfflineMapsState>, OfflineMapsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<OfflineMapsState>, OfflineMapsState>,
        AsyncValue<OfflineMapsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
