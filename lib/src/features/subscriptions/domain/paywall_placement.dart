/// Punti dell'app da cui può partire un acquisto Pro.
///
/// L'id di ogni voce è un **placement** configurato nella dashboard
/// RevenueCat (Product catalog → Placements): è lì che si decide quale
/// offering — e quindi quale paywall — serve a quel punto, per quale
/// audience, senza toccare l'app.
///
/// Il codice non nomina mai un offering: nomina il posto da cui l'utente
/// sta chiedendo di comprare. Se un placement non esiste ancora in
/// dashboard, la richiesta ricade sul *Current offering* del progetto, per
/// cui l'app resta funzionante anche a configurazione vuota.
///
/// Aggiungendo una voce qui va creato il placement omonimo in dashboard,
/// altrimenti quel punto mostrerà la paywall di default invece della sua.
enum PaywallPlacement {
  /// Card promozionale della copertura, nel dettaglio ripetitore.
  coveragePromo('coverage_promo'),

  /// Dialog "guarda cosa raggiungi" sulla reachability.
  reachabilityUpsell('reachability_upsell'),

  /// Badge di raggiungibilità sulla scheda del ripetitore.
  reachBadge('reach_badge'),

  /// Teaser sfocato della ricerca di copertura, con il punto già scelto.
  coverageTeaser('coverage_teaser'),

  /// Vetrina delle postazioni salvate.
  savedStationsShowcase('saved_stations_showcase'),

  /// Voce "Mappe offline" nel profilo.
  offlineMaps('offline_maps'),

  /// Card di stato dell'abbonamento, nel profilo.
  proStatusCard('pro_status_card');

  const PaywallPlacement(this.id);

  /// Identificatore del placement come scritto nella dashboard RevenueCat.
  final String id;
}
