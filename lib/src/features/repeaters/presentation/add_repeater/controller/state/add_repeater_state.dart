import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

part 'add_repeater_state.freezed.dart';

@freezed
abstract class AddRepeaterState with _$AddRepeaterState {
  const factory AddRepeaterState({
    @Default('') String name,
    @Default('') String callsign,
    @Default('') String frequency,
    @Default('') String shift,
    @Default('') String region,
    @Default('') String provinceCode,
    @Default('') String locality,
    @Default('') String latitude,
    @Default('') String longitude,
    @Default('') String locator,
    @Default('') String notes,
    @Default([]) List<SubmissionAccess> accesses,
    @Default(false) bool isConfirmed,
    @Default(false) bool isSubmitting,
  }) = _AddRepeaterState;
}

@freezed
abstract class SubmissionAccess with _$SubmissionAccess {
  const factory SubmissionAccess({
    required AccessMode mode,
    @Default('') String ctcssTxHz,
    @Default('') String ctcssRxHz,
    @Default('') String dcsCode,
    @Default('') String colorCode,
    @Default('') String talkgroup,
    @Default('') String dgId,
    @Default('') String nodeId,
    @Default('') String networkName,
    @Default('') String notes,
  }) = _SubmissionAccess;
}
