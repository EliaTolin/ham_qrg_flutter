import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

part 'recent_search.freezed.dart';

/// Numero massimo di ricerche recenti conservate (FR-010).
///
/// Dieci è quanto entra nel pannello senza scorrere: oltre, la cronologia
/// smetterebbe di essere una scorciatoia e diventerebbe una seconda lista da
/// leggere.
const int kMaxRecentSearches = 10;

/// Una ricerca già effettuata, riproposta quando la barra è vuota.
///
/// Vive solo sul dispositivo e non richiede account: è una comodità, non un
/// dato dell'utente da preservare.
@freezed
abstract class RecentSearch with _$RecentSearch {
  const factory RecentSearch({
    required String label,
    required double latitude,
    required double longitude,
    required DateTime usedAt,
    String? context,
  }) = _RecentSearch;

  const RecentSearch._();

  factory RecentSearch.fromPoint(
    SearchPoint point, {
    required DateTime usedAt,
  }) =>
      RecentSearch(
        label: point.label,
        latitude: point.latitude,
        longitude: point.longitude,
        usedAt: usedAt,
        context: point.context,
      );

  SearchPoint toSearchPoint() => SearchPoint(
        latitude: latitude,
        longitude: longitude,
        label: label,
        origin: SearchPointOrigin.placeSearch,
        context: context,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'latitude': latitude,
        'longitude': longitude,
        'usedAt': usedAt.toIso8601String(),
        if (context != null) 'context': context,
      };

  static RecentSearch? fromJson(Map<String, dynamic> json) {
    final label = json['label'];
    final latitude = (json['latitude'] as num?)?.toDouble();
    final longitude = (json['longitude'] as num?)?.toDouble();
    final usedAt = DateTime.tryParse(json['usedAt'] as String? ?? '');
    if (label is! String ||
        latitude == null ||
        longitude == null ||
        usedAt == null) {
      return null;
    }
    return RecentSearch(
      label: label,
      latitude: latitude,
      longitude: longitude,
      usedAt: usedAt,
      context: json['context'] as String?,
    );
  }
}
