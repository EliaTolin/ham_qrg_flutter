import 'dart:ui' show Locale;

import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:intl/intl.dart';

/// Scrive distanze e quote nel sistema di misura scelto dall'utente.
///
/// È l'**unico** posto dell'app in cui un simbolo di unità di lunghezza
/// compare in una stringa. Tutto il resto ci passa attraverso, tramite
/// `context.units`.
///
/// La classe è pura di proposito: nessun `BuildContext`, nessun Riverpod.
/// Così la tabella di casi del contratto è un test unitario da millisecondi
/// (SC-006) e un formattatore che non sa nulla di ordinamenti non può
/// influenzarli (FR-008).
abstract final class UnitFormat {
  /// Fattori esatti, non approssimati.
  static const double _metresPerMile = 1609.344;
  static const double _metresPerFoot = 0.3048;
  static const int _feetPerMile = 5280;
  static const int _metresPerKilometre = 1000;

  /// Simbolo dell'unità lunga, per le superfici che mostrano un segnaposto
  /// al posto del valore (il mock sfocato del teaser Pro).
  static String longSymbol(UnitSystem system) =>
      _imperial(system) ? 'mi' : 'km';

  /// Distanza a partire dai metri canonici.
  ///
  /// Sotto l'unità lunga si usa l'unità corta a numero intero, da 1 unità
  /// lunga in su una sola cifra decimale (FR-007). Il confronto di soglia
  /// avviene sul valore **già arrotondato**: senza questa accortezza
  /// comparirebbero `1.000 m` (che è un chilometro) e `5,280 ft` (che è
  /// esattamente un miglio), cioè il valore scritto nell'unità sbagliata.
  static String distance(double meters, UnitSystem system, Locale locale) {
    _assertResolved(system);
    if (_imperial(system)) {
      final feet = (meters / _metresPerFoot).round();
      if (feet.abs() < _feetPerMile) {
        return '${_integer(locale).format(feet)} ft';
      }
      return '${_oneDecimal(locale).format(meters / _metresPerMile)} mi';
    }
    final rounded = meters.round();
    if (rounded.abs() < _metresPerKilometre) {
      return '${_integer(locale).format(rounded)} m';
    }
    return '${_oneDecimal(locale).format(meters / _metresPerKilometre)} km';
  }

  /// Quota a partire dai metri canonici.
  ///
  /// La quota non ha unità lunga: resta in metri o in piedi, sempre intera.
  static String elevation(double meters, UnitSystem system, Locale locale) {
    _assertResolved(system);
    if (_imperial(system)) {
      final feet = (meters / _metresPerFoot).round();
      return '${_integer(locale).format(feet)} ft';
    }
    return '${_integer(locale).format(meters.round())} m';
  }

  /// Soglia da citare in un testo, arrotondata **per difetto** (FR-016).
  ///
  /// La soglia scritta è sempre più stretta di quella verificata, così chi
  /// rispetta il testo supera sempre il controllo. Il caso opposto — leggere
  /// una cifra ed essere bloccati lo stesso — non può presentarsi.
  ///
  /// I piedi si troncano alla decina inferiore: `656 ft` prometterebbe una
  /// precisione che una soglia non ha.
  static String threshold(
    double meters,
    UnitSystem system,
    Locale locale, {
    MeasuredQuantity quantity = MeasuredQuantity.distance,
  }) {
    _assertResolved(system);
    if (_imperial(system)) {
      final feet = meters / _metresPerFoot;
      if (quantity == MeasuredQuantity.elevation || feet < _feetPerMile) {
        final tens = (feet / 10).floor() * 10;
        return '${_integer(locale).format(tens)} ft';
      }
      final miles = (meters / _metresPerMile).floor();
      return '${_integer(locale).format(miles)} mi';
    }
    if (quantity == MeasuredQuantity.elevation ||
        meters < _metresPerKilometre) {
      return '${_integer(locale).format(meters.floor())} m';
    }
    final kilometres = (meters / _metresPerKilometre).floor();
    return '${_integer(locale).format(kilometres)} km';
  }

  /// Raggio di un preset, arrotondato al più **vicino** e senza decimali.
  ///
  /// Un preset non è una soglia promessa all'utente ma la descrizione di
  /// un'opzione, e la sua identità resta metrica: `SearchBreadth.quick` è e
  /// rimane 80 km anche quando a schermo si legge `50 mi` (FR-009).
  static String presetRadius(
    double kilometres,
    UnitSystem system,
    Locale locale,
  ) {
    _assertResolved(system);
    if (_imperial(system)) {
      final miles = (kilometres * _metresPerKilometre / _metresPerMile).round();
      return '${_integer(locale).format(miles)} mi';
    }
    return '${_integer(locale).format(kilometres.round())} km';
  }

  /// Quota già nota in piedi, dal dato ufficiale della sorgente.
  ///
  /// Le quote SOTA arrivano con entrambe le unità: riconvertire i metri
  /// sfaserebbe di un piede il numero che l'attivatore conosce a memoria
  /// (FR-011).
  static String nativeFeet(int feet, Locale locale) =>
      '${_integer(locale).format(feet)} ft';

  /// Quota già nota in metri interi, contraltare di [nativeFeet].
  static String nativeMetres(int metres, Locale locale) =>
      '${_integer(locale).format(metres)} m';

  /// Quota della cima separata in numero e simbolo.
  ///
  /// Serve alle due superfici SOTA che danno al numero e all'unità pesi
  /// tipografici diversi: senza questo dovrebbero spezzare la stringa a
  /// mano, e basterebbe una lingua con un separatore insolito per rompere
  /// lo spezzettamento.
  static ({String value, String symbol}) summitAltitudeParts({
    required int metres,
    required int feet,
    required UnitSystem system,
    required Locale locale,
  }) {
    _assertResolved(system);
    return _imperial(system)
        ? (value: _integer(locale).format(feet), symbol: 'ft')
        : (value: _integer(locale).format(metres), symbol: 'm');
  }

  /// Simbolo dell'unità di quota, per le etichette d'asse che nominano
  /// l'unità senza mostrare un valore.
  static String elevationSymbol(UnitSystem system) =>
      _imperial(system) ? 'ft' : 'm';

  static bool _imperial(UnitSystem system) => system == UnitSystem.imperial;

  /// `auto` non arriva mai fin qui: la risoluzione avviene una volta sola,
  /// nello scope. Riceverlo è un errore di programmazione e deve fallire in
  /// modo rumoroso, non ricadere in silenzio sul metrico.
  static void _assertResolved(UnitSystem system) {
    assert(
      system != UnitSystem.auto,
      'UnitFormat richiede un sistema già risolto: UnitSystem.auto va '
      'risolto in UnitSystemScope, non qui.',
    );
  }

  /// `NumberFormat` non è gratuito da costruire e questi formattatori girano
  /// dentro `ListView.builder`: uno per cella è lo spreco che non si vede in
  /// sviluppo e si sente in campo.
  static final Map<String, NumberFormat> _cache = {};

  static NumberFormat _integer(Locale locale) => _cached('i', locale, '#,##0');

  static NumberFormat _oneDecimal(Locale locale) =>
      _cached('d', locale, '#,##0.0');

  static NumberFormat _cached(String kind, Locale locale, String pattern) {
    final name = locale.toString();
    return _cache.putIfAbsent(
      '$kind|$name',
      () => NumberFormat(pattern, name),
    );
  }
}
