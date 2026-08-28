import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

part 'place_suggestion.freezed.dart';

/// Un risultato della ricerca per nome, pronto da mostrare nell'elenco dei
/// suggerimenti.
@freezed
abstract class PlaceSuggestion with _$PlaceSuggestion {
  const factory PlaceSuggestion({
    required String label,
    required double latitude,
    required double longitude,

    /// Contesto amministrativo che distingue gli omonimi (FR-003).
    String? context,
  }) = _PlaceSuggestion;

  const PlaceSuggestion._();

  /// Converte il suggerimento nel punto da valutare.
  SearchPoint toSearchPoint() => SearchPoint(
        latitude: latitude,
        longitude: longitude,
        label: label,
        origin: SearchPointOrigin.placeSearch,
        context: context,
      );
}
