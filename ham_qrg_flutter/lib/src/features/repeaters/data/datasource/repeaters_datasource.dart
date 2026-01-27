import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_stats_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';

abstract interface class RepeatersDatasource {
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? accessModes,
  });

  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm,
    List<String>? accessModes,
  });

  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit,
    List<String>? accessModes,
  });

  Future<int> getTotalRepeatersCount();

  Future<int?> getTotalFavoritesCount(String userId);

  Future<List<String>> getFavoriteRepeatersIds(String userId);

  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId);

  Future<RepeaterModel?> getRepeaterById(String repeaterId);

  Future<void> addFavoriteRepeater(String userId, String repeaterId);

  Future<void> removeFavoriteRepeater(String userId, String repeaterId);

  // Feedback methods
  Future<RepeaterFeedbackStatsModel?> getRepeaterFeedbackStats(
    String repeaterId,
  );

  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String repeaterAccessId,
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

  Future<List<RepeaterFeedbackModel>> getMyRepeaterFeedbacks({
    required String userId,
    required String repeaterId,
  });

  // Report methods
  Future<void> submitRepeaterReport({
    required String userId,
    required String repeaterId,
    required String description,
  });
}
