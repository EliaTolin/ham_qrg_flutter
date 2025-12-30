// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_repeaters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFavoriteRepeaters)
final getFavoriteRepeatersProvider = GetFavoriteRepeatersProvider._();

final class GetFavoriteRepeatersProvider extends $FunctionalProvider<
        AsyncValue<List<Repeater>>, List<Repeater>, FutureOr<List<Repeater>>>
    with $FutureModifier<List<Repeater>>, $FutureProvider<List<Repeater>> {
  GetFavoriteRepeatersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getFavoriteRepeatersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getFavoriteRepeatersHash();

  @$internal
  @override
  $FutureProviderElement<List<Repeater>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Repeater>> create(Ref ref) {
    return getFavoriteRepeaters(ref);
  }
}

String _$getFavoriteRepeatersHash() =>
    r'2326d0baec2b0178ef9f435dfe9fb31a6391a77c';
