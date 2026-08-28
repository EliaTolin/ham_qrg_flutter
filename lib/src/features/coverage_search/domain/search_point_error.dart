/// Errori della selezione del punto, mostrati come banner non bloccante sulla
/// mappa senza mai far collassare la pagina (Principio III).
enum SearchPointError {
  /// Coordinate sintatticamente valide ma fuori intervallo: la mappa non si
  /// muove e l'utente riceve un messaggio esplicito (FR-009).
  coordinatesOutOfRange,

  /// La geocodifica non ha prodotto suggerimenti utilizzabili.
  noPlaceFound,

  /// Rete assente o richiesta scaduta: la ricerca richiede connessione, ma le
  /// postazioni già salvate restano consultabili.
  geocodingUnavailable,

  /// Il servizio di geocodifica ha risposto con un errore.
  geocodingFailed,
}
