// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_repeaters_ids_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFavoriteRepeatersIds)
final getFavoriteRepeatersIdsProvider = GetFavoriteRepeatersIdsProvider._();

final class GetFavoriteRepeatersIdsProvider extends $FunctionalProvider<
        AsyncValue<List<String>>, List<String>, FutureOr<List<String>>>
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  GetFavoriteRepeatersIdsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getFavoriteRepeatersIdsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getFavoriteRepeatersIdsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return getFavoriteRepeatersIds(ref);
  }
}

String _$getFavoriteRepeatersIdsHash() =>
    r'b5a11c9f28a0e2e540500b73899eb574d967b771';
