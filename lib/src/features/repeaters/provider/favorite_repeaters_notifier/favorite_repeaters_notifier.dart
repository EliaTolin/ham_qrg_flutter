import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/state/favorite_repeaters_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repeaters_notifier.g.dart';

@riverpod
class FavoriteRepeatersNotifier extends _$FavoriteRepeatersNotifier {
  @override
  Future<FavoriteRepeatersState> build() async {
    final userId = await ref.watch(getUserIdProvider.future);
    if (userId == null) {
      return const FavoriteRepeatersState();
    }

    final repository = ref.read(repeatersRepositoryProvider);

    final repeaters = await repository.getFavoriteRepeaters(userId);
    final ids = await repository.getFavoriteRepeatersIds(userId);
    final count = await repository.getTotalFavoritesCount(userId);
    
    return FavoriteRepeatersState(
      repeaters: repeaters,
      ids: ids,
      count: count ?? 0,
    );
  }

  Future<void> add(String repeaterId) async {
    final userId = await ref.read(getUserIdProvider.future);
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final repository = ref.read(repeatersRepositoryProvider);
    await repository.addFavoriteRepeater(userId, repeaterId);

    // Refresh state from server to ensure consistency
    ref.invalidateSelf();
  }

  Future<void> remove(String repeaterId) async {
    final userId = await ref.read(getUserIdProvider.future);
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final repository = ref.read(repeatersRepositoryProvider);
    await repository.removeFavoriteRepeater(userId, repeaterId);

    // Optimistic update: remove from local state immediately
    state.whenData((currentState) {
      state = AsyncData(
        currentState.copyWith(
          repeaters: currentState.repeaters.where((r) => r.id != repeaterId).toList(),
          ids: currentState.ids.where((id) => id != repeaterId).toList(),
          count: (currentState.count - 1).clamp(0, currentState.count),
        ),
      );
    });
  }

  bool isFavorite(String repeaterId) {
    return state.whenOrNull(data: (s) => s.ids.contains(repeaterId)) ?? false;
  }
}
