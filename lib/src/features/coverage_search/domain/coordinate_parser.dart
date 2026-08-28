import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

/// Esito del riconoscimento di una coppia di coordinate digitata nella barra.
///
/// I tre casi sono distinti perché la UI deve reagire in modo diverso: se la
/// stringa non sono coordinate si interroga la ricerca per nome, se sono
/// coordinate fuori intervallo si mostra un errore **senza muovere la mappa**
/// (FR-009), e non si spreca una chiamata di geocodifica per una stringa che
/// l'utente intendeva chiaramente come coordinate.
sealed class CoordinateParseResult {
  const CoordinateParseResult();
}

/// La stringa non ha la forma di una coppia di coordinate: va trattata come
/// nome di località.
class NotCoordinates extends CoordinateParseResult {
  const NotCoordinates();
}

/// La stringa è una coppia di coordinate, ma fuori dall'intervallo valido.
class CoordinatesOutOfRange extends CoordinateParseResult {
  const CoordinatesOutOfRange(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}

/// Coordinate valide, pronte a diventare un punto di ricerca.
class ParsedCoordinates extends CoordinateParseResult {
  const ParsedCoordinates(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  SearchPoint toSearchPoint() => SearchPoint(
        latitude: latitude,
        longitude: longitude,
        label: formatCoordinates(latitude, longitude),
        origin: SearchPointOrigin.coordinates,
      );
}

/// Etichetta leggibile per un punto privo di nome di località.
String formatCoordinates(double latitude, double longitude) =>
    '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';

/// Riconosce una coppia di coordinate decimali digitata dall'utente (FR-004).
///
/// Accetta le forme che una persona scrive davvero, incluse quelle italiane
/// con la virgola come separatore decimale:
///
/// ```
/// 46.4879, 11.8123      46,4879, 11,8123
/// 46.4879 11.8123       46,4879 11,8123
/// -33.8688,151.2093     46.4879;11.8123
/// ```
///
/// Non fa alcuna chiamata di rete: è pura, istantanea e senza costo.
CoordinateParseResult parseCoordinates(String raw) {
  final input = raw.trim();
  if (input.isEmpty) return const NotCoordinates();

  final pair = _splitIntoPair(input);
  if (pair == null) return const NotCoordinates();

  final latitude = _parseNumber(pair.$1);
  final longitude = _parseNumber(pair.$2);
  if (latitude == null || longitude == null) return const NotCoordinates();

  if (latitude < -90 || latitude > 90 || longitude < -180 || longitude > 180) {
    return CoordinatesOutOfRange(latitude, longitude);
  }
  return ParsedCoordinates(latitude, longitude);
}

/// Separa i due valori provando, in ordine, i separatori che non creano
/// ambiguità con la virgola decimale.
(String, String)? _splitIntoPair(String input) {
  // 1. Punto e virgola: separatore non ambiguo, la virgola resta decimale.
  final bySemicolon = input.split(';');
  if (bySemicolon.length == 2) return (bySemicolon[0], bySemicolon[1]);

  // 2. Virgola seguita da spazio: distingue "46,4879, 11,8123" dal decimale.
  final byCommaSpace = input.split(RegExp(r',\s+'));
  if (byCommaSpace.length == 2) return (byCommaSpace[0], byCommaSpace[1]);

  // 3. Solo spazi: la virgola dentro ciascun valore è decimale.
  final bySpace = input.split(RegExp(r'\s+'));
  if (bySpace.length == 2) return (bySpace[0], bySpace[1]);

  // 4. Virgola secca senza spazio: valida solo se i decimali usano il punto,
  //    altrimenti "46,4879,11,8123" sarebbe indecidibile.
  final byComma = input.split(',');
  if (byComma.length == 2) return (byComma[0], byComma[1]);

  return null;
}

/// Converte un singolo valore, accettando la virgola come separatore decimale.
/// Rifiuta tutto ciò che non è un numero puro, così una via civico "Roma, 12"
/// non venga scambiata per coordinate.
double? _parseNumber(String raw) {
  final value = raw.trim().replaceAll(',', '.');
  if (value.isEmpty) return null;
  if (!RegExp(r'^[+-]?\d+(\.\d+)?$').hasMatch(value)) return null;
  return double.tryParse(value);
}
