// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

final class FavoritesControllerProvider
    extends $AsyncNotifierProvider<FavoritesController, FavoritesState> {
  FavoritesControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'favoritesControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();
}

String _$favoritesControllerHash() =>
    r'0fa2ea4e0e99579aed4b92f4a326f8b35120f964';

abstract class _$FavoritesController extends $AsyncNotifier<FavoritesState> {
  FutureOr<FavoritesState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FavoritesState>, FavoritesState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<FavoritesState>, FavoritesState>,
        AsyncValue<FavoritesState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
