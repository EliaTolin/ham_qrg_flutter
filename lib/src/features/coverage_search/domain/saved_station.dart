import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

part 'saved_station.freezed.dart';

/// Una valutazione conservata dall'utente, a **durata illimitata**.
///
/// Non viene rimossa da nulla: né da una scadenza, né dalla pressione di
/// spazio, né dalla decadenza dell'abbonamento (FR-051, FR-050). L'unica
/// rimozione ammessa è la cancellazione esplicita da parte dell'utente.
///
/// Conserva solo riferimenti ai ripetitori, non il loro payload: quello vive
/// una volta sola nella cache condivisa, così cinque postazioni della stessa
/// regione non ne tengono cinque copie.
@freezed
abstract class SavedStation with _$SavedStation {
  const factory SavedStation({
    required String id,
    required String name,
    required SearchPoint point,
    required SearchBreadth breadth,
    required DateTime computedAt,
    required DateTime lastRefreshedAt,
    @Default(<CoverageEntry>[]) List<CoverageEntry> entries,
  }) = _SavedStation;

  const SavedStation._();

  int get reachableCount => entries.where((e) => e.reachable).length;
}
