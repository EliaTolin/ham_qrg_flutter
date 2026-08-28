import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_sort_order.dart';

part 'pota_spots_state.freezed.dart';

@freezed
abstract class PotaSpotsState with _$PotaSpotsState {
  const factory PotaSpotsState({
    @Default(<PotaSpot>[]) List<PotaSpot> spots,
    @Default(<PotaSpot>[]) List<PotaSpot> filteredSpots,
    @Default('') String searchQuery,
    @Default(false) bool hasLoadError,
    @Default(false) bool isRefreshing,
    DateTime? lastUpdatedAt,
    DateTime? nextRefreshAt,
    String? selectedBand,
    String? selectedMode,
    @Default(PotaSpotsSortOrder.time) PotaSpotsSortOrder sortOrder,
    @Default(<String, double>{}) Map<String, double> distanceByReference,
    @Default(<String, PotaPark>{}) Map<String, PotaPark> parkCache,
    @Default(<String>[]) List<String> availableBands,
    @Default(<String>[]) List<String> availableModes,
  }) = _PotaSpotsState;
}
