// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_places_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Suggerimenti di località per [query].
///
/// Il debounce vive nel controller della barra, non qui: questo provider è la
/// singola richiesta, e va invocato quando la digitazione si è già fermata.

@ProviderFor(searchPlaces)
final searchPlacesProvider = SearchPlacesFamily._();

/// Suggerimenti di località per [query].
///
/// Il debounce vive nel controller della barra, non qui: questo provider è la
/// singola richiesta, e va invocato quando la digitazione si è già fermata.

final class SearchPlacesProvider extends $FunctionalProvider<
        AsyncValue<List<PlaceSuggestion>>,
        List<PlaceSuggestion>,
        FutureOr<List<PlaceSuggestion>>>
    with
        $FutureModifier<List<PlaceSuggestion>>,
        $FutureProvider<List<PlaceSuggestion>> {
  /// Suggerimenti di località per [query].
  ///
  /// Il debounce vive nel controller della barra, non qui: questo provider è la
  /// singola richiesta, e va invocato quando la digitazione si è già fermata.
  SearchPlacesProvider._(
      {required SearchPlacesFamily super.from,
      required ({
        String query,
        String language,
      })
          super.argument})
      : super(
          retry: null,
          name: r'searchPlacesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchPlacesHash();

  @override
  String toString() {
    return r'searchPlacesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<PlaceSuggestion>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<PlaceSuggestion>> create(Ref ref) {
    final argument = this.argument as ({
      String query,
      String language,
    });
    return searchPlaces(
      ref,
      query: argument.query,
      language: argument.language,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchPlacesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchPlacesHash() => r'dafa1622a029159dc8b3e638389dc7c73a18edb3';

/// Suggerimenti di località per [query].
///
/// Il debounce vive nel controller della barra, non qui: questo provider è la
/// singola richiesta, e va invocato quando la digitazione si è già fermata.

final class SearchPlacesFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<PlaceSuggestion>>,
            ({
              String query,
              String language,
            })> {
  SearchPlacesFamily._()
      : super(
          retry: null,
          name: r'searchPlacesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Suggerimenti di località per [query].
  ///
  /// Il debounce vive nel controller della barra, non qui: questo provider è la
  /// singola richiesta, e va invocato quando la digitazione si è già fermata.

  SearchPlacesProvider call({
    required String query,
    required String language,
  }) =>
      SearchPlacesProvider._(argument: (
        query: query,
        language: language,
      ), from: this);

  @override
  String toString() => r'searchPlacesProvider';
}
