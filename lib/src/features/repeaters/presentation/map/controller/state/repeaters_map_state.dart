import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point_error.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';

part 'repeaters_map_state.freezed.dart';

@freezed
abstract class RepeatersMapState with _$RepeatersMapState {
  const factory RepeatersMapState({
    @Default(<Repeater>[]) List<Repeater> repeaters,
    double? latitude,
    double? longitude,
    LocationErrorType? locationError,
    @Default(false) bool hasLoadError,
    @Default(<AccessMode>{}) Set<AccessMode> selectedModes,
    Repeater? selectedRepeater,
    @Default(<PotaSpot>[]) List<PotaSpot> potaSpots,
    @Default(<String, PotaPark>{}) Map<String, PotaPark> potaParkCache,

    /// Punto arbitrario attualmente selezionato: al massimo uno per volta
    /// (FR-007). `null` significa nessun pin sulla mappa.
    SearchPoint? searchPoint,

    /// Ampiezza di ricerca scelta per la valutazione (FR-024).
    @Default(SearchBreadth.quick) SearchBreadth searchBreadth,

    /// Errore dell'ultima selezione, mostrato come banner senza far collassare
    /// la mappa. Si azzera alla selezione successiva riuscita.
    SearchPointError? pointError,
  }) = _RepeatersMapState;
}
