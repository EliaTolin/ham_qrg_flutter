import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/health_score_helper.dart';

void main() {
  group('HealthScoreHelper.calculateHealthScore', () {
    test('returns 100 when no feedbacks', () {
      expect(HealthScoreHelper.calculateHealthScore(0, 0), 100);
    });

    test('returns 100 when all likes', () {
      expect(HealthScoreHelper.calculateHealthScore(10, 0), 100);
    });

    test('returns 0 when all downs', () {
      expect(HealthScoreHelper.calculateHealthScore(0, 10), 0);
    });

    test('returns 50 when equal likes and downs', () {
      expect(HealthScoreHelper.calculateHealthScore(5, 5), 50);
    });

    test('returns 70 for 7 likes and 3 downs', () {
      expect(HealthScoreHelper.calculateHealthScore(7, 3), 70);
    });

    test('returns 80 for 8 likes and 2 downs', () {
      expect(HealthScoreHelper.calculateHealthScore(8, 2), 80);
    });

    test('returns 90 for 9 likes and 1 down', () {
      expect(HealthScoreHelper.calculateHealthScore(9, 1), 90);
    });

    test('rounds correctly: 1 like 3 downs = 25', () {
      expect(HealthScoreHelper.calculateHealthScore(1, 3), 25);
    });

    test('rounds up: 2 likes 3 downs = 40', () {
      expect(HealthScoreHelper.calculateHealthScore(2, 3), 40);
    });

    test('rounds correctly: 1 like 2 downs = 33', () {
      expect(HealthScoreHelper.calculateHealthScore(1, 2), 33);
    });

    test('rounds correctly: 2 likes 1 down = 67', () {
      expect(HealthScoreHelper.calculateHealthScore(2, 1), 67);
    });

    test('single like returns 100', () {
      expect(HealthScoreHelper.calculateHealthScore(1, 0), 100);
    });

    test('single down returns 0', () {
      expect(HealthScoreHelper.calculateHealthScore(0, 1), 0);
    });

    test('large numbers: 999 likes and 1 down', () {
      expect(HealthScoreHelper.calculateHealthScore(999, 1), 100);
    });

    test('large numbers: 1 like and 999 downs', () {
      expect(HealthScoreHelper.calculateHealthScore(1, 999), 0);
    });

    test('large equal numbers', () {
      expect(HealthScoreHelper.calculateHealthScore(500, 500), 50);
    });

    test('score is clamped to 0 minimum', () {
      expect(HealthScoreHelper.calculateHealthScore(0, 100), 0);
      expect(
        HealthScoreHelper.calculateHealthScore(0, 100),
        greaterThanOrEqualTo(0),
      );
    });

    test('score is clamped to 100 maximum', () {
      expect(HealthScoreHelper.calculateHealthScore(100, 0), 100);
      expect(
        HealthScoreHelper.calculateHealthScore(100, 0),
        lessThanOrEqualTo(100),
      );
    });

    test('score always between 0 and 100', () {
      for (var likes = 0; likes <= 100; likes++) {
        for (var downs = 0; downs <= 100; downs++) {
          final score =
              HealthScoreHelper.calculateHealthScore(likes, downs);
          expect(score, greaterThanOrEqualTo(0));
          expect(score, lessThanOrEqualTo(100));
        }
      }
    });
  });
}
