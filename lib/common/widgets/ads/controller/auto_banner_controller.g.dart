// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_banner_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AutoBannerController)
const autoBannerControllerProvider = AutoBannerControllerFamily._();

final class AutoBannerControllerProvider
    extends $AsyncNotifierProvider<AutoBannerController, BannerAd?> {
  const AutoBannerControllerProvider._(
      {required AutoBannerControllerFamily super.from,
      required (
        AdSize,
        Key,
      )
          super.argument})
      : super(
          retry: null,
          name: r'autoBannerControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$autoBannerControllerHash();

  @override
  String toString() {
    return r'autoBannerControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AutoBannerController create() => AutoBannerController();

  @override
  bool operator ==(Object other) {
    return other is AutoBannerControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$autoBannerControllerHash() =>
    r'734924b14e3a015056ed4e6e01f01669d1ff4595';

final class AutoBannerControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            AutoBannerController,
            AsyncValue<BannerAd?>,
            BannerAd?,
            FutureOr<BannerAd?>,
            (
              AdSize,
              Key,
            )> {
  const AutoBannerControllerFamily._()
      : super(
          retry: null,
          name: r'autoBannerControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AutoBannerControllerProvider call(
    AdSize adSize,
    Key keyUnique,
  ) =>
      AutoBannerControllerProvider._(argument: (
        adSize,
        keyUnique,
      ), from: this);

  @override
  String toString() => r'autoBannerControllerProvider';
}

abstract class _$AutoBannerController extends $AsyncNotifier<BannerAd?> {
  late final _$args = ref.$arg as (
    AdSize,
    Key,
  );
  AdSize get adSize => _$args.$1;
  Key get keyUnique => _$args.$2;

  FutureOr<BannerAd?> build(
    AdSize adSize,
    Key keyUnique,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args.$1,
      _$args.$2,
    );
    final ref = this.ref as $Ref<AsyncValue<BannerAd?>, BannerAd?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<BannerAd?>, BannerAd?>,
        AsyncValue<BannerAd?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
