import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/state/pota_spot_detail_state.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_park/get_pota_park_provider.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_spot_detail_controller.g.dart';

@riverpod
class PotaSpotDetailController extends _$PotaSpotDetailController {
  @override
  FutureOr<PotaSpotDetailState> build(int spotId, String reference) async {
    final spots = await ref.read(getPotaSpotsProvider.future);
    final spot = spots.firstWhere((s) => s.spotId == spotId);

    final park = await ref.read(getPotaParkProvider(reference).future);

    double? distanceKm;
    try {
      final position = await ref.read(cachedUserPositionProvider.future);
      if (park.latitude != null && park.longitude != null) {
        final meters = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          park.latitude!,
          park.longitude!,
        );
        distanceKm = meters / 1000;
      }
    } catch (_) {
      // Location not available, ignore
    }

    return PotaSpotDetailState(
      spot: spot,
      park: park,
      distanceKm: distanceKm,
    );
  }
}
