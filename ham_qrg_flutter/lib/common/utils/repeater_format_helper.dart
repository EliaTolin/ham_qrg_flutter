/// Helper class for formatting repeater-related data
class RepeaterFormatHelper {
  /// Formats frequency in Hz to a human-readable string
  ///
  /// Examples:
  /// - 145625000 -> "145.625 MHz"
  /// - 145625 -> "145.6 kHz"
  /// - 145 -> "145 Hz"
  static String formatFrequency(int frequencyHz) {
    if (frequencyHz >= 1000000) {
      return '${(frequencyHz / 1000000).toStringAsFixed(3)} MHz';
    } else if (frequencyHz >= 1000) {
      return '${(frequencyHz / 1000).toStringAsFixed(1)} kHz';
    }
    return '$frequencyHz Hz';
  }

  /// Formats distance in meters to a human-readable string
  ///
  /// Examples:
  /// - 12000 -> "12.0km away"
  /// - 500 -> "500m away"
  /// - null -> ""
  static String formatDistance(double? distanceMeters) {
    if (distanceMeters == null) return '';
    if (distanceMeters < 1000) {
      return '${distanceMeters.toStringAsFixed(0)}m away';
    }
    return '${(distanceMeters / 1000).toStringAsFixed(1)}km away';
  }
}
