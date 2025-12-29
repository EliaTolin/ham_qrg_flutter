// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeatersListController)
final repeatersListControllerProvider = RepeatersListControllerProvider._();

final class RepeatersListControllerProvider extends $AsyncNotifierProvider<
    RepeatersListController, RepeatersListState> {
  RepeatersListControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersListControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersListControllerHash();

  @$internal
  @override
  RepeatersListController create() => RepeatersListController();
}

String _$repeatersListControllerHash() =>
    r'0903a40ba1eacc0d385d1387887236b6feda75f9';

abstract class _$RepeatersListController
    extends $AsyncNotifier<RepeatersListState> {
  FutureOr<RepeatersListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RepeatersListState>, RepeatersListState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeatersListState>, RepeatersListState>,
        AsyncValue<RepeatersListState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
