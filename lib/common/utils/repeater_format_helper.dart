import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
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
    buffer.writeln('📡 $name');

    // Frequency & Shift
    final frequency = formatFrequency(repeater.frequencyHz);
    final shift = formatShift(repeater.shiftHz, repeater.shiftRaw);
    buffer.writeln('📻 $frequency | Shift: $shift');

    // Location if available
    final location = [repeater.locality, repeater.region]
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .join(', ');
    if (location.isNotEmpty) {
      buffer.writeln('📍 $location');
    }

    // Access modes
    for (final access in repeater.accesses) {
      buffer.writeln('⚙️ ${_formatAccessSummary(access)}');
    }

    // App message
    buffer
      ..writeln()
      ..write(appMessage);

    return buffer.toString();
  }

  /// Formats a single access mode into a compact summary line.
  static String _formatAccessSummary(RepeaterAccess access) {
    final label = AccessModeHelper.getAccessModeLabel(access.mode);
    final parts = <String>[label];

    if (access.mode == AccessMode.analog) {
      if (access.ctcssTxHz != null) {
        parts.add('CTCSS Tx: ${access.ctcssTxHz!.toStringAsFixed(1)} Hz');
      }
      if (access.ctcssRxHz != null) {
        parts.add('CTCSS Rx: ${access.ctcssRxHz!.toStringAsFixed(1)} Hz');
      }
      if (access.dcsCode != null) {
        parts.add('DCS: ${access.dcsCode}');
      }
    } else if (access.mode == AccessMode.dmr) {
      if (access.colorCode != null) {
        parts.add('CC: ${access.colorCode}');
      }
      if (access.nodeId != null) {
        parts.add('Node ID: ${access.nodeId}');
      }
    } else {
      final nodeLabel = AccessModeHelper.getNodeIdLabel(access.mode);
      if (nodeLabel != null && access.nodeId != null) {
        parts.add('$nodeLabel: ${access.nodeId}');
      }
      if (access.dgId != null) {
        parts.add('DG-ID: ${access.dgId}');
      }
    }

    if (access.network != null) {
      parts.add('Rete: ${access.network!.name}');
    }

    return parts.join(' — ');
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
  /// Examples:
  /// - 7600000 -> "7.6 MHz"
  /// - 600000 -> "600.0 kHz"
  /// - 500 -> "500 Hz"
  /// - null -> "-"
  static String formatShift(int? shiftHz, String? shiftRaw) {
    if (shiftHz != null) {
      final abs = shiftHz.abs();
      if (abs >= 1000000) {
        return '${(shiftHz / 1000000).toStringAsFixed(1)} MHz';
      }
      if (abs >= 1000) {
        return '${(shiftHz / 1000).toStringAsFixed(1)} kHz';
      }
      return '$shiftHz Hz';
    }
    if (shiftRaw != null && shiftRaw.isNotEmpty) {
      return _stripTrailingZeros(shiftRaw);
    }
    return '-';
  }

  /// Strips trailing zeros from decimal numbers in a string.
  ///
  /// Examples:
  /// - "1.600000" -> "1.6"
  /// - "-7.6000" -> "-7.6"
  /// - "+1.0" -> "+1.0" (keeps at least one decimal)
  /// - "600" -> "600" (no decimal, unchanged)
  /// - "1.00" -> "1.0"
  static String _stripTrailingZeros(String value) {
    return value.replaceFirstMapped(
      RegExp(r'(\.\d+?)0+(\s|$)'),
      (m) => '${m[1]}${m[2]}',
    );
  }
}
