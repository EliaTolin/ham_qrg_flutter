import 'package:flutter/material.dart';

/// App Color Palette based on the new design system
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF13C8EC); // Cyan/Azzurro principale
  static const Color primaryDark = Color(0xFF0FA5C4);
  static const Color primaryLight = Color(0xFF4DD5F0);

  static const Color secondary = Color(0xFF1A5FFF); // Purple-500
  static const Color secondaryDark =
      Color.fromARGB(255, 13, 74, 158); // Violet-500
  static const Color secondaryLight =
      Color.fromARGB(255, 100, 184, 255); // Pink-500

  // Background Colors
  static const Color backgroundLight = Color(0xFFF6F8F8);
  static const Color backgroundDark = Color(0xFF101F22);

  // Surface Colors (Dark Mode)
  static const Color surfaceDark = Color(0xFF162629);
  static const Color surfaceHighlight = Color(0xFF1E3236);
  static const Color surfaceCardDark = Color(0xFF1C2527);
  static const Color surfaceElevatedDark = Color(0xFF283639);
  static const Color surfaceHoverDark = Color(0xFF34454A);

  // Surface Colors (Light Mode)
  static const Color surfaceLight = Colors.white;
  static const Color surfaceCardLight = Color(0xFFF9FAFA);

  // Text Colors (Dark Mode)
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFF9DB4B9);
  static const Color textTertiaryDark = Color(0xFF5F7478);
  static const Color textQuaternaryDark = Color(0xFF384B4F);

  // Text Colors (Light Mode)
  static const Color textPrimaryLight = Color(0xFF1E293B); // slate-800
  static const Color textSecondaryLight = Color(0xFF64748B); // slate-500
  static const Color textTertiaryLight = Color(0xFF94A3B8); // slate-400

  // Border Colors
  static const Color borderLight = Color(0xFFE2E8F0); // slate-200
  static const Color borderDark = Color(0x1AFFFFFF); // white/10

  // Status Colors
  static const Color success = Color(0xFF10B981); // green-500
  static const Color successLight = Color(0xFF34D399); // green-400
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color info = Color(0xFF3B82F6); // blue-500

  // Repeater Mode Colors
  static const Color modeAnalog = Color(0xFF13C8EC); // primary cyan
  static const Color modeDMR = Color(0xFFA855F7); // purple-500
  static const Color modeDStar = Color(0xFF10B981); // green-500
  static const Color modeC4FM = Color(0xFFF97316); // orange-500
  static const Color modeAllMode = Color(0xFF6366F1); // indigo-500
  static const Color modeEcholink = Color(0xFFEC4899); // pink-500
  static const Color modeAllStar = Color(0xFF22C55E); // green-500
  static const Color modeWinlink = Color(0xFF8B5CF6); // violet-500

  // Favorite/Heart Color
  static const Color favorite = Color(0xFFEF4444); // red-500
  static const Color favoriteLight = Color(0xFFFCA5A5); // red-300

  // HamQRG Pro accent. Brand-specific (exception analogous to the mode colors):
  // the "Pro" gold is not representable via theme.colorScheme.
  static const Color proGold = Color(0xFFD4AF37); // metallic gold
  static const Color proGoldLight = Color(0xFFF1D27A);
}

/// SOTA points trophy palette. Brand-specific (exception analogous to
/// repeater mode colors): not representable via theme.colorScheme.
class SotaPointsColors {
  SotaPointsColors._();

  static const Color tier1 = Color(0xFF94A3B8); // slate-400
  static const Color tier2 = Color(0xFF64748B); // slate-500
  static const Color tier4 = Color(0xFF16A34A); // green-600
  static const Color tier6 = Color(0xFFD97706); // amber-600
  static const Color tier8 = Color(0xFFEA580C); // orange-600
  static const Color tier10 = Color(0xFFCA8A04); // yellow-700 (gold)

  /// Returns the closest tier color for a given SOTA points value
  /// (1, 2, 4, 6, 8, 10). Non-standard values are rounded down.
  static Color forPoints(int points) {
    if (points >= 10) return tier10;
    if (points >= 8) return tier8;
    if (points >= 6) return tier6;
    if (points >= 4) return tier4;
    if (points >= 2) return tier2;
    return tier1;
  }
}

/// SOTA summit altitude bands for map markers. Brand-specific.
class SotaAltitudeColors {
  SotaAltitudeColors._();

  static const Color low = Color(0xFF16A34A); // green-600 (<1000 m)
  static const Color mid = Color(0xFFD97706); // amber-600 (1000–2000 m)
  static const Color high = Color(0xFF3B82F6); // blue-500 (>2000 m)

  static Color forAltitudeM(int meters) {
    if (meters >= 2000) return high;
    if (meters >= 1000) return mid;
    return low;
  }
}
