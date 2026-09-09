import 'dart:ui' show Locale;

import 'package:intl/intl.dart';

/// Scrive i conteggi in evidenza con il separatore delle migliaia della
/// lingua attiva: `24992` diventa `24.992` in italiano e `24,992` in inglese.
///
/// Non è una quantità fisica e non passa quindi da `UnitFormat`: un numero di
/// stazioni non ha unità da convertire, solo una punteggiatura da rispettare.
abstract final class CountFormat {
  /// Il conteggio come lo legge chi usa `locale`.
  static String integer(Locale locale, int value) =>
      _cached(locale).format(value);

  /// `NumberFormat` non è gratuito da costruire: uno per `build` sarebbe
  /// spreco invisibile in sviluppo.
  static final Map<String, NumberFormat> _cache = {};

  static NumberFormat _cached(Locale locale) {
    final name = locale.toString();
    return _cache.putIfAbsent(name, () => NumberFormat('#,##0', name));
  }
}
