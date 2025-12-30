import 'package:ham_qrg/src/features/home/presentation/home/controller/state/home_state.dart';
import 'package:ham_qrg/src/features/home/provider/get_home_statistics/get_home_statistics_provider.dart';
import 'package:ham_qrg/src/features/home/provider/get_nearby_repeaters/get_nearby_repeaters_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    return _loadInitialData();
  }

  Future<HomeState> _loadInitialData() async {
    // Load statistics
    final statistics = await ref.read(getHomeStatisticsProvider.future);

    // Try to get user location, fallback to Rome if fails
    late final ({double latitude, double longitude}) position;
    try {
      position = await ref.read(locationServiceProvider).getCurrentPosition();
    } catch (_) {
      const initialLat = 41.9028; // Rome default
      const initialLon = 12.4964;
      position = (latitude: initialLat, longitude: initialLon);
    }

    try {
      // Load nearby repeaters
      final nearbyRepeaters = await ref.read(
        getNearbyRepeatersProvider(
          latitude: position.latitude,
          longitude: position.longitude,
          limit: 3,
        ).future,
      );

      return HomeState(
        statistics: statistics,
        nearbyRepeaters: nearbyRepeaters,
      );
    } on LocationException catch (error) {
      return HomeState(
        statistics: statistics,
        nearbyRepeaters: [],
        locationError: error.type,
      );
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitialData());
  }
}

