import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart';

/// Reusable altimetric profile chart with line-of-sight overlay.
///
/// Used by both repeater detail (bottom sheet) and SOTA spot detail (inline
/// Summit Pursuit section). All visual styling derives from the active theme;
/// no hardcoded colors. The caller supplies localized labels for endpoints,
/// legend and stat cards so the widget itself stays l10n-agnostic and reusable.
///
/// Convention: the underlying [AltimetricProfile.points] is produced with
/// `points[0]` = destination (repeater/summit) and `points[last]` = observer.
/// The chart reverses the X axis to display observer on the left (x=0) and
/// destination on the right (x=totalDistanceKm) — the natural reading order
/// for a radio user evaluating a path.
class AltimetricProfileChart extends StatelessWidget {
  const AltimetricProfileChart({
    required this.profile,
    required this.sourceLabel,
    required this.destinationLabel,
    required this.sourceElevationLabel,
    required this.totalDistanceLabel,
    required this.destinationElevationLabel,
    required this.terrainLabel,
    required this.lineOfSightLabel,
    required this.losClearLabel,
    required this.losObstructedLabel,
    this.isObstructed,
    this.showLegend = true,
    this.showStats = true,
    this.chartHeight = 260,
    this.scrollController,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  final AltimetricProfile profile;

  final String sourceLabel;
  final String destinationLabel;
  final String sourceElevationLabel;
  final String totalDistanceLabel;
  final String destinationElevationLabel;
  final String terrainLabel;
  final String lineOfSightLabel;
  final String losClearLabel;
  final String losObstructedLabel;

  /// Optional precomputed LOS verdict (e.g. from SOTA classifier). If null,
  /// the widget computes a simple geometric verdict internally.
  final bool? isObstructed;

  final bool showLegend;
  final bool showStats;
  final double chartHeight;

  /// Optional scrollController for embedding inside a DraggableScrollableSheet.
  /// If null, the chart renders without internal scrolling.
  final ScrollController? scrollController;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (profile.points.isEmpty) {
      return Center(
        child: Text(
          '—',
          style: theme.textTheme.bodyMedium,
        ),
      );
    }

    // Reverse: source (observer) at left (x=0), destination at right (x=total)
    final totalDist = profile.totalDistanceKm;
    final terrainSpots = profile.points
        .map((p) => FlSpot(totalDist - p.distanceKm, p.elevationM))
        .toList()
      ..sort((a, b) => a.x.compareTo(b.x));

    final sourcePoint = profile.points.last;
    final destinationPoint = profile.points.first;
    final losSpots = [
      FlSpot(0, sourcePoint.elevationM),
      FlSpot(totalDist, destinationPoint.elevationM),
    ];

    final obstructed = isObstructed ?? _computeObstructed(profile);

    final elevations = profile.points.map((p) => p.elevationM);
    final minElevation = elevations.reduce(min);
    final maxElevation = elevations.reduce(max);
    final losMax = max(sourcePoint.elevationM, destinationPoint.elevationM);
    final yMax = max(maxElevation, losMax);
    final yPadding = max<double>((yMax - minElevation) * 0.15, 20);
    final yMin = max<double>(0, minElevation - yPadding);
    final yMaxFinal = yMax + yPadding;

    final losColor = obstructed ? colorScheme.error : colorScheme.tertiary;

    final children = <Widget>[
      _LosBadge(
        obstructed: obstructed,
        clearLabel: losClearLabel,
        obstructedLabel: losObstructedLabel,
      ),
      const SizedBox(height: 16),
      if (showLegend) ...[
        Row(
          children: [
            _LegendItem(color: colorScheme.primary, label: terrainLabel),
            const SizedBox(width: 16),
            _LegendItem(
              color: losColor,
              label: lineOfSightLabel,
              dashed: true,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
      SizedBox(
        height: chartHeight,
        child: _Chart(
          terrainSpots: terrainSpots,
          losSpots: losSpots,
          totalDist: totalDist,
          yMin: yMin,
          yMax: yMaxFinal,
          losColor: losColor,
          sourceLabel: sourceLabel,
          destinationLabel: destinationLabel,
        ),
      ),
      if (showStats) ...[
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: sourceElevationLabel,
                value: context.units.elevation(sourcePoint.elevationM),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: totalDistanceLabel,
                value: context.units.distanceFromKm(totalDist),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                label: destinationElevationLabel,
                value: context.units.elevation(destinationPoint.elevationM),
              ),
            ),
          ],
        ),
      ],
    ];

    if (scrollController != null) {
      return ListView(
        controller: scrollController,
        padding: padding,
        children: children,
      );
    }
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  bool _computeObstructed(AltimetricProfile profile) {
    if (profile.points.length < 3) return false;
    final first = profile.points.first;
    final last = profile.points.last;
    final totalDist = last.distanceKm - first.distanceKm;
    if (totalDist <= 0) return false;
    for (var i = 1; i < profile.points.length - 1; i++) {
      final point = profile.points[i];
      final t = (point.distanceKm - first.distanceKm) / totalDist;
      final losElevation =
          first.elevationM + t * (last.elevationM - first.elevationM);
      if (point.elevationM > losElevation) return true;
    }
    return false;
  }
}

class _LosBadge extends StatelessWidget {
  const _LosBadge({
    required this.obstructed,
    required this.clearLabel,
    required this.obstructedLabel,
  });

  final bool obstructed;
  final String clearLabel;
  final String obstructedLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final tone = obstructed ? colorScheme.error : colorScheme.tertiary;
    final bg = obstructed
        ? colorScheme.errorContainer.withValues(alpha: 0.5)
        : colorScheme.tertiary.withValues(alpha: 0.12);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: tone.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            obstructed ? Icons.visibility_off : Icons.visibility,
            size: 18,
            color: tone,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              obstructed ? obstructedLabel : clearLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: tone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    required this.terrainSpots,
    required this.losSpots,
    required this.totalDist,
    required this.yMin,
    required this.yMax,
    required this.losColor,
    required this.sourceLabel,
    required this.destinationLabel,
  });

  final List<FlSpot> terrainSpots;
  final List<FlSpot> losSpots;
  final double totalDist;
  final double yMin;
  final double yMax;
  final Color losColor;
  final String sourceLabel;
  final String destinationLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: totalDist,
        minY: yMin,
        maxY: yMax,
        clipData: const FlClipData.all(),
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: _calcInterval(yMin, yMax),
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
                      sourceLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
                if (value == meta.max) {
                  // Il nome del ripetitore è di lunghezza ignota: senza un
                  // tetto si allarga a cavallo del punto di arrivo e finisce
                  // sopra l'ultima etichetta di distanza.
                  return Padding(
                    padding: const EdgeInsets.only(top: 6, right: 4),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 96),
                      child: Text(
                        destinationLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
                // L'ultimo tick regolare cade a ridosso dell'arrivo: lì c'è
                // già il nome del ripetitore, e due etichette nello stesso
                // punto sono peggio di una sola.
                if (value > meta.max * 0.85) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    context.units.distanceFromKm(value),
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
              context.units.elevationSymbol,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 44,
              interval: _calcInterval(yMin, yMax),
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
                  '${context.units.elevation(spot.y)}\n'
                  '${context.units.distanceFromKm(spot.x)}',
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
          LineChartBarData(
            spots: losSpots,
            color: losColor,
            dashArray: [8, 4],
            dotData: FlDotData(
              getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                radius: 4,
                color: losColor,
                strokeWidth: 2,
                strokeColor: colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calcInterval(double minV, double maxV) {
    final range = maxV - minV;
    if (range <= 0) return 1;
    final rawInterval = range / 5;
    final magnitude = pow(10, (log(rawInterval) / ln10).floor()).toDouble();
    final normalized = rawInterval / magnitude;
    if (normalized <= 1.5) return magnitude;
    if (normalized <= 3.5) return 2 * magnitude;
    if (normalized <= 7.5) return 5 * magnitude;
    return 10 * magnitude;
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
          Container(width: 20, height: 2, color: color),
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
  const _StatCard({required this.label, required this.value});

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
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
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
