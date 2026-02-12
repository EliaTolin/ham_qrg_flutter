import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'repeater_detail_map_state.freezed.dart';

@freezed
abstract class RepeaterDetailMapState with _$RepeaterDetailMapState {
  const factory RepeaterDetailMapState({
    required Repeater repeater,
    @Default([]) List<RepeaterFeedback> feedbacks,
  }) = _RepeaterDetailMapState;
}
