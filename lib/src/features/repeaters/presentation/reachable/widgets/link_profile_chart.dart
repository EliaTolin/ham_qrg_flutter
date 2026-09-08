import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/signal_helper.dart';
import 'package:hamqrg/common/widgets/signal/signal_bars.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';

/// Cross-section of the terrain between the user and a repeater, with the
/// straight RF line-of-sight drawn over it — the "wow" technical view. The
/// header shows the predicted received signal (dBm + bars).
class LinkProfileChart extends StatelessWidget {
  const LinkProfileChart({
    required this.link,
    this.txHeightM = 30,
    this.rxHeightM = 2,
    super.key,
  });

  final LinkProfile link;
  final double txHeightM;
  final double rxHeightM;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final points = link.points;
    if (points.length < 2) {
      return const SizedBox.shrink();
    }

    final terrain = [
      for (final p in points) FlSpot(p.distanceKm, p.groundM),
    ];
    // Antenna feet: TX (repeater) at start, RX (user) at end.
    final losStart = points.first.groundM + txHeightM;
    final losEnd = points.last.groundM + rxHeightM;
    final maxDist = points.last.distanceKm;
    final los = [FlSpot(0, losStart), FlSpot(maxDist, losEnd)];

    final groundMax =
        points.map((p) => p.groundM).reduce((a, b) => a > b ? a : b);
    final groundMin =
        points.map((p) => p.groundM).reduce((a, b) => a < b ? a : b);
    final maxY =
        [groundMax, losStart, losEnd].reduce((a, b) => a > b ? a : b) * 1.1;
    final minY = (groundMin * 0.9).clamp(0, double.infinity).toDouble();

    final signalColor = SignalHelper.colorFromDbm(link.dbm);
    final terrainColor = theme.colorScheme.onSurface.withValues(alpha: 0.55);
    final obstructionColor = theme.colorScheme.error;

    // Terrain points rising above the straight line of sight = obstacles.
    final obstruction = <FlSpot>[];
    for (final p in points) {
      final losAt = maxDist == 0
          ? losStart
          : losStart + (losEnd - losStart) * (p.distanceKm / maxDist);
      if (p.groundM > losAt) obstruction.add(FlSpot(p.distanceKm, p.groundM));
    }
    final isObstructed = obstruction.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SignalBars(dbm: link.dbm, maxHeight: 20),
            const SizedBox(width: 10),
            Text(
              SignalHelper.dbmLabel(link.dbm),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: signalColor,
              ),
            ),
            const Spacer(),
            Text(
              '${context.units.distanceFromKm(link.distanceKm)} · '
              '${link.azimuthDeg.round()}°',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: maxDist,
              minY: minY,
              maxY: maxY,
              gridData: FlGridData(
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 38,
                    getTitlesWidget: (v, meta) => Text(
                      '${v.round()}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (v, meta) => Text(
                      '${v.round()}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // Terrain cross-section (filled).
                LineChartBarData(
                  spots: terrain,
                  isCurved: true,
                  barWidth: 1.5,
                  color: terrainColor,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: terrainColor.withValues(alpha: 0.25),
                  ),
                ),
                // RF line of sight.
                LineChartBarData(
                  spots: los,
                  color: signalColor,
                  dashArray: [6, 4],
                  dotData: const FlDotData(show: false),
                ),
                // Obstacles: terrain rising above the line of sight, in red.
                if (obstruction.isNotEmpty)
                  LineChartBarData(
                    spots: obstruction,
                    barWidth: 0,
                    color: obstructionColor,
                    dotData: FlDotData(
                      getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                        radius: 2.5,
                        color: obstructionColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              isObstructed ? Icons.terrain_rounded : Icons.visibility_rounded,
              size: 16,
              color: isObstructed ? obstructionColor : signalColor,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                isObstructed
                    ? l10n.linkProfileObstructed
                    : l10n.linkProfileClear,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isObstructed ? obstructionColor : signalColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          l10n.linkProfileCaption(
            context.units.elevation(txHeightM),
            context.units.elevation(rxHeightM),
          ),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }
}
