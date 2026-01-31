import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

class AccessModeHelper {
  /// Returns the color associated with an access mode
  /// Colors are represented as ARGB integers (0xAARRGGBB)
  static int getAccessModeColor(AccessMode mode) {
    return switch (mode) {
      AccessMode.analog => 0xFF3B82F6, // Blue
      AccessMode.dmr => 0xFFA855F7, // Purple
      AccessMode.c4fm => 0xFF14B8A6, // Teal
      AccessMode.dstar => 0xFFFF6B35, // Orange
      AccessMode.echolink => 0xFFEC4899, // Pink
      AccessMode.svx => 0xFF10B981, // Green
      AccessMode.aprs => 0xFFF59E0B, // Amber
      AccessMode.beacon => 0xFF6366F1, // Indigo
      AccessMode.atv => 0xFFEF4444, // Red
      AccessMode.nxdn => 0xFF94A3B8, // Slate
    };
  }

  /// Returns the Flutter Color object for an access mode
  static Color getAccessModeColorObject(AccessMode mode) {
    return Color(getAccessModeColor(mode));
  }

  /// Returns the localized label for an access mode
  static String getAccessModeLabel(AccessMode mode) {
    return switch (mode) {
      AccessMode.analog => 'Analog',
      AccessMode.dmr => 'DMR',
      AccessMode.c4fm => 'C4FM',
      AccessMode.dstar => 'D-STAR',
      AccessMode.echolink => 'EchoLink',
      AccessMode.svx => 'SVX',
      AccessMode.aprs => 'APRS',
      AccessMode.beacon => 'Beacon',
      AccessMode.atv => 'ATV',
      AccessMode.nxdn => 'NXDN',
    };
  }

  /// Returns the icon for an access mode
  static IconData getAccessModeIcon(AccessMode mode) {
    return switch (mode) {
      AccessMode.analog => Icons.radio,
      AccessMode.dmr => Icons.cell_tower,
      AccessMode.c4fm => Icons.signal_cellular_alt,
      AccessMode.dstar => Icons.satellite_alt,
      AccessMode.echolink => Icons.phone,
      AccessMode.svx => Icons.router,
      AccessMode.aprs => Icons.map,
      AccessMode.beacon => Icons.light,
      AccessMode.atv => Icons.tv,
      AccessMode.nxdn => Icons.abc,
    };
  }
}
