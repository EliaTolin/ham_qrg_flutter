/// Ampiezza della ricerca dei ripetitori candidati attorno al punto (FR-024).
///
/// È un enum chiuso e non un raggio libero in chilometri per una ragione
/// precisa: l'ampiezza entra nell'identità di un risultato — 80 e 150 km sullo
/// stesso punto non producono la stessa cosa — e un valore arbitrario renderebbe
/// due postazioni salvate non confrontabili fra loro.
enum SearchBreadth {
  /// 80 km: parità con la reachability dalla posizione GPS. Impostazione iniziale.
  quick(80, 50),

  /// 100 km.
  medium(100, 150),

  /// 150 km: per le postazioni in quota, dove la linea di vista va ben oltre
  /// gli 80 km e i ripetitori lontani sono spesso il motivo per cui si è saliti.
  extended(150, 300);

  const SearchBreadth(this.radiusKm, this.candidateLimit);

  /// Raggio di ricerca dei candidati, in chilometri.
  final double radiusKm;

  /// Quanti ripetitori valutare al massimo.
  ///
  /// Senza questo il raggio da solo non basta: il RPC `repeaters_nearby`
  /// tronca al suo default di 50, quindi in un'area popolata allargare a
  /// 150 km restituirebbe esattamente gli stessi 50 ripetitori più vicini e
  /// il selettore sarebbe un comando che non fa nulla.
  final int candidateLimit;

  /// Valore predefinito quando l'utente non ne ha ancora scelto uno.
  static const SearchBreadth defaultBreadth = SearchBreadth.quick;

  /// Ricostruisce il valore dal nome persistito, tornando al default se la
  /// stringa non corrisponde a nulla di noto.
  static SearchBreadth fromName(String? name) {
    for (final value in SearchBreadth.values) {
      if (value.name == name) return value;
    }
    return defaultBreadth;
  }
}
