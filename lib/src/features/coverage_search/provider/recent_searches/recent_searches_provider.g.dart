// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_searches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ricerche recenti, riproposte quando la barra è vuota (FR-010).

@ProviderFor(recentSearches)
final recentSearchesProvider = RecentSearchesProvider._();

/// Ricerche recenti, riproposte quando la barra è vuota (FR-010).

final class RecentSearchesProvider extends $FunctionalProvider<
        AsyncValue<List<RecentSearch>>,
        List<RecentSearch>,
        FutureOr<List<RecentSearch>>>
    with
        $FutureModifier<List<RecentSearch>>,
        $FutureProvider<List<RecentSearch>> {
  /// Ricerche recenti, riproposte quando la barra è vuota (FR-010).
  RecentSearchesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentSearchesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentSearchesHash();

  @$internal
  @override
  $FutureProviderElement<List<RecentSearch>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecentSearch>> create(Ref ref) {
    return recentSearches(ref);
  }
}

String _$recentSearchesHash() => r'3722c20aadf9e932d231330e4fad0012dc147673';
