import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

/// Scadenza "infinita" per le voci dei ripetitori.
///
/// `remote_caching` richiede sempre una data — la colonna `expires_at` è
/// `NOT NULL` e non esiste una rappresentazione di "non scade mai" — quindi si
/// usa una data irraggiungibile. Non sostituire con una `Duration`: `init()`
/// esegue `DELETE FROM cache WHERE expires_at < now`, e una voce che scade
/// verrebbe cancellata al riavvio successivo portandosi via l'offline di ogni
/// postazione che la contiene (FR-051).
final DateTime kNeverExpires = DateTime.utc(9999, 12, 31);

/// Prefisso delle chiavi. Porta una versione, così un cambio di forma del
/// `Repeater` si gestisce con un prefisso nuovo anziché con una cancellazione.
const String kRepeaterCachePrefix = 'repeater:v1:';

/// Accesso alla cache condivisa dei ripetitori.
///
/// Ha due scrittori — il salvataggio di una postazione e l'apertura di una
/// qualsiasi scheda ripetitore — e due lettori con strategie diverse. È questo
/// che fa funzionare l'aggiornamento indiretto: aprire il ripetitore X a
/// febbraio riscrive la voce, e la postazione salvata a ottobre la rilegge
/// aggiornata senza che nessuno abbia rieseguito il calcolo.
abstract class RepeaterCacheDatasource {
  /// Lettura puramente locale: non tocca mai la rete.
  ///
  /// Poiché la voce non scade mai, la strategia `cacheFirst` restituisce
  /// sempre la copia conservata senza invocare il remoto — che è esattamente
  /// ciò che serve per aprire una postazione offline in un istante, anche con
  /// trecento ripetitori dentro.
  ///
  /// Restituisce `null` se la voce manca, invece di lanciare: un ripetitore
  /// irrisolto degrada da solo e non porta giù l'intera postazione.
  Future<CachedRepeater?> readCached(String repeaterId);

  /// Lettura fresca con ricaduta automatica sulla copia conservata.
  ///
  /// Online interroga [remote] e riscrive la voce; offline restituisce quanto
  /// conservato. È il punto in cui avviene l'aggiornamento indiretto.
  Future<Repeater> readFresh(
    String repeaterId, {
    required Future<Repeater> Function() remote,
  });

  /// Scrittura in blocco al salvataggio di una postazione, che la rende
  /// autosufficiente offline dal primo istante.
  Future<void> writeAll(List<Repeater> repeaters);
}
