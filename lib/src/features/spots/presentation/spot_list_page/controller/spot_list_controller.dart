import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:hamqrg/src/features/spots/provider/recent_spots_notifier/recent_spots_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spot_list_controller.g.dart';

@riverpod
class SpotListController extends _$SpotListController {
  @override
  FutureOr<List<RepeaterSpot>> build() async {
    // Reuse the same RecentSpotsNotifier (shared provider per FR-030g)
    final spots = await ref.watch(recentSpotsProvider.future);
    return spots;
  }
}
