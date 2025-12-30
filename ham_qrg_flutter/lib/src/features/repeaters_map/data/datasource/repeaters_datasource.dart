import 'package:ham_qrg/src/features/repeaters_map/data/model/feedback/repeater_feedback_model.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/feedback/repeater_feedback_stats_model.dart';
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

  // Feedback methods
  Future<RepeaterFeedbackStatsModel?> getRepeaterFeedbackStats(
    String repeaterId,
  );

  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String type,
    required String station,
    required double latitude,
    required double longitude,
    required String comment,
  });

  Future<void> deleteRepeaterFeedback(String userId, String feedbackId);

  Future<List<RepeaterFeedbackModel>> getRepeaterFeedbacks({
    required String repeaterId,
    int? limit,
  });

  Future<RepeaterFeedbackModel?> getMyRepeaterFeedback({
    required String userId,
    required String repeaterId,
  });
}
