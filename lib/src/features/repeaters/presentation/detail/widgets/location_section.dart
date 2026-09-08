import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_location_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSection extends ConsumerWidget {
  const LocationSection({
    required this.repeater,
    this.calculatedDistanceKm,
    super.key,
  });

  final Repeater repeater;
  final double? calculatedDistanceKm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    // Il profilo altimetrico è calcolato dal backend: offline la card sparisce.
    final isOffline = ref.watch(offlineStatusProvider).value ?? false;

    final effectiveDistanceMeters = repeater.distanceMeters ??
        (calculatedDistanceKm != null ? calculatedDistanceKm! * 1000 : null);

    final distanceText = effectiveDistanceMeters != null
        ? context.units.distance(effectiveDistanceMeters)
        : null;

    final hasCoordinates =
        repeater.latitude != null && repeater.longitude != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 12),
        // Mini map card with feedback action
        GestureDetector(
          onTap: hasCoordinates
              ? () => context.router.push(
                    RepeaterDetailMapRoute(repeaterId: repeater.id),
                  )
              : null,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.12),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                RepeaterLocationMap(repeater: repeater),
                // Locality / locator / distance row
                if (repeater.locality != null ||
                    repeater.locator != null ||
                    distanceText != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    color: colorScheme.surfaceContainerHighest,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            [
                              repeater.locality,
                              repeater.locator,
                            ].whereType<String>().join(' \u2022 '),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        if (distanceText != null) ...[
                          const SizedBox(width: 8),
                          Icon(
                            Icons.straighten,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            distanceText,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                // Feedback map action
                if (hasCoordinates)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: colorScheme.outline.withValues(alpha: 0.08),
                        ),
                      ),
                      color: colorScheme.surfaceContainerHighest,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.explore,
                            size: 18,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.repeaterDetailViewFeedbackMap,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                l10n.repeaterDetailViewFeedbackMapSubtitle,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        // Altimetric profile preview card
        if (hasCoordinates && !isOffline) ...[
          const SizedBox(height: 16),
          _AltimetricProfilePreviewCard(
            onTap: () => _showAltimetricProfile(context),
          ),
        ],
      ],
    );
  }

  void _showAltimetricProfile(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AltimetricProfileBottomSheet(
        repeaterLat: repeater.latitude!,
        repeaterLon: repeater.longitude!,
      ),
    );
  }
}

class _AltimetricProfilePreviewCard extends StatelessWidget {
  const _AltimetricProfilePreviewCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 10, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.terrain,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.repeaterDetailAltimetricProfile,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            // Terrain preview
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 4),
              child: Text(
                l10n.repeaterDetailAltimetricProfileSubtitle,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(
              height: 90,
              width: double.infinity,
              child: CustomPaint(
                painter: _TerrainPreviewPainter(
                  terrainColor: colorScheme.primary,
                  fillStartColor: colorScheme.primary.withValues(alpha: 0.35),
                  fillEndColor: colorScheme.primary.withValues(alpha: 0.03),
                  losColor: Colors.green.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TerrainPreviewPainter extends CustomPainter {
  _TerrainPreviewPainter({
    required this.terrainColor,
    required this.fillStartColor,
    required this.fillEndColor,
    required this.losColor,
  });

  final Color terrainColor;
  final Color fillStartColor;
  final Color fillEndColor;
  final Color losColor;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Terrain path — user at left (low), mountain in center, repeater at right
    final terrainPath = Path()
      ..moveTo(0, h * 0.72)
      ..cubicTo(
        w * 0.08,
        h * 0.65,
        w * 0.12,
        h * 0.55,
        w * 0.18,
        h * 0.52,
      )
      ..cubicTo(
        w * 0.24,
        h * 0.49,
        w * 0.28,
        h * 0.58,
        w * 0.33,
        h * 0.50,
      )
      ..cubicTo(
        w * 0.38,
        h * 0.42,
        w * 0.43,
        h * 0.18,
        w * 0.52,
        h * 0.12,
      )
      ..cubicTo(
        w * 0.61,
        h * 0.18,
        w * 0.66,
        h * 0.32,
        w * 0.72,
        h * 0.38,
      )
      ..cubicTo(
        w * 0.78,
        h * 0.44,
        w * 0.82,
        h * 0.36,
        w * 0.88,
        h * 0.32,
      )
      ..cubicTo(
        w * 0.93,
        h * 0.28,
        w * 0.97,
        h * 0.34,
        w,
        h * 0.38,
      );

    // Fill under terrain
    final fillPath = Path.from(terrainPath)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [fillStartColor, fillEndColor],
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawPath(fillPath, fillPaint);

    // Terrain line
    final linePaint = Paint()
      ..color = terrainColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(terrainPath, linePaint);

    // Line of sight (dashed)
    final losStart = Offset(0, h * 0.72);
    final losEnd = Offset(w, h * 0.38);
    _drawDashedLine(canvas, losStart, losEnd);

    // Endpoint dots
    final dotPaint = Paint()..color = terrainColor;
    final dotBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas
      ..drawCircle(losStart, 4, dotPaint)
      ..drawCircle(losStart, 4, dotBorderPaint)
      ..drawCircle(losEnd, 4, dotPaint)
      ..drawCircle(losEnd, 4, dotBorderPaint);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end) {
    final paint = Paint()
      ..color = losColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final distance = math.sqrt(dx * dx + dy * dy);
    const dashLen = 6.0;
    const gapLen = 4.0;
    final unitX = dx / distance;
    final unitY = dy / distance;

    var drawn = 0.0;
    while (drawn < distance) {
      final dashEnd = math.min(drawn + dashLen, distance);
      canvas.drawLine(
        Offset(start.dx + unitX * drawn, start.dy + unitY * drawn),
        Offset(start.dx + unitX * dashEnd, start.dy + unitY * dashEnd),
        paint,
      );
      drawn += dashLen + gapLen;
    }
  }

  @override
  bool shouldRepaint(covariant _TerrainPreviewPainter oldDelegate) =>
      terrainColor != oldDelegate.terrainColor ||
      losColor != oldDelegate.losColor;
}
