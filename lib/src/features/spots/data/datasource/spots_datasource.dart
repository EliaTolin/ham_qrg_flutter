import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';

abstract class SpotsDatasource {
  Future<SpotModel> createSelfSpot({
    required String repeaterId,
    required int durationMinutes,
    required String accessId,
  });

  Future<SpotModel> createOtherSpot({
    required String repeaterId,
    required String spottedCallsign,
    String? accessId,
  });

  Future<SpotModel> closeSpot({required String spotId});

  Future<List<SpotModel>> getActiveSpotsForRepeater(String repeaterId);

  Future<List<SpotModel>> getAllSpotsForRepeater(
    String repeaterId, {
    int limit = 20,
    int offset = 0,
  });

  Future<List<SpotModel>> getRecentSpots();

  Future<SpotModel?> getMyActiveSpot(String userId);

  Future<List<String>> getRepeaterIdsWithActiveSpots();

  Future<void> setClusterNotificationsEnabled({required bool enabled});

  Future<void> setFavoriteClusterNotifications({
    required String favoriteId,
    required bool enabled,
  });
}
