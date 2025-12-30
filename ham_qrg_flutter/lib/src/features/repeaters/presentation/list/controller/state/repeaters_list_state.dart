import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters/service/location_service.dart';

part 'repeaters_list_state.freezed.dart';

@freezed
abstract class RepeatersListState with _$RepeatersListState {
  const factory RepeatersListState({
    @Default(<Repeater>[]) List<Repeater> repeaters,
    LocationErrorType? locationError,
    @Default(<RepeaterMode>{}) Set<RepeaterMode> selectedModes,
    @Default(100) double radiusKm,
  }) = _RepeatersListState;
}
