import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

/// Helper class for formatting repeater-related data
class RepeaterFormatHelper {
  /// Formats a repeater for sharing
  ///
  /// Returns a formatted string with callsign, frequency, location and app link.
  static String formatShareMessage(Repeater repeater, String appMessage) {
    final buffer = StringBuffer();

    // Callsign/Name
    final name = repeater.callsign ?? repeater.name ?? 'Repeater';
    buffer.writeln(name);

    // Frequency
    final frequency = formatFrequency(repeater.frequencyHz);
    buffer.writeln(frequency);

    // Location if available
    final location = [repeater.locality, repeater.region]
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .join(', ');
    if (location.isNotEmpty) {
      buffer.writeln(location);
    }

    // App message
    buffer
      ..writeln()
      ..write(appMessage);

    return buffer.toString();
  }

  /// Formats frequency in Hz to a human-readable string
  ///
  /// MHz: 4 decimals if the 4th decimal is non‑zero, otherwise 3.
  /// Examples:
  /// - 145625000 -> "145.625 MHz" (ends with 0)
  /// - 145632500 -> "145.6325 MHz" (ends with 5)
  /// - 145625 -> "145.6 kHz"
  /// - 145 -> "145 Hz"
  static String formatFrequency(int frequencyHz) {
    if (frequencyHz >= 1000000) {
      // MHz
      final mhz = frequencyHz ~/ 1000000;
      final remainderHz = frequencyHz % 1000000;

      // parte decimale fino a 6 cifre (precisione Hz)
      var decimals = remainderHz.toString().padLeft(6, '0');

      // rimuove zeri finali ma mantiene almeno 3 decimali
      while (decimals.length > 3 && decimals.endsWith('0')) {
        decimals = decimals.substring(0, decimals.length - 1);
      }

      return '$mhz.$decimals MHz';
    }

    if (frequencyHz >= 1000) {
      // kHz
      final khz = frequencyHz ~/ 1000;
      final remainderHz = frequencyHz % 1000;

      final decimals = remainderHz.toString().padLeft(3, '0');
      return '$khz.$decimals kHz';
    }

    // Hz
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

  /// Formats a CTCSS (Continuous Tone-Coded Squelch System) frequency in hertz.
  ///
  /// Returns a string representation with one decimal place and the "Hz" suffix,
  /// for example: 88.5 -> "88.5 Hz". If [ctcssHz] is null, returns "-".
  static String formatCtcss(double? ctcssHz) {
    if (ctcssHz != null) {
      return '${ctcssHz.toStringAsFixed(1)} Hz';
    }
    return '-';
  }

  /// Formats a shift in hertz to a human-readable string.
  ///
  /// Returns a string representation with one decimal place and the "kHz" suffix,
  /// for example: 1000 -> "1.0 kHz". If [shiftHz] is null, returns "-".
  static String formatShift(int? shiftHz, String? shiftRaw) {
    if (shiftRaw != null && shiftRaw.isNotEmpty) {
      return shiftRaw;
    }
    if (shiftHz != null) {
      if (shiftHz >= 1000) {
        return '${(shiftHz / 1000).toStringAsFixed(1)} kHz';
      }
      return '$shiftHz Hz';
    }
    return '-';
  }
}
