import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_status_notifier.g.dart';

/// Stato offline dell'app: `true` quando il backend non è raggiungibile.
///
/// **A dire come stanno le cose è un solo segnale: il probe.** Una richiesta
/// leggera all'endpoint di health di Supabase, con timeout stretto. Qualunque
/// risposta HTTP conta come raggiungibile — anche 401 o 404 — perché la
/// domanda è solo "risponde o no"; solo l'assenza di risposta è offline.
///
/// `connectivity_plus` dice **quando** riprovare, mai **cosa** è vero. È una
/// distinzione pagata: la sua istantanea può riportare `none` su una rete che
/// funziona benissimo — succede sul simulatore iOS, e sui primi millisecondi
/// dopo il lancio mentre lo stack di rete si sta ancora alzando. Finché quel
/// `none` valeva come verdetto immediato, sovrascriveva un probe appena
/// riuscito e metteva l'intera app in modalità offline: la splash saltava
/// tutti i passi di rete, i datasource fallivano all'istante con
/// `OfflineException`, e la home si disegnava vuota su una connessione
/// perfetta. Il segnale dell'interfaccia non ha alcun modo di sapere se il
/// backend risponde; il probe sì, e costa una richiesta.
///
/// Letto sincrono dai datasource come `.value ?? false`; la splash lo risolve
/// (`.future`) prima di qualsiasi chiamata dati, così il primo fetch parte già
/// con lo stato giusto. [refresh] forza una rivalutazione.
@Riverpod(keepAlive: true)
class OfflineStatusNotifier extends _$OfflineStatusNotifier {
  static const _probeTimeout = Duration(seconds: 3);

  /// Respiro fra il primo probe e il secondo. Corto: è il tempo che serve allo
  /// stack di rete per finire di alzarsi, non un backoff.
  static const _retryDelay = Duration(milliseconds: 400);

  /// Una valutazione alla volta: i cambi di connettività arrivano a raffica
  /// (Wi-Fi che cade, cellulare che subentra) e senza questo ognuno lancerebbe
  /// la sua coppia di probe, con l'ultimo a rispondere — non l'ultimo a
  /// partire — a scrivere lo stato finale.
  bool _evaluating = false;

  @override
  Future<bool> build() async {
    final subscription = Connectivity().onConnectivityChanged.listen((_) {
      // I risultati si ignorano apposta: servono come sveglia, non come
      // risposta. Vedi la nota sulla classe.
      unawaited(_evaluate('connectivity change'));
    });
    ref.onDispose(subscription.cancel);

    return !await _isBackendReachable(reason: 'startup');
  }

  /// Forza una rivalutazione (probe incluso) dello stato corrente.
  Future<void> refresh() => _evaluate('manual refresh');

  Future<void> _evaluate(String reason) async {
    if (_evaluating) return;
    _evaluating = true;
    try {
      state = AsyncData(!await _isBackendReachable(reason: reason));
    } finally {
      _evaluating = false;
    }
  }

  /// Probe con un secondo tentativo: **un solo fallimento non è un verdetto**.
  ///
  /// La richiesta può cadere all'istante — risoluzione DNS non ancora
  /// possibile subito dopo il lancio, o handoff Wi-Fi/cellulare a metà — su
  /// una rete che funziona. Quel fallimento costa caro proprio perché è
  /// immediato: arriva prima che chiunque possa accorgersene, e da lì in poi
  /// tutta l'app si comporta da offline.
  ///
  /// Se siamo davvero irraggiungibili i due tentativi falliscono entrambi
  /// senza costare il loro timeout — senza rotta verso l'host la richiesta
  /// torna subito — e si pagano quei 400 ms una volta sola.
  Future<bool> _isBackendReachable({required String reason}) async {
    final talker = ref.read(talkerServiceProvider);
    if (await _probe()) {
      talker.info('[Offline] probe ($reason): reachable');
      return true;
    }
    await Future<void>.delayed(_retryDelay);
    final reachable = await _probe();
    // La riga che conta quando l'app si comporta da offline su una rete che
    // c'è: dice se il primo tentativo era un falso allarme o se il backend
    // era davvero irraggiungibile.
    talker.info(
      reachable
          ? '[Offline] probe ($reason): 1st failed, reachable on retry'
          : '[Offline] probe ($reason): unreachable after 2 attempts -> offline',
    );
    return reachable;
  }

  Future<bool> _probe() async {
    try {
      await Dio(
        BaseOptions(
          connectTimeout: _probeTimeout,
          receiveTimeout: _probeTimeout,
          // Qualunque status HTTP (anche 401/404) prova che il backend
          // risponde: interessa solo distinguere "risponde" da
          // "irraggiungibile".
          validateStatus: (_) => true,
        ),
      ).get<dynamic>('${AppConfigs.getSupabaseUrl()}/auth/v1/health');
      return true;
    } on DioException {
      return false;
    }
  }
}
