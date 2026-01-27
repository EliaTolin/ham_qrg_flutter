import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    required List<Repeater> favorites,
    required Set<AccessMode> selectedModes,
    required String searchQuery,
  }) = _FavoritesState;

  factory FavoritesState.initial() => const FavoritesState(
        favorites: [],
        selectedModes: {},
        searchQuery: '',
      );
}
