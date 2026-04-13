// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SpotListController)
final spotListControllerProvider = SpotListControllerProvider._();

final class SpotListControllerProvider
    extends $AsyncNotifierProvider<SpotListController, List<RepeaterSpot>> {
  SpotListControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'spotListControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$spotListControllerHash();

  @$internal
  @override
  SpotListController create() => SpotListController();
}

String _$spotListControllerHash() =>
    r'bbf977fa0cd5f9029261affba8aaef17008381eb';

abstract class _$SpotListController extends $AsyncNotifier<List<RepeaterSpot>> {
  FutureOr<List<RepeaterSpot>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>,
        AsyncValue<List<RepeaterSpot>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
