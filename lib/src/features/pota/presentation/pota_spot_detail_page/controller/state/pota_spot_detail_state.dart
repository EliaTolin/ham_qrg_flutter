import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';

part 'pota_spot_detail_state.freezed.dart';

@freezed
abstract class PotaSpotDetailState with _$PotaSpotDetailState {
  const factory PotaSpotDetailState({
    required PotaSpot spot,
    PotaPark? park,
    double? distanceKm,
  }) = _PotaSpotDetailState;
}
