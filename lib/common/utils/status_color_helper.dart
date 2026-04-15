import 'package:flutter/material.dart';

/// Maps a semantic status to theme-aware colors.
/// Use for health scores, report statuses, feedback indicators, etc.
class StatusColorHelper {
  StatusColorHelper._();

  /// Positive status (like, good health, resolved, LOS clear).
  static Color positive(ColorScheme colorScheme) => colorScheme.tertiary;

  /// Warning status (amber/fair, pending, distance warning).
  static Color warning(ColorScheme colorScheme) => colorScheme.error;

  /// Negative status (down-report, rejected).
  static Color negative(ColorScheme colorScheme) => colorScheme.error;

  /// Neutral/info status (reviewed, informational).
  static Color info(ColorScheme colorScheme) => colorScheme.primary;

  /// Muted/inactive status (to verify, unknown).
  static Color muted(ColorScheme colorScheme) => colorScheme.outlineVariant;
}
