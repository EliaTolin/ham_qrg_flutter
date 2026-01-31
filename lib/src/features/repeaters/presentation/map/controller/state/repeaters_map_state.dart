import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';

part 'repeaters_map_state.freezed.dart';

@freezed
abstract class RepeatersMapState with _$RepeatersMapState {
  const factory RepeatersMapState({
    @Default(<Repeater>[]) List<Repeater> repeaters,
    double? latitude,
    double? longitude,
    LocationErrorType? locationError,
    @Default(<AccessMode>{}) Set<AccessMode> selectedModes,
    Repeater? selectedRepeater,
  }) = _RepeatersMapState;
}
