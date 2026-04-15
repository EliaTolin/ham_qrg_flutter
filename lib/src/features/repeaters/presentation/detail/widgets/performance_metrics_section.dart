import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/health_score_helper.dart';
import 'package:hamqrg/common/utils/time_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';

class PerformanceMetricsSection extends StatelessWidget {
  const PerformanceMetricsSection({
    required this.stats,
    super.key,
  });

  final RepeaterFeedbackStats? stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final likesTotal = stats?.likesTotal ?? 0;
    final downTotal = stats?.downTotal ?? 0;
    final healthScore =
        HealthScoreHelper.calculateHealthScore(likesTotal, downTotal);
    final status = _healthStatus(healthScore, context);
    final lastLikeAt = stats?.lastLikeAt;
    final lastDownAt = stats?.lastDownAt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total Likes and Reports
        Row(
          children: [
            Expanded(
              child: MetricCard(
                icon: Icons.thumb_up,
                iconColor: colorScheme.tertiary,
                value: likesTotal.toString(),
                label: l10n.repeaterDetailTotalLikes,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: MetricCard(
                icon: Icons.warning_amber_rounded,
                iconColor: colorScheme.error,
                value: downTotal.toString(),
                label: l10n.repeaterDetailReports1Yr,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Health Score
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.repeaterDetailHealthScore,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$healthScore',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '%',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: status.color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: status.color.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            status.label,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: status.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.repeaterDetailScoreCalculated(downTotal),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: HealthScoreCircle(
                  score: healthScore,
                  color: status.color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Last Like and Last Down Report
        Row(
          children: [
            Expanded(
              child: LastActivityCard(
                icon: Icons.thumb_up,
                iconColor: colorScheme.tertiary,
                label: l10n.repeaterDetailLastLike,
                timeAgo: lastLikeAt != null ? TimeHelper.formatTimeAgo(lastLikeAt, l10n) : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: LastActivityCard(
                icon: Icons.warning_amber_rounded,
                iconColor: colorScheme.error,
                label: l10n.repeaterDetailLastDownReport,
                timeAgo: lastDownAt != null ? TimeHelper.formatTimeAgo(lastDownAt, l10n) : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static ({String label, Color color}) _healthStatus(
    int score,
    BuildContext context,
  ) {
    final l10n = context.localization;
    final colorScheme = Theme.of(context).colorScheme;
    if (score >= 80) {
      return (label: l10n.repeaterDetailExcellent, color: colorScheme.tertiary);
    } else if (score >= 60) {
      return (label: l10n.repeaterDetailGood, color: colorScheme.primary);
    } else if (score >= 40) {
      return (label: l10n.repeaterDetailFair, color: colorScheme.error);
    } else {
      return (label: l10n.repeaterDetailToVerify, color: colorScheme.error);
    }
  }
}

class MetricCard extends StatelessWidget {
  const MetricCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class HealthScoreCircle extends StatelessWidget {
  const HealthScoreCircle({
    required this.score,
    required this.color,
    super.key,
  });

  final int score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularProgressPainter(
        progress: score / 100,
        color: color,
      ),
      child: Center(
        child: Icon(
          Icons.favorite,
          color: color,
          size: 32,
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  CircularProgressPainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // Background circle
    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress circle
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class LastActivityCard extends StatelessWidget {
  const LastActivityCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.timeAgo,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String? timeAgo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 4),
              Text(
                timeAgo ?? l10n.repeaterDetailNever,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
