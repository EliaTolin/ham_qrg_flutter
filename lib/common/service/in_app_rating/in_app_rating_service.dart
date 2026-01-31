import 'package:flutter/foundation.dart';
import 'package:hamqrg/clients/in_app_review/in_app_review_provider.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'in_app_rating_service.g.dart';

/// Helper class used to show the in-app rating prompt when a certain number of
/// quizzes has been completed
class InAppRatingService {
  const InAppRatingService(this.ref);
  final Ref ref;

  // * Used to show the prompt
  InAppReview get _inAppReview => ref.read(inAppReviewProvider);

  static const _key = 'in_app_rating_prompt_count';

  /// Requests a review if certain conditions are met
  Future<void> requestReviewIfNeeded({
    required int totalQuizzes,
  }) async {
    // * Don't show rating prompt on web (not supported)
    if (kIsWeb) {
      return;
    }

    // * If we can show a review dialog
    if (await _inAppReview.isAvailable()) {
      final sharedPrefs = await SharedPreferences.getInstance();
      final inAppReviewRequestCount = sharedPrefs.getInt(_key) ?? 0;

      // * Use an exponential backoff function:
      // * - 1st request after 5 completed quizzes
      // * - 2nd request after another 10 completed quizzes (15 total)
      // * - 3rd request after another 20 completed quizzes (35 total)
      if (totalQuizzes >= 5 && inAppReviewRequestCount == 0 ||
          totalQuizzes >= 15 && inAppReviewRequestCount == 1 ||
          totalQuizzes >= 35 && inAppReviewRequestCount == 2) {
        // * Request the review
        await _inAppReview.requestReview();
        // * Increment the count
        await sharedPrefs.setInt(_key, inAppReviewRequestCount + 1);
      }
    }
  }
}

@riverpod
InAppRatingService inAppRatingService(Ref ref) {
  return InAppRatingService(ref);
}
