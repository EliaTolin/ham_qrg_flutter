import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';

part 'sota_spot_detail_state.freezed.dart';

/// Detail page state for a SOTA spot.
///
/// `summit` loads asynchronously from the public SOTA API.
/// `distanceKm` and `bearingDegrees` are computed client-side from the
/// summit coordinates + the user's location (if granted), without any
/// terrain-profile backend call.
@freezed
abstract class SotaSpotDetailState with _$SotaSpotDetailState {
  const factory SotaSpotDetailState({
    required SotaSpot spot,
    @Default(false) bool summitLoading,
    @Default(false) bool summitError,
    SotaSummit? summit,
    double? distanceKm,
    double? bearingDegrees,
  }) = _SotaSpotDetailState;
}
