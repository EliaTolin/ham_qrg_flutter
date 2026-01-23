// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SplashController)
final splashControllerProvider = SplashControllerProvider._();

final class SplashControllerProvider
    extends $AsyncNotifierProvider<SplashController, SplashAction?> {
  SplashControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  SplashController create() => SplashController();
}

String _$splashControllerHash() => r'9847b5b314832965ca1690ffdbeec5a102fa9d99';

abstract class _$SplashController extends $AsyncNotifier<SplashAction?> {
  FutureOr<SplashAction?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SplashAction?>, SplashAction?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SplashAction?>, SplashAction?>,
        AsyncValue<SplashAction?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
