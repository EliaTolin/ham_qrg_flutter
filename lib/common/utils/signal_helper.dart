import 'package:flutter/material.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Predicted-signal strength buckets, derived from the received level (dBm).
/// Thresholds are tuned for amateur FM/digital voice on VHF/UHF.
enum SignalLevel { none, marginal, weak, fair, good, excellent }

/// Maps a received signal level (dBm) to display primitives: number of bars
/// (0–5), a semantic color and a short human label. Centralised so the hero,
/// list, map and badge all speak the same language.
abstract final class SignalHelper {
  static const maxBars = 5;

  static SignalLevel levelFromDbm(double dbm) {
    if (dbm >= -85) return SignalLevel.excellent;
    if (dbm >= -95) return SignalLevel.good;
    if (dbm >= -105) return SignalLevel.fair;
    if (dbm >= -112) return SignalLevel.weak;
    if (dbm >= -120) return SignalLevel.marginal;
    return SignalLevel.none;
  }

  static int barsFromDbm(double dbm) => switch (levelFromDbm(dbm)) {
        SignalLevel.excellent => 5,
        SignalLevel.good => 4,
        SignalLevel.fair => 3,
        SignalLevel.weak => 2,
        SignalLevel.marginal => 1,
        SignalLevel.none => 0,
      };

  /// Semantic green→red scale (signal strength is inherently a quality scale;
  /// these are the design system's success/warning/error tokens).
  static Color colorFromDbm(double dbm) => switch (levelFromDbm(dbm)) {
        SignalLevel.excellent => AppColors.success,
        SignalLevel.good => AppColors.successLight,
        SignalLevel.fair => AppColors.warning,
        SignalLevel.weak => AppColors.warning,
        SignalLevel.marginal => AppColors.error,
        SignalLevel.none => AppColors.error,
      };

  static String dbmLabel(double dbm) => '${dbm.round()} dBm';
}
