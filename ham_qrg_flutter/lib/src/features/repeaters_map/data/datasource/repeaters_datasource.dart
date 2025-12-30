import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';

abstract interface class RepeatersDatasource {
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? modes,
  });

  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm,
    List<String>? modes,
  });

  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit,
    List<String>? modes,
  });

  Future<int> getTotalRepeatersCount();

  Future<int?> getTotalFavoritesCount(String userId);

  Future<List<String>> getFavoriteRepeatersIds(String userId);

  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId);

  Future<void> addFavoriteRepeater(String userId, String repeaterId);

  Future<void> removeFavoriteRepeater(String userId, String repeaterId);
}
