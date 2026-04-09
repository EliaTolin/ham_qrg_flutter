import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/state/pota_spot_detail_state.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/pota_spots_controller.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_park/get_pota_park_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_spot_detail_controller.g.dart';

@riverpod
class PotaSpotDetailController extends _$PotaSpotDetailController {
  @override
  FutureOr<PotaSpotDetailState> build(int spotId, String reference) async {
    // Read from the keepAlive controller state (what the user saw)
    final spotsState = ref.read(potaSpotsControllerProvider).value;
    final spot = spotsState?.spots
        .where((s) => s.spotId == spotId)
        .firstOrNull;
    if (spot == null) {
      throw StateError('Spot $spotId non più disponibile');
    }

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
    } catch (e) {
      log('ERROR: $e');
      // Location not available, ignore
    }

    return PotaSpotDetailState(
      spot: spot,
      park: park,
      distanceKm: distanceKm,
    );
  }
}
