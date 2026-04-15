import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_with_active_spots_provider.g.dart';

@Riverpod(keepAlive: true)
class RepeatersWithActiveSpots extends _$RepeatersWithActiveSpots {
  @override
  FutureOr<Set<String>> build() async {
    final repository = ref.read(spotsRepositoryProvider);
    return repository.getRepeaterIdsWithActiveSpots();
  }

  void addRepeaterId(String repeaterId) {
    final current = state.value ?? {};
    state = AsyncData({...current, repeaterId});
  }

  void removeRepeaterId(String repeaterId) {
    final current = state.value ?? {};
    state = AsyncData({...current}..remove(repeaterId));
  }
}
