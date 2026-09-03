/// Come va letto il prezzo mostrato accanto a una call to action.
enum ProPriceKind {
  /// Abbonamento: [ProPriceHint.price] è il costo mensile equivalente.
  perMonth,

  /// Abbonamento con periodo di prova gratuito iniziale.
  trialThenPerMonth,

  /// Acquisto una tantum: [ProPriceHint.price] è il prezzo pieno.
  lifetime,
}

/// Il prezzo d'ingresso a Pro, già formattato dallo store.
///
/// Esiste per una ragione sola: **nessuna superficie dell'app diceva quanto
/// costa**. Il prezzo compariva solo dentro la paywall, cioè dopo il tocco, e
/// chi teme un impegno di costo ignoto quel tocco non lo fa.
///
/// [price] arriva sempre da `StoreProduct` (`pricePerMonthString` o
/// `priceString`): è già localizzato, già nella valuta del conto dello store e
/// già allineato al listino. Non si compone mai un prezzo a mano — un numero
/// scritto nell'app e diverso da quello dello store è una promessa rotta nel
/// punto peggiore del funnel.
class ProPriceHint {
  const ProPriceHint({
    required this.kind,
    required this.price,
    this.billedTotal,
  });

  final ProPriceKind kind;

  /// Prezzo formattato dallo store, valuta inclusa (es. `2,99 €`).
  ///
  /// Per gli abbonamenti è il **mensile equivalente** (`pricePerMonthString`),
  /// che su un piano annuale non coincide con quanto viene addebitato: vedi
  /// [billedTotal].
  final String price;

  /// Importo realmente addebitato, quando l'addebito non è mensile.
  ///
  /// `null` su un piano mensile, dove [price] è già la cifra che l'utente
  /// paga. Non è un dettaglio da nascondere per far sembrare l'offerta più
  /// economica: su un annuale scrivere "6,66 € al mese" senza dire che se ne
  /// pagano 79,99 in una volta è una mezza verità nel punto in cui l'utente
  /// sta decidendo — e sugli store è terreno da rifiuto in revisione.
  final String? billedTotal;
}
