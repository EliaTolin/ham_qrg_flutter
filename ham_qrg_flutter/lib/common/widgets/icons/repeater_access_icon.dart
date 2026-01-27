import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';

/// A widget that displays a repeater icon with colored segments
/// representing each access mode.
class RepeaterAccessIcon extends StatelessWidget {
  /// Creates a RepeaterAccessIcon from a list of RepeaterAccess.
  const RepeaterAccessIcon({
    required this.accesses,
    this.size = 56,
    this.iconSize,
    this.backgroundColor,
    super.key,
  }) : modes = null;

  /// Creates a RepeaterAccessIcon from a list of AccessMode enums.
  const RepeaterAccessIcon.fromModes({
    required List<AccessMode> this.modes,
    this.size = 56,
    this.iconSize,
    this.backgroundColor,
    super.key,
  }) : accesses = const [];

  final List<RepeaterAccess> accesses;
  final List<AccessMode>? modes;
  final double size;
  final double? iconSize;
  final Color? backgroundColor;

  List<AccessMode> get _accessModes {
    if (modes != null && modes!.isNotEmpty) return modes!;
    return accesses.map((a) => a.mode).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    final accessModes = _accessModes;
    final effectiveIconSize = iconSize ?? size * 0.45;
    final bgColor = backgroundColor ?? const Color(0xFF1F2937);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _AccessModeSegmentsPainter(
          modes: accessModes,
          backgroundColor: bgColor,
        ),
        child: Center(
          child: Icon(
            Icons.cell_tower_rounded,
            size: effectiveIconSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Returns the primary color for the accesses (first access mode color).
  /// Useful for badges or other UI elements that need a single color.
  static Color getPrimaryColor(List<RepeaterAccess> accesses) {
    if (accesses.isEmpty) return const Color(0xFF6B7280);
    return AccessModeHelper.getAccessModeColorObject(accesses.first.mode);
  }

  /// Returns the primary color from a list of AccessMode enums.
  static Color getPrimaryColorFromModes(List<AccessMode> modes) {
    if (modes.isEmpty) return const Color(0xFF6B7280);
    return AccessModeHelper.getAccessModeColorObject(modes.first);
  }
}

class _AccessModeSegmentsPainter extends CustomPainter {
  _AccessModeSegmentsPainter({
    required this.modes,
    required this.backgroundColor,
  });

  final List<AccessMode> modes;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    const outerRingWidth = 3.0;
    const segmentStrokeWidth = 4.0;
    const gapBetweenRings = 2.0;

    // Draw outer gray ring
    final outerRingPaint = Paint()
      ..color = const Color(0xFF374151)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRingWidth;
    canvas.drawCircle(
      center,
      outerRadius - outerRingWidth / 2,
      outerRingPaint,
    );

    // Calculate inner circle radius
    final innerRadius = outerRadius - outerRingWidth - gapBetweenRings;

    // Draw background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, innerRadius, bgPaint);

    // Draw colored segments on the inner circle border
    final segmentRadius = innerRadius - segmentStrokeWidth / 2;

    if (modes.isNotEmpty) {
      final uniqueModes = modes.toSet().toList();
      final segmentAngle = (2 * math.pi) / uniqueModes.length;
      const startAngle = -math.pi / 2; // Start from top
      // Gap between segments (smaller for single segment)
      final gapAngle = uniqueModes.length == 1 ? 0.0 : 0.08;

      for (var i = 0; i < uniqueModes.length; i++) {
        final mode = uniqueModes[i];
        final color = AccessModeHelper.getAccessModeColorObject(mode);

        final segmentPaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = segmentStrokeWidth
          ..strokeCap = StrokeCap.round;

        final rect = Rect.fromCircle(center: center, radius: segmentRadius);
        final sweep = segmentAngle - gapAngle;
        canvas.drawArc(
          rect,
          startAngle + (i * segmentAngle) + gapAngle / 2,
          sweep,
          false,
          segmentPaint,
        );
      }
    } else {
      // Default gray border if no access modes
      final defaultPaint = Paint()
        ..color = const Color(0xFF6B7280)
        ..style = PaintingStyle.stroke
        ..strokeWidth = segmentStrokeWidth;
      canvas.drawCircle(center, segmentRadius, defaultPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _AccessModeSegmentsPainter oldDelegate) {
    return modes != oldDelegate.modes || backgroundColor != oldDelegate.backgroundColor;
  }
}
