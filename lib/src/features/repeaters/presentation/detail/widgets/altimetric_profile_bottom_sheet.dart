import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_altimetric_profile/get_altimetric_profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AltimetricProfileBottomSheet extends ConsumerWidget {
  const AltimetricProfileBottomSheet({
    required this.repeaterLat,
    required this.repeaterLon,
    required this.repeaterName,
    super.key,
  });

  final double repeaterLat;
  final double repeaterLon;
  final String repeaterName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final profileAsync = ref.watch(
      getAltimetricProfileProvider(
        repeaterLat: repeaterLat,
        repeaterLon: repeaterLon,
      ),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.terrain,
                      color: colorScheme.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.repeaterDetailAltimetricProfile,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Content
              Expanded(
                child: profileAsync.when(
                  data: (profile) => _ProfileChart(
                    profile: profile,
                    repeaterName: repeaterName,
                    scrollController: scrollController,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  error: (error, stackTrace) {
                    debugPrint(
                      '[AltimetricProfile] Error: $error\n$stackTrace',
                    );
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: colorScheme.error,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              l10n.error_message,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$error',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileChart extends StatelessWidget {
  const _ProfileChart({
    required this.profile,
    required this.repeaterName,
    required this.scrollController,
  });

  final AltimetricProfile profile;
  final String repeaterName;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (profile.points.isEmpty) {
      return Center(child: Text(l10n.error_message));
    }

    // Reverse: user at left (0 km), repeater at right (total km)
    final totalDist = profile.totalDistanceKm;
    final terrainSpots = profile.points
        .map((p) => FlSpot(totalDist - p.distanceKm, p.elevationM))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    // User = original last point (now at x=0), Repeater = original first (now at x=total)
    final userPoint = profile.points.last;
    final repeaterPoint = profile.points.first;
    final losSpots = [
      FlSpot(0, userPoint.elevationM),
      FlSpot(totalDist, repeaterPoint.elevationM),
    ];

    // Check if LOS is obstructed
    final losObstructed = _isLosObstructed(profile);

    // Calculate Y axis bounds
    final elevations = profile.points.map((p) => p.elevationM);
    final minElevation = elevations.reduce(min);
    final maxElevation = elevations.reduce(max);
    final losMax = max(userPoint.elevationM, repeaterPoint.elevationM);
    final yMax = max(maxElevation, losMax);
    final yPadding = max<double>((yMax - minElevation) * 0.15, 20);
    final yMin = max<double>(0, minElevation - yPadding);
    final yMaxFinal = yMax + yPadding;

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        // LOS status badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: losObstructed
                ? colorScheme.errorContainer.withValues(alpha: 0.5)
                : Colors.green.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: losObstructed
                  ? colorScheme.error.withValues(alpha: 0.3)
                  : Colors.green.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                losObstructed ? Icons.visibility_off : Icons.visibility,
                size: 18,
                color: losObstructed ? colorScheme.error : Colors.green,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  losObstructed
                      ? l10n.repeaterDetailLosObstructed
                      : l10n.repeaterDetailLosClear,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: losObstructed ? colorScheme.error : Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Legend
        Row(
          children: [
            _LegendItem(
              color: colorScheme.primary,
              label: l10n.repeaterDetailTerrainProfile,
            ),
            const SizedBox(width: 16),
            _LegendItem(
              color: losObstructed ? colorScheme.error : Colors.green,
              label: l10n.repeaterDetailLineOfSight,
              dashed: true,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Chart
        SizedBox(
          height: 260,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: profile.totalDistanceKm,
              minY: yMin,
              maxY: yMaxFinal,
              clipData: const FlClipData.all(),
              gridData: FlGridData(
                drawVerticalLine: false,
                horizontalInterval: _calcInterval(yMin, yMaxFinal),
                getDrawingHorizontalLine: (value) => FlLine(
                  color: colorScheme.outline.withValues(alpha: 0.15),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: _calcInterval(0, totalDist),
                    getTitlesWidget: (value, meta) {
                      if (value == meta.min) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            l10n.repeaterDetailYou,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }
                      if (value == meta.max) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${value.toStringAsFixed(1)} km',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: Text(
                    'm',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 44,
                    interval: _calcInterval(yMin, yMaxFinal),
                    getTitlesWidget: (value, meta) {
                      if (value == meta.min || value == meta.max) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          value.toInt().toString(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                  left: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) =>
                      colorScheme.inverseSurface.withValues(alpha: 0.9),
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      if (spot.barIndex == 1) return null;
                      return LineTooltipItem(
                        '${spot.y.toInt()} m\n${spot.x.toStringAsFixed(1)} km',
                        TextStyle(
                          color: colorScheme.onInverseSurface,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                // Terrain profile (filled)
                LineChartBarData(
                  spots: terrainSpots,
                  isCurved: true,
                  curveSmoothness: 0.2,
                  preventCurveOverShooting: true,
                  color: colorScheme.primary,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorScheme.primary.withValues(alpha: 0.3),
                        colorScheme.primary.withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                ),
                // Line of sight (dashed)
                LineChartBarData(
                  spots: losSpots,
                  color: losObstructed ? colorScheme.error : Colors.green,
                  dashArray: [8, 4],
                  dotData: FlDotData(
                    getDotPainter: (spot, percent, bar, index) =>
                        FlDotCirclePainter(
                      radius: 4,
                      color: losObstructed ? colorScheme.error : Colors.green,
                      strokeWidth: 2,
                      strokeColor: colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Stats
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: l10n.repeaterDetailYourElevation,
                value: '${userPoint.elevationM.toInt()} m',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: l10n.repeaterDetailTotalDistance,
                value: '${profile.totalDistanceKm.toStringAsFixed(1)} km',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: l10n.repeaterDetailRepeaterElevation,
                value: '${repeaterPoint.elevationM.toInt()} m',
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isLosObstructed(AltimetricProfile profile) {
    if (profile.points.length < 3) return false;

    final first = profile.points.first;
    final last = profile.points.last;
    final totalDist = last.distanceKm - first.distanceKm;
    if (totalDist <= 0) return false;

    // Check each intermediate point against the LOS line
    for (var i = 1; i < profile.points.length - 1; i++) {
      final point = profile.points[i];
      final t = (point.distanceKm - first.distanceKm) / totalDist;
      final losElevation =
          first.elevationM + t * (last.elevationM - first.elevationM);

      if (point.elevationM > losElevation) {
        return true;
      }
    }
    return false;
  }

  double _calcInterval(double min, double max) {
    final range = max - min;
    if (range <= 0) return 1;

    final rawInterval = range / 5;
    final magnitude = pow(10, (log(rawInterval) / ln10).floor()).toDouble();
    final normalized = rawInterval / magnitude;

    double interval;
    if (normalized <= 1.5) {
      interval = magnitude;
    } else if (normalized <= 3.5) {
      interval = 2 * magnitude;
    } else if (normalized <= 7.5) {
      interval = 5 * magnitude;
    } else {
      interval = 10 * magnitude;
    }

    return max == min ? 1 : interval;
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
    this.dashed = false,
  });

  final Color color;
  final String label;
  final bool dashed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dashed)
          CustomPaint(
            size: const Size(20, 2),
            painter: _DashedLinePainter(color),
          )
        else
          Container(
            width: 20,
            height: 2,
            color: color,
          ),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0;
    const dashSpace = 3.0;
    var startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(min(startX + dashWidth, size.width), size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StatCard extends StatelessWidget {
  const _StatCard({
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
