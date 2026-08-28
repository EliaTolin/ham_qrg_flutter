import 'package:hamqrg/src/features/coverage_search/data/repository/coverage_search_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/place_suggestion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_places_provider.g.dart';

/// Suggerimenti di località per [query].
///
/// Il debounce vive nel controller della barra, non qui: questo provider è la
/// singola richiesta, e va invocato quando la digitazione si è già fermata.
@riverpod
Future<List<PlaceSuggestion>> searchPlaces(
  Ref ref, {
  required String query,
  required String language,
}) async {
  final repository = ref.read(coverageSearchRepositoryProvider);
  return repository.searchPlaces(query, language: language);
}
