import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';

part 'repeaters_list_state.freezed.dart';

@freezed
abstract class RepeatersListState with _$RepeatersListState {
  const factory RepeatersListState({
    @Default(<Repeater>[]) List<Repeater> repeaters,
    @Default(<String, RepeaterFeedbackStats>{})
    Map<String, RepeaterFeedbackStats> feedbackStats,
    LocationErrorType? locationError,
    @Default(<AccessMode>{}) Set<AccessMode> selectedModes,
    @Default(100) double radiusKm,
  }) = _RepeatersListState;
}
