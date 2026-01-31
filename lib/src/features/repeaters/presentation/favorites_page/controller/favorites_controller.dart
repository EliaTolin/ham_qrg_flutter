import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/favorites_page/controller/state/favorites_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<FavoritesState> build() async {
    final favoritesState = await ref.watch(favoriteRepeatersProvider.future);
    return FavoritesState(
      favorites: favoritesState.repeaters,
      selectedModes: {},
      searchQuery: '',
    );
  }

  void updateSearchQuery(String query) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(
      currentState.copyWith(searchQuery: query),
    );
  }

  void toggleModeFilter(AccessMode mode) {
    final currentState = state.value;
    if (currentState == null) return;
    final newModes = Set<AccessMode>.from(currentState.selectedModes);
    if (newModes.contains(mode)) {
      newModes.remove(mode);
    } else {
      newModes.add(mode);
    }
    state = AsyncValue.data(
      currentState.copyWith(selectedModes: newModes),
    );
  }

  Future<void> removeFavorite(String repeaterId) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = await AsyncValue.guard(() async {
      await ref.read(favoriteRepeatersProvider.notifier).remove(repeaterId);
      // Refresh favorites list
      final favoritesState = await ref.read(favoriteRepeatersProvider.future);
      return currentState.copyWith(favorites: favoritesState.repeaters);
    });
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    ref.invalidate(favoriteRepeatersProvider);
    state = await AsyncValue.guard(() async {
      final favoritesState = await ref.read(favoriteRepeatersProvider.future);
      return FavoritesState(
        favorites: favoritesState.repeaters,
        selectedModes: state.value?.selectedModes ?? {},
        searchQuery: state.value?.searchQuery ?? '',
      );
    });
  }
}
