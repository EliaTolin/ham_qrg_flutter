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
    r'bc02b035f18d5417c5f6cab25e2df899f473d0c0';

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
