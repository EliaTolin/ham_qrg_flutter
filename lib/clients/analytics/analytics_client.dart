/// Eventi del funnel di conversione a Pro (FR-064).
///
/// Enum chiuso e non stringa libera: i nomi finiscono in una colonna su cui si
/// calcolano i tassi di passaggio, e un refuso silenzioso spezzerebbe il
/// confronto fra superfici senza che nessuno se ne accorga.
///
/// Gli identificatori portano il prefisso `coverage_` perché il funnel è nato
/// lì, e restano invariati anche ora che copre ogni punto vendita dell'app:
/// rinominarli spezzerebbe il confronto con le righe già scritte, che è
/// l'unica cosa per cui questi eventi esistono.
enum AnalyticsEvent {
  /// L'utente ha fissato un punto sulla mappa.
  coveragePointSelected('coverage_point_selected'),

  /// Il teaser è stato mostrato a un utente non Pro.
  coverageTeaserShown('coverage_teaser_shown'),

  /// L'utente ha toccato la call to action.
  coverageCtaTapped('coverage_cta_tapped'),

  /// Il paywall è stato presentato.
  coveragePaywallShown('coverage_paywall_shown'),

  /// L'acquisto è andato a buon fine.
  coveragePurchaseCompleted('coverage_purchase_completed'),

  /// Il paywall è stato chiuso senza acquistare.
  coveragePaywallDismissed('coverage_paywall_dismissed');

  const AnalyticsEvent(this.id);

  /// Identificatore scritto a database.
  final String id;
}

/// Da quale punto d'ingresso arriva l'evento (FR-065).
///
/// Deve esistere una voce per **ogni** `PaywallPlacement`: un punto vendita
/// non strumentato non è semplicemente poco misurato, rende incomparabili
/// anche gli altri, perché il totale degli acquisti non torna con la somma
/// delle superfici. Per questo `openPaywall` & co. pretendono una superficie
/// invece di accettarne una opzionale.
enum AnalyticsSurface {
  /// Teaser mostrato sulla mappa dopo la scelta del punto.
  mapTeaser('map_teaser'),

  /// Vetrina della lista postazioni.
  stationsList('stations_list'),

  /// Pulsante "cosa raggiungo da qui", superficie preesistente (FR-066).
  reachButton('reach_button'),

  /// Badge sfocato sul dettaglio ripetitore, superficie preesistente (FR-066).
  reachBadge('reach_badge'),

  /// Card di stato dell'abbonamento nel profilo: la superficie con più
  /// impression dell'app, ed è rimasta a lungo l'unica senza misura.
  profileCard('profile_card'),

  /// Card promozionale della copertura nel dettaglio ripetitore.
  coveragePromo('coverage_promo'),

  /// Voce "Mappe offline" nel profilo.
  offlineMaps('offline_maps');

  const AnalyticsSurface(this.id);

  /// Identificatore scritto a database.
  final String id;
}

/// Registra gli eventi del funnel.
///
/// La firma è la garanzia di FR-067: **non esiste** un parametro in cui possano
/// finire coordinate o nomi di località. Non è una convenzione da ricordare —
/// sono dati sensibili (l'abitazione di una persona, il suo sito di
/// attivazione) e l'unico dato libero ammesso è un contatore intero.
abstract class AnalyticsClient {
  /// Registra [event] avvenuto su [surface].
  ///
  /// Non attende, non lancia e non rallenta l'interazione (FR-068): un backend
  /// irraggiungibile non deve produrre alcun effetto osservabile dall'utente.
  void track(
    AnalyticsEvent event, {
    required AnalyticsSurface surface,
    int? count,
  });
}
