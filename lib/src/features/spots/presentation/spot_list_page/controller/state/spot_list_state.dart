import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';

part 'spot_list_state.freezed.dart';

@freezed
abstract class SpotListState with _$SpotListState {
  const factory SpotListState({
    @Default([]) List<RepeaterSpot> spots,
    @Default(false) bool hasLoadError,
  }) = _SpotListState;
}
