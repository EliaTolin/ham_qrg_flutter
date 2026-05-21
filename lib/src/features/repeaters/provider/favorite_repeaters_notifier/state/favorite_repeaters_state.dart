import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'favorite_repeaters_state.freezed.dart';

@freezed
abstract class FavoriteRepeatersState with _$FavoriteRepeatersState {
  const factory FavoriteRepeatersState({
    @Default([]) List<Repeater> repeaters,
    @Default([]) List<String> ids,
    @Default(0) int count,

    /// Map of repeaterId → clusterNotificationsEnabled for each favorite.
    @Default({}) Map<String, bool> clusterNotifications,

    /// Map of repeaterId → favoriteId for update operations.
    @Default({}) Map<String, String> favoriteIdByRepeaterId,
  }) = _FavoriteRepeatersState;
}
