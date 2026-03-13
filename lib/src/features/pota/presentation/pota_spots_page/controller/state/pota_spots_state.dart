import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';

part 'pota_spots_state.freezed.dart';

@freezed
abstract class PotaSpotsState with _$PotaSpotsState {
  const factory PotaSpotsState({
    @Default(<PotaSpot>[]) List<PotaSpot> spots,
    @Default(<PotaSpot>[]) List<PotaSpot> filteredSpots,
    @Default('') String searchQuery,
    @Default(false) bool hasLoadError,
    @Default(false) bool isRefreshing,
  }) = _PotaSpotsState;
}
