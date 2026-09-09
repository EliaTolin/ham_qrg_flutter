import 'dart:async';

import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/state/dashboard_state.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/state/favorite_repeaters_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  /// Gli errori di caricamento passano da Talker, non da `dart:developer`:
  /// `log()` non finisce nel registro dell'app, quindi un guasto intermittente
  /// — quello che si vede una volta all'avvio e poi sparisce al riprova — non
  /// lasciava alcuna traccia consultabile.
  Talker get _talker => ref.read(talkerServiceProvider);

  /// Stato offline all'inizio del caricamento in corso.
  ///
  /// Serve a distinguere «non sono riuscito a chiederlo» da «non potevo
  /// chiederlo»: un caricamento nato offline e fallito non è una notizia sulla
  /// rete di adesso, ed è l'unico che ha senso rifare da solo appena la rete
  /// c'è.
  bool _offlineAtLoadStart = false;

  @override
  FutureOr<DashboardState> build() async {
    _reloadWhenBackOnline();

    // Vale per questo caricamento soltanto: alla ricostruzione — o alla
    // dispose della pagina — Riverpod la esegue, e il ricaricamento differito
    // qui sotto trova la porta chiusa invece di scrivere su un notifier che
    // non c'è più.
    var stale = false;
    ref.onDispose(() => stale = true);

    // Read all providers BEFORE any await to avoid using Ref after
    // the provider may have been disposed across async gaps.
    _offlineAtLoadStart = ref.read(offlineStatusProvider).value ?? false;
    final favoritesFuture = ref.watch(favoriteRepeatersProvider.future);
    final countRepeatersFuture =
        ref.watch(getTotalRepeatersCountProvider.future);

    // Nessun contatore è vitale: offline senza cache la home deve comunque
    // renderizzare (con gli zeri) invece di mostrare una pagina di errore.
    final (countFavorites, countRepeaters, countsFailed) = await _resolveCounts(
      favoritesFuture,
      countRepeatersFuture,
    );

    final result = await _loadInitialData(
      countFavorites,
      countRepeaters,
      countsFailed: countsFailed,
    );
    _scheduleReloadIfReconnectedDuringLoad(result, isStale: () => stale);
    return result;
  }

  /// Rifà il caricamento quando la rete torna e l'ultimo tentativo è fallito.
  ///
  /// I datasource catturano lo stato offline alla costruzione e i provider dei
  /// dati non lo osservano: senza questo, una lettura fallita da offline resta
  /// in cache come errore anche quando la rete è già tornata, e la home
  /// continua a mostrare l'avviso finché qualcuno non tocca «riprova» — cioè
  /// chiede a mano una cosa che l'app sa già.
  void _reloadWhenBackOnline() {
    ref.listen(offlineStatusProvider, (previous, next) {
      final wasOffline = previous?.value ?? false;
      final isOfflineNow = next.value ?? false;
      if (!wasOffline || isOfflineNow) return;
      if (state.value?.hasLoadError ?? false) unawaited(reload());
    });
  }

  /// La rete è tornata **mentre** il caricamento era in volo: il listener qui
  /// sopra è scattato quando non c'era ancora uno stato da guardare, quindi la
  /// decisione va ripresa alla fine.
  ///
  /// `Duration.zero` e non una microtask: il ricaricamento deve partire dopo
  /// che Riverpod ha assegnato questo risultato, altrimenti [reload] non
  /// troverebbe dati precedenti da tenere in piedi in caso di secondo guasto.
  void _scheduleReloadIfReconnectedDuringLoad(
    DashboardState result, {
    required bool Function() isStale,
  }) {
    if (!result.hasLoadError || !_offlineAtLoadStart) return;
    if (ref.read(offlineStatusProvider).value ?? false) return;
    unawaited(
      Future<void>.delayed(Duration.zero, () async {
        if (isStale()) return;
        await reload();
      }),
    );
  }

  /// Terzo elemento: **almeno un conteggio è fallito**. Serve a non far
  /// passare uno zero d'errore per uno zero vero.
  Future<(int, int, bool)> _resolveCounts(
    Future<FavoriteRepeatersState> favoritesFuture,
    Future<int> countRepeatersFuture,
  ) async {
    var countFavorites = 0;
    var countRepeaters = 0;
    var failed = false;
    try {
      countFavorites = (await favoritesFuture).count;
    } catch (error, stackTrace) {
      failed = true;
      _talker.handle(error, stackTrace, '[Dashboard] favorites load failed');
    }
    try {
      countRepeaters = await countRepeatersFuture;
    } catch (error, stackTrace) {
      failed = true;
      _talker.handle(error, stackTrace, '[Dashboard] repeaters count failed');
    }
    return (countFavorites, countRepeaters, failed);
  }

  Future<DashboardState> _loadInitialData(
    int countFavorites,
    int countRepeaters, {
    required bool countsFailed,
  }) async {
    // Load statistics. Il profilo sulla dashboard è solo decorativo
    // (nome/avatar): se il fetch fallisce — offline senza cache — la home
    // deve comunque renderizzare.
    Profile? profile;
    try {
      profile = await ref.read(getProfileProvider.future);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, '[Dashboard] profile load failed');
    }
    final position =
        await ref.read(locationServiceProvider).getCurrentPositionOrDefault();

    // NOTE: POTA and SOTA spots are NOT loaded here. They come from
    // third-party APIs that can be slow or down, and the home page must
    // render (and stay usable) regardless. Their sections watch
    // getPotaSpotsProvider / getSotaSpotsProvider directly and show their
    // own inline error + retry.
    try {
      // Load nearby repeaters
      final nearbyRepeaters = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
        ).future,
      );

      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: nearbyRepeaters,
        profile: profile,
        hasLoadError: countsFailed,
      );
    } on LocationException catch (error) {
      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: [],
        locationError: error.type,
        profile: profile,
        hasLoadError: countsFailed,
      );
    } catch (error, stackTrace) {
      // Offline senza cache per questa zona: la home renderizza comunque,
      // con la mappa di anteprima vuota, invece di andare in errore.
      _talker.handle(error, stackTrace, '[Dashboard] nearby load failed');
      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: [],
        profile: profile,
        hasLoadError: true,
      );
    }
  }

  /// Ricarica i dati della home.
  ///
  /// Due errori già pagati, che questa forma evita:
  ///
  /// - **i provider vanno invalidati**, tutti quelli che si rileggono. Una
  ///   lettura fallita resta in cache come errore: senza invalidazione il
  ///   "riprova" rilegge lo stesso errore all'infinito e non può riuscire
  ///   nemmeno quando la rete è tornata.
  /// - **non si torna mai a `loading` a vuoto.** Se il ricaricamento
  ///   fallisce, lo stato resta sui dati di prima con il flag d'errore
  ///   alzato; azzerarlo prima di provarci lasciava la home su uno spinner
  ///   che, se la chiamata falliva, non finiva più.
  Future<void> reload() async {
    final previous = state.value;
    ref
      ..invalidate(favoriteRepeatersProvider)
      ..invalidate(getTotalRepeatersCountProvider)
      ..invalidate(getRepeatersNearbyProvider)
      ..invalidate(getPotaSpotsProvider)
      ..invalidate(getSotaSpotsProvider);

    try {
      final (countFavorites, countRepeaters, countsFailed) =
          await _resolveCounts(
        ref.read(favoriteRepeatersProvider.future),
        ref.read(getTotalRepeatersCountProvider.future),
      );
      state = AsyncData(
        await _loadInitialData(
          countFavorites,
          countRepeaters,
          countsFailed: countsFailed,
        ),
      );
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, '[Dashboard] reload failed');
      final fallback = previous;
      // Nessun dato precedente da tenere in piedi: qui l'errore è l'unica
      // cosa da mostrare, ed è la pagina d'errore con il suo riprova.
      if (fallback == null) {
        state = AsyncError(error, stackTrace);
        return;
      }
      state = AsyncData(fallback.copyWith(hasLoadError: true));
    }
  }
}
