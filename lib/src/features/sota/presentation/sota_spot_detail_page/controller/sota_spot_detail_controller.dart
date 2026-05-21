import 'dart:async';
import 'dart:developer';

import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/errors/sota_errors.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/controller/sota_spots_controller.dart';
import 'package:hamqrg/src/features/sota/provider/get_sota_summit/get_sota_summit_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sota_spot_detail_controller.g.dart';

/// Detail controller for a SOTA spot.
///
/// Loads the summit detail from the public SOTA API, then computes the
/// distance and bearing from the user's QTH to the summit client-side.
/// **Does not** call the altimetric-profile edge function — that backend
/// is designed for short-range repeater paths, not for SOTA summits which
/// can be hundreds of km away.
@riverpod
class SotaSpotDetailController extends _$SotaSpotDetailController {
  @override
  FutureOr<SotaSpotDetailState> build(int spotId, String summitCode) async {
    final spot = await _resolveSpot(spotId, summitCode);
    unawaited(
      Future<void>.delayed(Duration.zero, () => _loadSummitAndDistance(spot)),
    );
    return SotaSpotDetailState(spot: spot, summitLoading: true);
  }

  Future<SotaSpot> _resolveSpot(int spotId, String summitCode) async {
    final spotsState = await ref.read(sotaSpotsControllerProvider.future);
    final found = spotsState.spots.where((s) => s.id == spotId).firstOrNull;
    if (found != null) return found;

    // Fallback: spot not in list (deep link or expired list). Minimal
    // placeholder using summit code; the summit detail fetch will enrich.
    return SotaSpot(
      id: spotId,
      timestamp: DateTime.now(),
      activator: '—',
      summitCode: summitCode,
      summitName: summitCode,
      altitudeM: 0,
      altitudeFt: 0,
      points: 0,
      frequencyMhz: 0,
      mode: '',
      type: SotaSpotType.normal,
    );
  }

  Future<void> _loadSummitAndDistance(SotaSpot spot) async {
    final current = state.value;
    if (current == null) return;

    try {
      final summit = await ref.read(
        getSotaSummitProvider(summitCode: spot.summitCode).future,
      );
      final updated = (state.value ?? current).copyWith(
        summit: summit,
        summitLoading: false,
        summitError: false,
      );
      state = AsyncData(updated);

      // Distance + bearing — only if we can read the user position.
      try {
        final pos =
            await ref.read(locationServiceProvider).getCurrentPosition();
        final dist = distanceKm(
          pos.latitude,
          pos.longitude,
          summit.latitude,
          summit.longitude,
        );
        final bearing = bearingDegrees(
          pos.latitude,
          pos.longitude,
          summit.latitude,
          summit.longitude,
        );
        state = AsyncData(
          (state.value ?? updated).copyWith(
            distanceKm: dist,
            bearingDegrees: bearing,
          ),
        );
      } catch (_) {
        // GPS not granted / unavailable → leave distance/bearing null.
      }
    } catch (e, st) {
      log('SOTA summit fetch failed for ${spot.summitCode}: $e\n$st');
      state = AsyncData(
        (state.value ?? current).copyWith(
          summitLoading: false,
          summitError: e is! SotaSummitNotFound,
        ),
      );
    }
  }

  Future<void> retrySummit() async {
    final current = state.value;
    if (current == null) return;
    state =
        AsyncData(current.copyWith(summitLoading: true, summitError: false));
    ref.invalidate(getSotaSummitProvider(summitCode: current.spot.summitCode));
    await _loadSummitAndDistance(current.spot);
  }
}
