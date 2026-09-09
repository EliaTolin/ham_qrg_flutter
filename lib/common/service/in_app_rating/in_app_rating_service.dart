import 'package:flutter/foundation.dart';
import 'package:hamqrg/clients/in_app_review/app_review_client.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_app_rating_service.g.dart';

/// Chiede la recensione nativa dello store, ma solo quando ha senso chiederla.
///
/// Il prompt di sistema è una **risorsa a quota**: iOS lo mostra al massimo
/// tre volte in 365 giorni e ignora in silenzio le richieste successive:
/// chiederlo nel momento sbagliato non è neutro, brucia una delle tre
/// occasioni che l'utente ci concede in un anno. Per questo qui non c'è una
/// singola condizione ma una scala:
///
/// - **mai al primo avvio**: chi ha appena installato non ha ancora un'opinione;
/// - **la prima richiesta al secondo avvio**, cioè al primo ritorno spontaneo —
///   il segnale più economico che l'app è servita a qualcosa;
/// - **le successive più in là** ([_launchMilestones]) e comunque non prima di
///   [_minGapBetweenPrompts] dall'ultima;
/// - **mai più di cinque volte in tutta la vita dell'installazione**, cioè
///   quanti sono i traguardi: chi ignora il prompt fino in fondo non lo
///   rivede mai più;
/// - **una sola volta per sessione**, qualunque cosa faccia l'utente;
/// - **mai offline**: la scheda dello store non riuscirebbe a inviare nulla e
///   la richiesta verrebbe spesa a vuoto.
///
/// Il conteggio degli avvii lo alimenta [registerAppLaunch], chiamata dalla
/// splash; la richiesta la fa [requestReviewIfNeeded], chiamata quando la home
/// si è posata (vedi `InAppRatingTrigger`).
class InAppRatingService {
  InAppRatingService(this.ref);

  final Ref ref;

  /// Avvii completati dell'app (cold start).
  static const _launchCountKey = 'in_app_rating_launch_count';

  /// Quante volte il prompt è già stato chiesto.
  static const _promptCountKey = 'in_app_rating_prompt_count';

  /// Quando è stato chiesto l'ultima volta (ISO 8601).
  static const _lastPromptAtKey = 'in_app_rating_last_prompt_at';

  /// Avvio a partire dal quale scatta l'n-esima richiesta: la prima al
  /// secondo avvio, poi al quinto e al quindicesimo, e le ultime due solo a
  /// chi continua a tornare.
  ///
  /// **La lunghezza di questa lista è il tetto di vita dell'installazione**:
  /// esaurita, non si chiede mai più. Non esiste una seconda costante da
  /// tenere allineata — sarebbe l'unico modo di sbagliare l'invariante che
  /// più conta qui.
  static const _launchMilestones = <int>[2, 5, 15, 40, 100];

  /// Distanza minima fra due richieste.
  ///
  /// Da sapere leggendo il numero: iOS mostra il prompt al massimo tre volte
  /// in 365 giorni e ignora in silenzio le altre. A 100 giorni di distanza la
  /// quarta richiesta cade al giorno 300 — dentro lo stesso anno delle prime
  /// tre — e su iOS verrà con ogni probabilità soppressa: contata qui, mai
  /// vista dall'utente. È una scelta consapevole (chiedere prima a chi torna
  /// spesso vale la richiesta persa); chi volesse invece che tutte e cinque
  /// arrivino a destinazione deve riportare questo valore sopra i 122 giorni,
  /// cioè 365 diviso tre.
  static const _minGapBetweenPrompts = Duration(days: 100);

  /// Un avvio va contato una volta sola: la splash può ricostruirsi (retry
  /// dopo un errore) senza che questo diventi un secondo avvio.
  bool _launchRegistered = false;

  /// Una richiesta per sessione, decisa prima di qualunque `await` così che
  /// due chiamate concorrenti non possano superarla entrambe.
  bool _requestedThisSession = false;

  Future<StorageClient> get _storage =>
      ref.read(sharedPrefStorageClientProvider.future);

  /// Registra un avvio dell'app. Idempotente per processo.
  Future<void> registerAppLaunch() async {
    if (kIsWeb || _launchRegistered) return;
    _launchRegistered = true;

    try {
      final storage = await _storage;
      final launchCount = await _readInt(storage, _launchCountKey);
      await storage.write(_launchCountKey, '${launchCount + 1}');
    } catch (error, stackTrace) {
      // Il conteggio è un di più: se fallisce si rinuncia a chiedere la
      // recensione, non si disturba l'avvio dell'app.
      _log('registerAppLaunch failed', error, stackTrace);
    }
  }

  /// Mostra il prompt se **tutte** le condizioni descritte sulla classe sono
  /// soddisfatte. Non lancia mai: è un di più, non deve poter rompere una
  /// schermata.
  Future<void> requestReviewIfNeeded() async {
    // Il prompt nativo non esiste sul web.
    if (kIsWeb || _requestedThisSession) return;

    // Offline la scheda dello store non potrebbe inviare la recensione: la
    // richiesta verrebbe spesa senza che l'utente possa completarla.
    if (ref.read(offlineStatusProvider).value ?? false) {
      _skipped('offline');
      return;
    }

    try {
      final storage = await _storage;
      final promptCount = await _readInt(storage, _promptCountKey);
      if (promptCount >= _launchMilestones.length) {
        _skipped('lifetime cap reached ($promptCount prompts)');
        return;
      }

      final launchCount = await _readInt(storage, _launchCountKey);
      if (launchCount < _launchMilestones[promptCount]) {
        _skipped(
          'launch $launchCount < milestone ${_launchMilestones[promptCount]}',
        );
        return;
      }

      if (!_gapElapsed(await storage.read(_lastPromptAtKey))) {
        _skipped('last prompt too recent');
        return;
      }

      // Da qui in poi la sessione è "spesa" comunque: se il dispositivo non
      // può mostrare il prompt non ha senso ritentare più tardi nello stesso
      // avvio, e la bandiera va alzata prima dell'`await` perché due
      // chiamate concorrenti non la superino entrambe.
      _requestedThisSession = true;
      if (!await _appReview.isAvailable()) {
        _skipped('store review not available on this device');
        return;
      }

      await _appReview.requestReview();

      // Si conta la richiesta, non l'esito: il sistema non dice se il prompt
      // è stato davvero mostrato né cosa ha fatto l'utente, e trattare un
      // prompt soppresso come "non chiesto" farebbe riprovare all'infinito.
      await storage.write(_promptCountKey, '${promptCount + 1}');
      await storage.write(
        _lastPromptAtKey,
        DateTime.now().toUtc().toIso8601String(),
      );
      _log('review prompt requested (#${promptCount + 1})');
    } catch (error, stackTrace) {
      _log('requestReviewIfNeeded failed', error, stackTrace);
    }
  }

  AppReviewClient get _appReview => ref.read(appReviewClientProvider);

  /// Perché non si è chiesto, solo in debug.
  ///
  /// Senza questa riga il silenzio è indistinguibile da un guasto: chi prova
  /// il prompt su un dispositivo non ha modo di sapere se manca un avvio al
  /// traguardo, se la quota di vita è esaurita o se il dispositivo non sa
  /// mostrarlo. In release non si stampa: sarebbe rumore su una decisione che
  /// nessuno sta osservando.
  void _skipped(String reason) {
    if (!kDebugMode) return;
    _log('prompt skipped: $reason');
  }

  Future<int> _readInt(StorageClient storage, String key) async {
    return int.tryParse(await storage.read(key) ?? '') ?? 0;
  }

  /// `true` se dall'ultima richiesta è passato abbastanza tempo (o se non ce
  /// n'è mai stata una). Una data illeggibile o nel futuro — orologio
  /// spostato a mano — vale come "non è passato abbastanza": nel dubbio si
  /// tace, non si chiede.
  bool _gapElapsed(String? lastPromptAt) {
    if (lastPromptAt == null) return true;
    final last = DateTime.tryParse(lastPromptAt);
    if (last == null) return false;
    final elapsed = DateTime.now().toUtc().difference(last.toUtc());
    return elapsed >= _minGapBetweenPrompts;
  }

  void _log(String message, [Object? error, StackTrace? stackTrace]) {
    final talker = ref.read(talkerServiceProvider);
    if (error == null) {
      talker.info('[InAppRating] $message');
      return;
    }
    talker.handle(error, stackTrace, '[InAppRating] $message');
  }
}

/// `keepAlive`: le due bandiere di sessione (avvio già contato, recensione già
/// chiesta) vivono nell'istanza, e un provider ricreato le azzererebbe —
/// l'avvio verrebbe contato due volte e il prompt potrebbe ripresentarsi nello
/// stesso avvio.
@Riverpod(keepAlive: true)
InAppRatingService inAppRatingService(Ref ref) {
  return InAppRatingService(ref);
}
