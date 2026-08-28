/// Errori della ricerca di località, distinti perché la UI reagisce in modo
/// diverso: l'assenza di rete propone le postazioni salvate, un errore di
/// servizio propone di riprovare.
sealed class CoverageSearchException implements Exception {
  const CoverageSearchException();
}

/// Il dispositivo non ha connessione, o la richiesta è andata in timeout.
class GeocodingUnavailableException extends CoverageSearchException {
  const GeocodingUnavailableException();
}

/// Il servizio di geocodifica ha risposto con un errore.
class GeocodingFailedException extends CoverageSearchException {
  const GeocodingFailedException(this.statusCode);

  final int? statusCode;
}

/// La valutazione è stata richiesta senza l'abbonamento Pro.
///
/// Non è un errore da mostrare come guasto: è il gate che porta al teaser.
/// Esiste come eccezione, e non come semplice controllo nella UI, perché
/// FR-014 vieta di inviare la richiesta al servizio di copertura — e una
/// garanzia affidata alla disciplina di chi scrive la UI non è una garanzia.
class ProRequiredException extends CoverageSearchException {
  const ProRequiredException();
}

/// Il salvataggio non è riuscito: spazio esaurito o scrittura rifiutata.
///
/// Non si tenta **mai** di liberare spazio rimuovendo postazioni esistenti
/// (FR-051): meglio un salvataggio fallito e dichiarato che una postazione
/// sparita di nascosto.
class StationSaveFailedException extends CoverageSearchException {
  const StationSaveFailedException();
}
