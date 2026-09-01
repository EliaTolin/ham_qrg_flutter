import 'dart:developer';

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

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    // Read all providers BEFORE any await to avoid using Ref after
    // the provider may have been disposed across async gaps.
    final favoritesFuture = ref.watch(favoriteRepeatersProvider.future);
    final countRepeatersFuture =
        ref.watch(getTotalRepeatersCountProvider.future);

    // Nessun contatore è vitale: offline senza cache la home deve comunque
    // renderizzare (con gli zeri) invece di mostrare una pagina di errore.
    final (countFavorites, countRepeaters) = await _resolveCounts(
      favoritesFuture,
      countRepeatersFuture,
    );

    return _loadInitialData(countFavorites, countRepeaters);
  }

  Future<(int, int)> _resolveCounts(
    Future<FavoriteRepeatersState> favoritesFuture,
    Future<int> countRepeatersFuture,
  ) async {
    var countFavorites = 0;
    var countRepeaters = 0;
    try {
      countFavorites = (await favoritesFuture).count;
    } catch (error) {
      log('Dashboard favorites load skipped (offline?): $error');
    }
    try {
      countRepeaters = await countRepeatersFuture;
    } catch (error) {
      log('Dashboard repeaters count skipped (offline?): $error');
    }
    return (countFavorites, countRepeaters);
  }

  Future<DashboardState> _loadInitialData(
    int countFavorites,
    int countRepeaters,
  ) async {
    // Load statistics. Il profilo sulla dashboard è solo decorativo
    // (nome/avatar): se il fetch fallisce — offline senza cache — la home
    // deve comunque renderizzare.
    Profile? profile;
    try {
      profile = await ref.read(getProfileProvider.future);
    } catch (error) {
      log('Dashboard profile load skipped (offline?): $error');
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
      );
    } catch (error) {
      // Offline senza cache per questa zona: la home renderizza comunque,
      // con la mappa di anteprima vuota, invece di andare in errore.
      log('Dashboard nearby load skipped (offline?): $error');
      return DashboardState(
        statistics: DashboardStatistics(
          totalRepeaters: countRepeaters,
          favoritesCount: countFavorites,
        ),
        initialPosition: (lat: position.latitude, lon: position.longitude),
        nearbyRepeaters: [],
        profile: profile,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    ref
      ..invalidate(favoriteRepeatersProvider)
      ..invalidate(getPotaSpotsProvider)
      ..invalidate(getSotaSpotsProvider);
    final favoritesState = await ref.read(favoriteRepeatersProvider.future);
    final countRepeaters =
        await ref.read(getTotalRepeatersCountProvider.future);
    state = await AsyncValue.guard(
      () => _loadInitialData(favoritesState.count, countRepeaters),
    );
  }
}
