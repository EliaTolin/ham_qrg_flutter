import 'dart:developer';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

class RepeaterModeHelper {
  static final Map<String, Uint8List> _iconCache = {};
  static final Map<int, Uint8List> _clusterIconCache = {};

  /// Clears the icon caches. Call when the app theme changes or on memory pressure.
  static void clearCache() {
    _iconCache.clear();
    _clusterIconCache.clear();
  }

  /// Generates a unique key for a combination of access modes
  /// Used to cache and identify marker images
  static String getAccessModesKey(List<AccessMode> modes) {
    if (modes.isEmpty) return 'default';
    final sortedModes = modes.toList()..sort((a, b) => a.index.compareTo(b.index));
    return sortedModes.map((m) => m.name).join('-');
  }

  /// Generates a custom icon bitmap with colored segments for each access mode.
  /// Each access mode is represented as a colored arc segment on the border.
  /// Returns Uint8List representing a PNG image.
  static Future<Uint8List> generateRepeaterIconWithAccessModes(
    List<AccessMode> accessModes,
  ) async {
    final cacheKey = getAccessModesKey(accessModes);
    final cached = _iconCache[cacheKey];
    if (cached != null) {
      log('Using cached icon for $cacheKey');
      return cached;
    }
    log('Generating icon for $cacheKey');
    const size = 72.0;
    const iconSize = 32.0;
    const strokeWidth = 6.0;
    const radius = size / 2 - strokeWidth / 2 - 2;
    const center = Offset(size / 2, size / 2);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Dark background circle
    final bgPaint = Paint()
      ..color = const Color(0xFF1F2937) // Dark gray
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size / 2 - 2, bgPaint);

    // Draw colored segments for each access mode
    if (accessModes.isNotEmpty) {
      final uniqueModes = accessModes.toSet().toList();
      final segmentAngle = (2 * math.pi) / uniqueModes.length;
      const startAngle = -math.pi / 2; // Start from top

      for (var i = 0; i < uniqueModes.length; i++) {
        final mode = uniqueModes[i];
        final color = AccessModeHelper.getAccessModeColorObject(mode);

        final segmentPaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.butt;

        final rect = Rect.fromCircle(center: center, radius: radius);
        final sweep = segmentAngle - 0.02; // Small gap between segments
        canvas.drawArc(
          rect,
          startAngle + (i * segmentAngle),
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
        ..strokeWidth = strokeWidth;
      canvas.drawCircle(center, radius, defaultPaint);
    }

    // Draw cell tower icon
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.cell_tower_rounded.codePoint),
        style: TextStyle(
          fontFamily: Icons.cell_tower_rounded.fontFamily,
          package: Icons.cell_tower_rounded.fontPackage,
          fontSize: iconSize,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final iconOffset = Offset(
      (size - textPainter.width) / 2,
      (size - textPainter.height) / 2,
    );
    textPainter.paint(canvas, iconOffset);

    // Convert to image
    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();
    _iconCache[cacheKey] = bytes;
    return bytes;
  }

  /// Generates a cluster icon with the count of repeaters
  /// Returns Uint8List representing a PNG image
  static Future<Uint8List> generateClusterIcon(int count) async {
    final displayCount = count > 99 ? 100 : count;
    final cached = _clusterIconCache[displayCount];
    if (cached != null) return cached;

    const size = 72.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Draw outer circle with gradient-like effect (purple for clusters)
    final outerPaint = Paint()
      ..color = const Color(0xFF7C3AED) // Purple for clusters
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2 - 2,
      outerPaint,
    );

    // Draw white border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2 - 2,
      borderPaint,
    );

    // Draw count text
    final countText = count > 99 ? '99+' : count.toString();
    final textPainter = TextPainter(
      text: TextSpan(
        text: countText,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Center the text
    final textOffset = Offset(
      (size - textPainter.width) / 2,
      (size - textPainter.height) / 2,
    );

    textPainter.paint(canvas, textOffset);

    // Convert to image
    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();
    _clusterIconCache[displayCount] = bytes;
    return bytes;
  }
}
