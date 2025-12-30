import 'package:ham_qrg/src/features/dashboard/controller/state/dashboard_state.dart';
import 'package:ham_qrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_total_favorites_count/get_total_favorites_count_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:ham_qrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    return _loadInitialData();
  }

  Future<DashboardState> _loadInitialData() async {
    // Load statistics

    final profile = await ref.read(getProfileProvider.future);
    // Try to get user location, fallback to Rome if fails
    late final ({double latitude, double longitude}) position;
    try {
      position = await ref.read(locationServiceProvider).getCurrentPosition();
    } catch (_) {
      const initialLat = 41.9028; // Rome default
      const initialLon = 12.4964;
      position = (latitude: initialLat, longitude: initialLon);
    }

    late final int? countFavorites;
    late final int countRepeaters;

    try {
      countFavorites = await ref.read(getTotalFavoritesCountProvider.future);
      countRepeaters = await ref.read(getTotalRepeatersCountProvider.future);
    } on Exception catch (e) {
      throw Exception(e);
    }

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
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_loadInitialData);
  }
}
