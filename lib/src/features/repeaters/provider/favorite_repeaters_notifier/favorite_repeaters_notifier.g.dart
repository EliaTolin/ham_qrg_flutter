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
    r'db78f86df904285571e4b98b4149f635b0368eaa';

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
