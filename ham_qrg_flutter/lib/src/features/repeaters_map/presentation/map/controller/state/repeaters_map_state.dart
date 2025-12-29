import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';

part 'repeaters_map_state.freezed.dart';

@freezed
abstract class RepeatersMapState with _$RepeatersMapState {
  const factory RepeatersMapState({
    @Default(<Repeater>[]) List<Repeater> repeaters,
    double? latitude,
    double? longitude,
    LocationErrorType? locationError,
    @Default(<RepeaterMode>{}) Set<RepeaterMode> selectedModes,
  }) = _RepeatersMapState;
}
