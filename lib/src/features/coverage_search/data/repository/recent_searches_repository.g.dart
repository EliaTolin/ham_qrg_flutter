// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_searches_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentSearchesRepository)
final recentSearchesRepositoryProvider = RecentSearchesRepositoryProvider._();

final class RecentSearchesRepositoryProvider extends $FunctionalProvider<
        AsyncValue<RecentSearchesRepository>,
        RecentSearchesRepository,
        FutureOr<RecentSearchesRepository>>
    with
        $FutureModifier<RecentSearchesRepository>,
        $FutureProvider<RecentSearchesRepository> {
  RecentSearchesRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentSearchesRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentSearchesRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<RecentSearchesRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RecentSearchesRepository> create(Ref ref) {
    return recentSearchesRepository(ref);
  }
}

String _$recentSearchesRepositoryHash() =>
    r'ca742fbf471f9e107943861d119457a63528f801';
