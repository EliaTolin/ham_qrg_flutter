import 'package:hamqrg/src/features/coverage_search/data/datasource/geocoding_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/mapbox_geocoding_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/mappers/place_suggestion_mapper.dart';
import 'package:hamqrg/src/features/coverage_search/domain/place_suggestion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coverage_search_repository.g.dart';

/// Lunghezza minima della query prima di interrogare la geocodifica (FR-002).
/// Sotto i 3 caratteri i risultati sono inutilizzabili e ogni battuta sarebbe
/// una richiesta pagata.
const int kMinQueryLength = 3;

class CoverageSearchRepository {
  CoverageSearchRepository(this._geocoding);

  final GeocodingDatasource _geocoding;
  final _mapper = PlaceSuggestionMapper();

  /// Luoghi corrispondenti a [query]. Restituisce una lista vuota, senza
  /// alcuna chiamata di rete, se la query è troppo corta.
  Future<List<PlaceSuggestion>> searchPlaces(
    String query, {
    required String language,
  }) async {
    final trimmed = query.trim();
    if (trimmed.length < kMinQueryLength) return const [];

    final models = await _geocoding.forward(trimmed, language: language);
    return _mapper.fromModels(models);
  }
}

@riverpod
CoverageSearchRepository coverageSearchRepository(Ref ref) {
  return CoverageSearchRepository(ref.read(geocodingDatasourceProvider));
}
