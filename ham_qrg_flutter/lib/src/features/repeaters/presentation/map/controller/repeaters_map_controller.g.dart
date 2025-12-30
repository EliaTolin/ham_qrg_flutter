// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeatersMapController)
final repeatersMapControllerProvider = RepeatersMapControllerProvider._();

final class RepeatersMapControllerProvider
    extends $AsyncNotifierProvider<RepeatersMapController, RepeatersMapState> {
  RepeatersMapControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersMapControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersMapControllerHash();

  @$internal
  @override
  RepeatersMapController create() => RepeatersMapController();
}

String _$repeatersMapControllerHash() =>
    r'475f17acff6bd9408e2fc5e6cc55f051cb42d6bb';

abstract class _$RepeatersMapController
    extends $AsyncNotifier<RepeatersMapState> {
  FutureOr<RepeatersMapState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RepeatersMapState>, RepeatersMapState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeatersMapState>, RepeatersMapState>,
        AsyncValue<RepeatersMapState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
