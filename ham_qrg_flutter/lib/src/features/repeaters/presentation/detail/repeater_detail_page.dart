import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/access_mode_helper.dart';
import 'package:ham_qrg/common/utils/repeater_format_helper.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/common/utils/time_helper.dart';
import 'package:ham_qrg/config/app_configs.dart';
import 'package:ham_qrg/l10n/app_localizations.dart';
import 'package:ham_qrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:ham_qrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:ham_qrg/src/features/repeaters/presentation/detail/widgets/repeater_location_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RepeaterDetailPage extends HookConsumerWidget {
  const RepeaterDetailPage({
    required this.repeaterId,
    super.key,
  });

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerAsync = ref.watch(
      repeaterDetailControllerProvider(repeaterId),
    );
    final controllerNotifier = ref.read(
      repeaterDetailControllerProvider(repeaterId).notifier,
    );

    return Scaffold(
      body: controllerAsync.when(
        data: (state) => _RepeaterDetailContent(
          state: state,
          controller: controllerNotifier,
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                context.localization.error_message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RepeaterDetailContent extends HookConsumerWidget {
  const _RepeaterDetailContent({
    required this.state,
    required this.controller,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorMode = RepeaterModeHelper.getModeColorObject(state.repeater.mode);

    return CustomScrollView(
      slivers: [
        // Header
        _RepeaterHeader(
          repeater: state.repeater,
          colorMode: colorMode,
        ),
        // Action buttons
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _ActionButtons(),
          ),
        ),
        // Content
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Performance Metrics
              _PerformanceMetricsSection(
                stats: state.feedbackStats,
              ),
              const SizedBox(height: 16),
              // Technical Data
              _TechnicalDataSection(repeater: state.repeater),
              const SizedBox(height: 16),
              // Access Modes
              _AccessModesSection(repeater: state.repeater),
              const SizedBox(height: 16),
              // Location
              _LocationSection(repeater: state.repeater),
              const SizedBox(height: 16),
              // Community Reports
              _CommunityReportsSection(
                state: state,
                controller: controller,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _RepeaterHeader extends StatelessWidget {
  const _RepeaterHeader({
    required this.repeater,
    required this.colorMode,
  });

  final Repeater repeater;
  final Color colorMode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      leading: IconButton(
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Stack(
            children: [
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorMode.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              // Bottom gradient
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.2),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              // Content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: colorMode.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: colorMode.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorMode,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (repeater.callsign != null)
                        Text(
                          repeater.callsign!,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (repeater.name != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          repeater.name!,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            [
                              repeater.locality,
                              repeater.region,
                            ].whereType<String>().join(', '),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          if (repeater.locator != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              '(${repeater.locator})',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              icon: Icons.favorite_border,
              label: l10n.repeaterDetailSave,
              onTap: () {
                // TO-DO: Implement save functionality
              },
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: _ActionButton(
              icon: Icons.share,
              label: l10n.repeaterDetailShare,
              onTap: () {
                // TO-DO: Implement share functionality
              },
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          Expanded(
            child: _ActionButton(
              icon: Icons.flag_outlined,
              label: l10n.repeaterDetailReport,
              onTap: () {
                // TO-DO: Implement report functionality
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PerformanceMetricsSection extends StatelessWidget {
  const _PerformanceMetricsSection({required this.stats});

  final RepeaterFeedbackStats? stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final likesTotal = stats?.likesTotal ?? 0;
    final downTotal = stats?.downTotal ?? 0;
    final healthScore = _calculateHealthScore(likesTotal, downTotal);
    final lastLikeAt = stats?.lastLikeAt;
    final lastDownAt = stats?.lastDownAt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total Likes and Reports
        Row(
          children: [
            Expanded(
              child: _MetricCard(
                icon: Icons.thumb_up,
                iconColor: Colors.green,
                value: likesTotal.toString(),
                label: l10n.repeaterDetailTotalLikes,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _MetricCard(
                icon: Icons.warning_amber_rounded,
                iconColor: Colors.amber,
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
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            l10n.repeaterDetailExcellent,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.green,
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
                child: _HealthScoreCircle(score: healthScore),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Last Like and Last Down Report
        Row(
          children: [
            Expanded(
              child: _LastActivityCard(
                icon: Icons.thumb_up,
                iconColor: Colors.green,
                label: l10n.repeaterDetailLastLike,
                timeAgo: lastLikeAt != null ? TimeHelper.formatTimeAgo(lastLikeAt) : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _LastActivityCard(
                icon: Icons.warning_amber_rounded,
                iconColor: Colors.amber,
                label: l10n.repeaterDetailLastDownReport,
                timeAgo: lastDownAt != null ? TimeHelper.formatTimeAgo(lastDownAt) : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int _calculateHealthScore(int likes, int downs) {
    if (likes + downs == 0) return 100;
    final total = likes + downs;
    final score = ((likes / total) * 100).round();
    return math.max(0, math.min(100, score));
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
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

class _HealthScoreCircle extends StatelessWidget {
  const _HealthScoreCircle({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircularProgressPainter(
        progress: score / 100,
        color: Colors.green,
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          color: Colors.green,
          size: 32,
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  _CircularProgressPainter({
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
      ..color = Colors.grey.withValues(alpha: 0.2)
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
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _LastActivityCard extends StatelessWidget {
  const _LastActivityCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.timeAgo,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String? timeAgo;

  @override
  Widget build(BuildContext context) {
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
                timeAgo ?? 'Never',
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

class _TechnicalDataSection extends StatelessWidget {
  const _TechnicalDataSection({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.settings_input_antenna,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.repeaterDetailTechnicalData,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _TechnicalDataCard(
                label: l10n.repeaterDetailFrequency,
                value: RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _TechnicalDataCard(
                label: l10n.repeaterDetailShift,
                value: RepeaterFormatHelper.formatShift(
                  repeater.shiftHz,
                  repeater.shiftRaw,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TechnicalDataCard extends StatelessWidget {
  const _TechnicalDataCard({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccessModesSection extends StatelessWidget {
  const _AccessModesSection({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (repeater.accesses.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            l10n.accessConfiguration.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 10,
            ),
          ),
        ),
        ...repeater.accesses.map((access) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AccessModeCard(access: access),
          );
        }),
      ],
    );
  }
}

class _AccessModeCard extends StatelessWidget {
  const _AccessModeCard({required this.access});

  final RepeaterAccess access;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
    final accessLabel = AccessModeHelper.getAccessModeLabel(access.mode);
    final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);

    final isAnalog = access.mode == AccessMode.analog;
    final isDmr = access.mode == AccessMode.dmr;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with badge and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isAnalog
                      ? colorScheme.surfaceContainerHighest
                      : accessColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isAnalog
                        ? colorScheme.outline.withValues(alpha: 0.2)
                        : accessColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  accessLabel.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isAnalog ? colorScheme.onSurfaceVariant : accessColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Icon(
                accessIcon,
                color: isAnalog
                    ? colorScheme.outline.withValues(alpha: 0.5)
                    : accessColor.withValues(alpha: 0.5),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Content based on access mode
          if (isAnalog) _buildAnalogContent(context),
          if (isDmr) _buildDmrContent(context),
          if (!isAnalog && !isDmr) _buildGenericContent(context),
        ],
      ),
    );
  }

  Widget _buildAnalogContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      spacing: 8,
      children: [
        // CTCSS Tx
        if (access.ctcssTxHz != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CTCSS Tx',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.ctcssTxHz!.toStringAsFixed(1),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        // CTCSS Rx
        if (access.ctcssRxHz != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CTCSS Rx',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.ctcssRxHz!.toStringAsFixed(1),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        // DCS
        if (access.dcsCode != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DCS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.dcsCode.toString(),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDmrContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color Code and DMR ID row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COLOR CODE',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    access.colorCode?.toString() ?? '-',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DMR ID',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    access.dmrId?.toString() ?? '-',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Networks section (if network is available)
        if (access.network != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NETWORKS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  access.network!.name,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildGenericContent(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final details = <Widget>[];

    // C4FM specific
    if (access.mode == AccessMode.c4fm && access.dgId != null) {
      details.add(
        _buildDetailRow(context, 'DG-ID', access.dgId.toString()),
      );
    }

    // D-STAR specific
    if (access.mode == AccessMode.dstar) {
      if (access.network != null) {
        details.add(
          _buildDetailRow(context, 'MODULE', access.network!.name),
        );
      }
    }

    // CTCSS/DCS if present
    if (access.ctcssTxHz != null || access.ctcssRxHz != null) {
      details.add(
        _buildDetailRow(
          context,
          'TONE',
          access.ctcssTxHz != null
              ? '${access.ctcssTxHz!.toStringAsFixed(1)} Hz'
              : '${access.ctcssRxHz!.toStringAsFixed(1)} Hz',
        ),
      );
    }

    // Notes if present
    if (access.notes != null && access.notes!.isNotEmpty) {
      details.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOTES',
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              access.notes!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    if (details.isEmpty) {
      return Text(
        'No additional details',
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details.expand((widget) => [widget, const SizedBox(height: 8)]).toList()
        ..removeLast(),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final distanceText = repeater.distanceMeters != null
        ? RepeaterFormatHelper.formatDistance(repeater.distanceMeters).replaceAll(' away', '')
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.map,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.repeaterDetailLocation,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (distanceText != null)
              Text(
                distanceText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        RepeaterLocationMap(
          repeater: repeater,
        ),
        if (repeater.locality != null || repeater.locator != null) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                if (repeater.locality != null) ...[
                  Text(
                    repeater.locality!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                if (repeater.locator != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    '• ${repeater.locator}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _CommunityReportsSection extends HookConsumerWidget {
  const _CommunityReportsSection({
    required this.state,
    required this.controller,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final profileAsync = ref.watch(getProfileProvider);

    final locationText = useTextEditingController(
      text: state.locationText,
    );
    final comment = useTextEditingController(
      text: state.comment,
    );

    // Get available accesses (those without user feedback)
    final availableAccesses = controller.getAvailableAccesses();

    // Filter out user's own feedbacks from community list
    final myFeedbackIds = state.myFeedbacks.map((f) => f.id).toSet();
    final communityFeedbacks =
        state.communityFeedbacks.where((f) => !myFeedbackIds.contains(f.id)).toList();

    // Get user callsign from profile
    final userCallsign = profileAsync.value?.callsign;

    // Prefill location on mount
    useEffect(
      () {
        controller.prefillUserLocation();
        return null;
      },
      [],
    );

    // Sync location text with state
    useEffect(
      () {
        if (state.locationText != null && locationText.text != state.locationText) {
          locationText.text = state.locationText!;
        }
        return null;
      },
      [state.locationText],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.forum,
              color: colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.repeaterDetailCommunityReports,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // User's feedbacks section
        if (state.myFeedbacks.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              l10n.repeaterDetailYourFeedback.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ),
          ...state.myFeedbacks.map(
            (feedback) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _MyFeedbackCard(
                feedback: feedback,
                userCallsign: userCallsign,
                onDelete: () => controller.deleteFeedback(feedback.id),
                isLoading: state.isDeletingFeedback,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        // Feedback form (only if there are accesses without feedback)
        if (availableAccesses.isNotEmpty) ...[
          if (state.myFeedbacks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                l10n.repeaterDetailAddFeedback.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 10,
                ),
              ),
            ),
          _FeedbackFormCard(
            state: state,
            availableAccesses: availableAccesses,
            locationController: locationText,
            commentController: comment,
            controller: controller,
          ),
          const SizedBox(height: 16),
        ],
        // Others reports section header
        if (communityFeedbacks.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              l10n.repeaterDetailOthersReports.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ),
          ...communityFeedbacks.map(
            (feedback) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _CommunityFeedbackCard(feedback: feedback),
            ),
          ),
          if (state.feedbackStats != null &&
              (state.feedbackStats!.likesTotal + state.feedbackStats!.downTotal) >
                  communityFeedbacks.length + state.myFeedbacks.length)
            Center(
              child: TextButton(
                onPressed: () {
                  // TO-DO: Navigate to full feedbacks list
                },
                child: Text(
                  l10n.repeaterDetailViewAllReports(
                    state.feedbackStats!.likesTotal + state.feedbackStats!.downTotal,
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }
}

class _MyFeedbackCard extends StatelessWidget {
  const _MyFeedbackCard({
    required this.feedback,
    required this.onDelete,
    required this.isLoading,
    this.userCallsign,
  });

  final RepeaterFeedback feedback;
  final String? userCallsign;
  final VoidCallback onDelete;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final displayCallsign = userCallsign ?? feedback.userId.substring(0, 6).toUpperCase();
    final isLike = feedback.type == FeedbackType.like;
    final badgeColor = isLike ? Colors.green : Colors.amber;
    final accessColor = AccessModeHelper.getAccessModeColorObject(feedback.repeaterAccess.mode);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'YOU',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayCallsign,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        TimeHelper.formatTimeAgo(feedback.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: badgeColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isLike ? Icons.thumb_up : Icons.warning_amber_rounded,
                      size: 14,
                      color: badgeColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isLike ? l10n.repeaterDetailLike : l10n.repeaterDetailReportLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: badgeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Access mode badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: accessColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: accessColor.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  AccessModeHelper.getAccessModeIcon(feedback.repeaterAccess.mode),
                  size: 14,
                  color: accessColor,
                ),
                const SizedBox(width: 4),
                Text(
                  _getAccessDescription(feedback.repeaterAccess),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: accessColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Info chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(
                icon: _getStationIcon(feedback.station),
                label: _getStationLabel(feedback.station, l10n),
              ),
            ],
          ),
          if (feedback.comment.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                feedback.comment,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
          const SizedBox(height: 12),
          // Delete button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: isLoading ? null : onDelete,
              icon: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.delete_outline, size: 18),
              label: Text(l10n.repeaterDetailRemove),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getAccessDescription(RepeaterAccess access) {
    final label = AccessModeHelper.getAccessModeLabel(access.mode);
    if (access.network != null) {
      return '$label - ${access.network!.name}';
    }
    if (access.ctcssTxHz != null) {
      return '$label (${access.ctcssTxHz!.toStringAsFixed(1)}Hz)';
    }
    return label;
  }

  IconData _getStationIcon(StationKind station) {
    switch (station) {
      case StationKind.portable:
        return Icons.smartphone;
      case StationKind.mobile:
        return Icons.directions_car;
      case StationKind.fixed:
        return Icons.home;
    }
  }

  String _getStationLabel(StationKind station, AppLocalizations l10n) {
    switch (station) {
      case StationKind.portable:
        return l10n.repeaterDetailStationPortable;
      case StationKind.mobile:
        return l10n.repeaterDetailStationMobile;
      case StationKind.fixed:
        return l10n.repeaterDetailStationFixed;
    }
  }
}

class _FeedbackFormCard extends StatelessWidget {
  const _FeedbackFormCard({
    required this.state,
    required this.availableAccesses,
    required this.locationController,
    required this.commentController,
    required this.controller,
  });

  final RepeaterDetailState state;
  final List<RepeaterAccess> availableAccesses;
  final TextEditingController locationController;
  final TextEditingController commentController;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isFormValid = controller.isFormValid();
    final isWithinDistance = controller.isWithinAllowedDistance();
    final canSubmit = isFormValid && isWithinDistance && !state.isSubmittingFeedback;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Equipment selection label
          Text(
            l10n.repeaterDetailEquipment.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          // Equipment selection buttons
          Row(
            children: [
              Expanded(
                child: _EquipmentButton(
                  icon: Icons.smartphone,
                  label: l10n.repeaterDetailStationPortable,
                  isSelected: state.selectedStation == StationKind.portable,
                  onTap: () => controller.setSelectedStation(StationKind.portable),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _EquipmentButton(
                  icon: Icons.directions_car,
                  label: l10n.repeaterDetailStationMobile,
                  isSelected: state.selectedStation == StationKind.mobile,
                  onTap: () => controller.setSelectedStation(StationKind.mobile),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _EquipmentButton(
                  icon: Icons.home,
                  label: l10n.repeaterDetailStationFixed,
                  isSelected: state.selectedStation == StationKind.fixed,
                  onTap: () => controller.setSelectedStation(StationKind.fixed),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Location field with autocomplete
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.repeaterDetailLocationRequired.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: locationController,
                onChanged: (value) {
                  controller
                    ..setLocationText(value)
                    ..searchLocationSuggestions(value);
                },
                decoration: InputDecoration(
                  hintText: 'City or Area (e.g. Rome)',
                  prefixIcon: const Icon(Icons.location_on, size: 20),
                  filled: true,
                  fillColor: colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
              ),
              // Location suggestions
              if (state.locationSuggestions.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: state.locationSuggestions.map((suggestion) {
                      return InkWell(
                        onTap: () {
                          controller.selectLocationSuggestion(suggestion);
                          locationController.text = suggestion.placeName;
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.place,
                                size: 18,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  suggestion.placeName,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Access selection (single select)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.repeaterDetailSelectAccess.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              ...availableAccesses.map((access) {
                final isSelected = state.selectedAccessId == access.id;
                final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
                final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () => controller.setSelectedAccessId(access.id),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? accessColor.withValues(alpha: 0.05)
                            : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? accessColor
                              : colorScheme.outline.withValues(alpha: 0.2),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? accessColor.withValues(alpha: 0.2)
                                  : colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              accessIcon,
                              color: isSelected ? accessColor : colorScheme.onSurfaceVariant,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getAccessTitle(access),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _getAccessSubtitle(access),
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? accessColor : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? accessColor
                                    : colorScheme.outline.withValues(alpha: 0.3),
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 16),
          // Comment field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.repeaterDetailCommentOptional.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: commentController,
                onChanged: controller.setComment,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: l10n.repeaterDetailCommentPlaceholder,
                  filled: true,
                  fillColor: colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
          // Distance warning if too far
          if (isFormValid && !isWithinDistance) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.amber.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.repeaterDetailDistanceWarning(
                        AppConfigs.maxFeedbackDistanceKm.toInt(),
                      ),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.amber.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: canSubmit
                      ? () => controller.submitFeedback(type: FeedbackType.like)
                      : null,
                  icon: state.isSubmittingFeedback
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.thumb_up, size: 18),
                  label: Text(l10n.repeaterDetailLike.toUpperCase()),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: canSubmit
                      ? () => controller.submitFeedback(type: FeedbackType.down)
                      : null,
                  icon: state.isSubmittingFeedback
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.warning_amber_rounded, size: 18),
                  label: Text(l10n.repeaterDetailReportDown.toUpperCase()),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getAccessTitle(RepeaterAccess access) {
    final label = AccessModeHelper.getAccessModeLabel(access.mode);
    if (access.network != null) {
      return '$label (${access.network!.name})';
    }
    if (access.ctcssTxHz != null) {
      return '$label (${access.ctcssTxHz!.toStringAsFixed(1)}Hz)';
    }
    return label;
  }

  String _getAccessSubtitle(RepeaterAccess access) {
    final parts = <String>[];

    if (access.colorCode != null) {
      parts.add('CC: ${access.colorCode}');
    }
    if (access.dmrId != null) {
      parts.add('ID: ${access.dmrId}');
    }
    if (access.ctcssRxHz != null && access.ctcssTxHz != access.ctcssRxHz) {
      parts.add('Rx: ${access.ctcssRxHz!.toStringAsFixed(1)}Hz');
    }
    if (access.dcsCode != null) {
      parts.add('DCS: ${access.dcsCode}');
    }
    if (access.dgId != null) {
      parts.add('DG-ID: ${access.dgId}');
    }

    if (parts.isEmpty) {
      return AccessModeHelper.getAccessModeLabel(access.mode).toUpperCase();
    }
    return parts.join(' • ');
  }
}

class _EquipmentButton extends StatelessWidget {
  const _EquipmentButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: 0.1)
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _CommunityFeedbackCard extends StatelessWidget {
  const _CommunityFeedbackCard({required this.feedback});

  final RepeaterFeedback feedback;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final borderColor = feedback.type == FeedbackType.like ? Colors.green : Colors.amber;
    final avatarColor = feedback.type == FeedbackType.like ? Colors.indigo : Colors.amber;
    final initials = feedback.userId.substring(0, 3).toUpperCase();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: avatarColor.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: avatarColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feedback.userId.substring(0, 6).toUpperCase(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        TimeHelper.formatTimeAgo(feedback.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: borderColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: borderColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      feedback.type == FeedbackType.like
                          ? Icons.thumb_up
                          : Icons.warning_amber_rounded,
                      size: 14,
                      color: borderColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      feedback.type == FeedbackType.like
                          ? l10n.repeaterDetailLike
                          : l10n.repeaterDetailReportLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: borderColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _InfoChip(
                icon: _getStationIcon(feedback.station),
                label: _getStationLabel(feedback.station, l10n),
              ),
              const SizedBox(width: 8),
              _InfoChip(
                icon: Icons.location_on,
                label: feedback.comment.isNotEmpty ? feedback.comment.split('\n').first : 'Unknown',
              ),
            ],
          ),
          if (feedback.comment.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              feedback.comment,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }

  IconData _getStationIcon(StationKind station) {
    switch (station) {
      case StationKind.portable:
        return Icons.smartphone;
      case StationKind.mobile:
        return Icons.directions_car;
      case StationKind.fixed:
        return Icons.home;
    }
  }

  String _getStationLabel(StationKind station, AppLocalizations l10n) {
    switch (station) {
      case StationKind.portable:
        return l10n.repeaterDetailStationPortable;
      case StationKind.mobile:
        return l10n.repeaterDetailStationMobile;
      case StationKind.fixed:
        return l10n.repeaterDetailStationFixed;
    }
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
