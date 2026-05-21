import 'package:hamqrg/src/features/repeaters/presentation/distance_map/controller/state/repeater_detail_map_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedbacks/get_repeater_feedbacks_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeater_detail_map_controller.g.dart';

@riverpod
class RepeaterDetailMapController extends _$RepeaterDetailMapController {
  @override
  FutureOr<RepeaterDetailMapState> build(String repeaterId) async {
    final repeater = await ref.read(getRepeaterByIdProvider(repeaterId).future);
    if (repeater == null) {
      throw Exception('Repeater not found');
    }

    final feedbacks = await ref.read(
      getRepeaterFeedbacksProvider(repeaterId: repeaterId).future,
    );

    return RepeaterDetailMapState(
      repeater: repeater,
      feedbacks: feedbacks,
    );
  }
}
