// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_total_favorites_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTotalFavoritesCount)
final getTotalFavoritesCountProvider = GetTotalFavoritesCountProvider._();

final class GetTotalFavoritesCountProvider
    extends $FunctionalProvider<AsyncValue<int?>, int?, FutureOr<int?>>
    with $FutureModifier<int?>, $FutureProvider<int?> {
  GetTotalFavoritesCountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTotalFavoritesCountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTotalFavoritesCountHash();

  @$internal
  @override
  $FutureProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int?> create(Ref ref) {
    return getTotalFavoritesCount(ref);
  }
}

String _$getTotalFavoritesCountHash() =>
    r'a218991ccbe4447bbcc1786138397c5a2e9e714f';
