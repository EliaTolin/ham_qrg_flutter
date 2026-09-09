import 'package:hamqrg/common/provider/keep_alive_for_ref.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/state/favorite_repeaters_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repeaters_notifier.g.dart';

@riverpod
class FavoriteRepeatersNotifier extends _$FavoriteRepeatersNotifier {
  @override
  Future<FavoriteRepeatersState> build() async {
    ref.keepAliveFor(kHandoverKeepAlive);
    final userId = await ref.watch(getUserIdProvider.future);
    if (userId == null) {
      return const FavoriteRepeatersState();
    }

    final repository = ref.read(repeatersRepositoryProvider);

    // Solo la lista è essenziale. Ids e conteggio sono derivabili da essa e i
    // metadati sono accessori: offline basta che la lista sia in cache perché
    // i preferiti restino consultabili, invece di fallire tutto se una sola
    // delle quattro voci manca. Le chiamate partono comunque in parallelo
    // (in serie, su rete degradata, i timeout si sommerebbero).
    final repeatersFuture = repository.getFavoriteRepeaters(userId);
    // `_quiet` aggancia subito l'handler: se la lista fallisse per prima, le
    // altre future non resterebbero con errori non gestiti.
    final idsFuture = _quiet(repository.getFavoriteRepeatersIds(userId));
    final countFuture = _quiet(repository.getTotalFavoritesCount(userId));
    final metaFuture = _quiet(repository.getFavoritesMeta(userId));

    final repeaters = await repeatersFuture;
    final ids = await idsFuture ?? repeaters.map((r) => r.id).toList();
    final count = await countFuture ?? repeaters.length;
    final meta = await metaFuture;

    return FavoriteRepeatersState(
      repeaters: repeaters,
      ids: ids,
      count: count,
      clusterNotifications: meta?.clusterNotifications ?? const {},
      favoriteIdByRepeaterId: meta?.favoriteIds ?? const {},
    );
  }

  /// Converte un fallimento in `null`: usato per i dati accessori dei
  /// preferiti, che offline devono degradare invece di far fallire il build.
  static Future<T?> _quiet<T>(Future<T> future) =>
      future.then<T?>((value) => value, onError: (Object _) => null);

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
          repeaters:
              currentState.repeaters.where((r) => r.id != repeaterId).toList(),
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
