import 'package:hamqrg/src/features/coverage_search/data/model/place_suggestion_model.dart';

/// Converte un testo digitato dall'utente in luoghi con coordinate.
///
/// È l'unica chiamata di rete che questa feature consente a un utente non Pro:
/// spostare la mappa su un posto è navigazione, non la capacità venduta.
abstract class GeocodingDatasource {
  /// Cerca fino a [limit] luoghi corrispondenti a [query].
  ///
  /// [language] è il codice della locale dell'app, così i toponimi tornano
  /// nella lingua che l'utente sta leggendo.
  ///
  /// Una richiesta già in volo per la stessa istanza viene annullata: mentre si
  /// digita conta solo l'ultima, e ogni richiesta superata è denaro speso per
  /// un risultato che nessuno vedrà.
  Future<List<PlaceSuggestionModel>> forward(
    String query, {
    required String language,
    int limit,
  });
}
