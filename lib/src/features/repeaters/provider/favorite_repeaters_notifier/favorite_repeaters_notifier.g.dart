// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_repeaters_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteRepeatersNotifier)
final favoriteRepeatersProvider = FavoriteRepeatersNotifierProvider._();

final class FavoriteRepeatersNotifierProvider extends $AsyncNotifierProvider<
    FavoriteRepeatersNotifier, FavoriteRepeatersState> {
  FavoriteRepeatersNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'favoriteRepeatersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$favoriteRepeatersNotifierHash();

  @$internal
  @override
  FavoriteRepeatersNotifier create() => FavoriteRepeatersNotifier();
}

String _$favoriteRepeatersNotifierHash() =>
    r'12010cb8c24df53867d776941b1e0ae5f578b017';

abstract class _$FavoriteRepeatersNotifier
    extends $AsyncNotifier<FavoriteRepeatersState> {
  FutureOr<FavoriteRepeatersState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<FavoriteRepeatersState>, FavoriteRepeatersState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<FavoriteRepeatersState>, FavoriteRepeatersState>,
        AsyncValue<FavoriteRepeatersState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
