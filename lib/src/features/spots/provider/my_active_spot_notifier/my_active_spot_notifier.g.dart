// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_active_spot_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyActiveSpotNotifier)
final myActiveSpotProvider = MyActiveSpotNotifierProvider._();

final class MyActiveSpotNotifierProvider
    extends $AsyncNotifierProvider<MyActiveSpotNotifier, RepeaterSpot?> {
  MyActiveSpotNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'myActiveSpotProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$myActiveSpotNotifierHash();

  @$internal
  @override
  MyActiveSpotNotifier create() => MyActiveSpotNotifier();
}

String _$myActiveSpotNotifierHash() =>
    r'e8a6b1663f6c9ac21ee521786e8bcf43b441e617';

abstract class _$MyActiveSpotNotifier extends $AsyncNotifier<RepeaterSpot?> {
  FutureOr<RepeaterSpot?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RepeaterSpot?>, RepeaterSpot?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeaterSpot?>, RepeaterSpot?>,
        AsyncValue<RepeaterSpot?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
