import 'package:flutter/material.dart';

/// Returns a theme-aware color based on the age of a spot.
/// - Fresh (< 5 min): green (tertiary)
/// - Recent (< 15 min): warning/amber (error container tint)
/// - Stale: muted (outline variant)
Color freshnessColor(Duration age, ColorScheme colorScheme) {
  if (age.inMinutes < 5) return colorScheme.tertiary;
  if (age.inMinutes < 15) return colorScheme.error;
  return colorScheme.outlineVariant;
}
