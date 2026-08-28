// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_breadth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchBreadthRepository)
final searchBreadthRepositoryProvider = SearchBreadthRepositoryProvider._();

final class SearchBreadthRepositoryProvider extends $FunctionalProvider<
        AsyncValue<SearchBreadthRepository>,
        SearchBreadthRepository,
        FutureOr<SearchBreadthRepository>>
    with
        $FutureModifier<SearchBreadthRepository>,
        $FutureProvider<SearchBreadthRepository> {
  SearchBreadthRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'searchBreadthRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchBreadthRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<SearchBreadthRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SearchBreadthRepository> create(Ref ref) {
    return searchBreadthRepository(ref);
  }
}

String _$searchBreadthRepositoryHash() =>
    r'2501eddcb36aa10564a687439f37e85dd582bdb8';
