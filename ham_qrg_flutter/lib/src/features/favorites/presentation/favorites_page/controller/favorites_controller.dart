import 'package:ham_qrg/src/features/favorites/presentation/favorites_page/controller/state/favorites_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/provider/get_favorite_repeaters/get_favorite_repeaters_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/provider/remove_favorite_repeater/remove_favorite_repeater_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<FavoritesState> build() async {
    final favorites = await ref.read(getFavoriteRepeatersProvider.future);
    return FavoritesState(
      favorites: favorites,
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

  void toggleModeFilter(RepeaterMode mode) {
    final currentState = state.value;
    if (currentState == null) return;
    final newModes = Set<RepeaterMode>.from(currentState.selectedModes);
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
      await ref.read(removeFavoriteRepeaterProvider(repeaterId).future);
      // Refresh favorites list
      final updatedFavorites = await ref.read(getFavoriteRepeatersProvider.future);
      return currentState.copyWith(favorites: updatedFavorites);
    });
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final favorites = await ref.read(getFavoriteRepeatersProvider.future);
      return FavoritesState(
        favorites: favorites,
        selectedModes: state.value?.selectedModes ?? {},
        searchQuery: state.value?.searchQuery ?? '',
      );
    });
  }
}
