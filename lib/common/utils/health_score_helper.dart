import 'dart:math' as math;

/// Helper class for calculating repeater health scores.
class HealthScoreHelper {
  /// Calculates a health score (0–100) based on likes and down reports.
  ///
  /// Returns 100 when there are no feedbacks at all.
  /// The score is the percentage of likes over total feedbacks,
  /// clamped between 0 and 100.
  ///
  /// Examples:
  /// - (10, 0) -> 100
  /// - (0, 10) -> 0
  /// - (7, 3) -> 70
  /// - (0, 0) -> 100
  static int calculateHealthScore(int likes, int downs) {
    if (likes + downs == 0) return 100;
    final total = likes + downs;
    final score = ((likes / total) * 100).round();
    return math.max(0, math.min(100, score));
  }
}
