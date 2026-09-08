/// Sistema di misura con cui l'app scrive distanze e quote.
///
/// È una preferenza di **presentazione**: nulla di ciò che l'app calcola,
/// salva, ordina o confronta cambia al variare di questo valore (FR-008).
enum UnitSystem {
  /// Deriva dalla regione del dispositivo. Stato iniziale.
  ///
  /// Non viene mai passato a un formattatore: la risoluzione avviene una
  /// volta sola, nello scope che distribuisce la preferenza all'albero.
  auto,

  /// Chilometri e metri, sempre.
  metric,

  /// Miglia e piedi, sempre.
  imperial;

  /// Ricostruisce il valore dalla stringa persistita.
  ///
  /// Una chiave assente o un valore sconosciuto — downgrade dell'app, dato
  /// corrotto — tornano ad [auto] senza sollevare eccezioni.
  static UnitSystem fromName(String? name) {
    for (final value in UnitSystem.values) {
      if (value.name == name) return value;
    }
    return UnitSystem.auto;
  }
}

/// Natura della grandezza da scrivere.
///
/// Distingue le due sole regole che servono: la distanza passa all'unità
/// lunga oltre una soglia, la quota non lo fa mai — nessuno scrive
/// l'altitudine di una cima in chilometri, e nemmeno in miglia.
enum MeasuredQuantity { distance, elevation }
