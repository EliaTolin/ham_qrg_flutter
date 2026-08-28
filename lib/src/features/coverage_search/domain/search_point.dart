import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_point.freezed.dart';

/// Come l'utente ha scelto il punto. Serve a due cose: decidere l'etichetta da
/// mostrare (un nome di località o le coordinate formattate) e alimentare il
/// funnel senza registrare nulla di sensibile.
enum SearchPointOrigin {
  /// Selezionato da un suggerimento della ricerca per nome.
  placeSearch,

  /// Coordinate decimali digitate direttamente nella barra.
  coordinates,

  /// Pressione prolungata sulla mappa.
  mapLongPress,
}

/// Soglia entro cui due punti sono considerati lo stesso posto ai fini del
/// duplicato (FR-048).
///
/// È volutamente stretta: in terreno accidentato 200 m possono spostare il
/// punto da dietro a davanti a un crinale e cambiare completamente il responso.
/// Per questo il sistema *propone* l'aggiornamento e non lo impone — la
/// decisione resta all'utente.
const double kSamePlaceThresholdMeters = 200;

/// Il punto scelto dall'utente sulla mappa: l'origine di una valutazione di
/// copertura.
@freezed
abstract class SearchPoint with _$SearchPoint {
  const factory SearchPoint({
    required double latitude,
    required double longitude,
    required String label,
    required SearchPointOrigin origin,

    /// Contesto amministrativo (comune, regione, nazione) che distingue gli
    /// omonimi. Assente per i punti scelti con pressione sulla mappa.
    String? context,
  }) = _SearchPoint;

  const SearchPoint._();

  /// Distanza in metri da [other], formula dell'emisenoverso.
  double distanceMetersTo(SearchPoint other) {
    const earthRadiusM = 6371000.0;
    final lat1 = _toRadians(latitude);
    final lat2 = _toRadians(other.latitude);
    final dLat = _toRadians(other.latitude - latitude);
    final dLon = _toRadians(other.longitude - longitude);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    return earthRadiusM * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }

  /// Se questo punto e [other] vanno trattati come lo stesso posto (FR-048).
  bool isSamePlace(SearchPoint other) =>
      distanceMetersTo(other) <= kSamePlaceThresholdMeters;
}

double _toRadians(double degrees) => degrees * math.pi / 180;
