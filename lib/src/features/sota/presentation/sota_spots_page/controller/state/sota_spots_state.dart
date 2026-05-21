import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_sort_order.dart';

part 'sota_spots_state.freezed.dart';

@freezed
abstract class SotaSpotsState with _$SotaSpotsState {
  const factory SotaSpotsState({
    @Default(<SotaSpot>[]) List<SotaSpot> spots,
    @Default(<SotaSpot>[]) List<SotaSpot> filteredSpots,
    @Default(false) bool hasLoadError,
    @Default(false) bool isRefreshing,
    @Default(SotaSpotsSortOrder.time) SotaSpotsSortOrder sortOrder,
    @Default(<String, double>{}) Map<String, double> distanceBySummitCode,
    @Default(<String>[]) List<String> availableBands,
    @Default(<String>[]) List<String> availableModes,
    @Default(<String>[]) List<String> availableAssociations,
    String? selectedBand,
    String? selectedMode,
    int? minPoints,
    String? selectedAssociation,
  }) = _SotaSpotsState;
}
