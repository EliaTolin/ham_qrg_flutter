import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:ham_qrg/l10n/app_localizations.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';

class RepeaterModeHelper {
  /// Returns the color associated with a repeater mode
  /// Colors are represented as ARGB integers (0xAARRGGBB)
  static int getModeColor(RepeaterMode mode) {
    return switch (mode) {
      RepeaterMode.analog => 0xFF00C853, // Bright Green
      RepeaterMode.digital => 0xFF2962FF, // Vibrant Blue
      RepeaterMode.mixed => 0xFF00B8D4, // Bright Cyan
    };
  }

  /// Returns the Flutter Color object for a repeater mode
  static Color getModeColorObject(RepeaterMode mode) {
    return Color(getModeColor(mode));
  }

  /// Returns the localized label for a repeater mode
  static String getModeLabel(RepeaterMode mode, AppLocalizations l10n) {
    return switch (mode) {
      RepeaterMode.analog => l10n.repeaterModeAnalog,
      RepeaterMode.digital => 'Digital', // TODO: Add translation
      RepeaterMode.mixed => 'Mixed', // TODO: Add translation
    };
  }

  /// Generates a custom icon bitmap for a repeater mode using Icons.radio
  /// Returns Uint8List representing a PNG image
  static Future<Uint8List> generateRepeaterIcon(RepeaterMode mode) async {
    const size = 72.0;
    const iconSize = 44.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final color = getModeColorObject(mode);

    // Draw outer circle with color
    final outerPaint = Paint()
      ..color = color
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

    // Draw Icons.radio icon using TextPainter
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.radio.codePoint),
        style: TextStyle(
          fontFamily: Icons.radio.fontFamily,
          package: Icons.radio.fontPackage,
          fontSize: iconSize,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Center the icon
    final iconOffset = Offset(
      (size - textPainter.width) / 2,
      (size - textPainter.height) / 2,
    );

    textPainter.paint(canvas, iconOffset);

    // Convert to image
    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}
