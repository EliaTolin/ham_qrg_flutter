import 'dart:math';

/// Parses a user query as a frequency in MHz and returns
/// the corresponding Hz range `(minHz, maxHz)`.
///
/// Returns `null` when [query] does not look like a valid frequency.
///
/// The precision of the range depends on the number of decimal places:
/// - `"145"`     → 145 000 000 – 145 999 999
/// - `"145.6"`   → 145 600 000 – 145 699 999
/// - `"145.600"` → 145 600 000 – 145 600 999
({int minHz, int maxHz})? parseFrequencyRange(String query) {
  final freqRegex = RegExp(r'^\d{1,4}(\.\d{1,6})?$');
  if (!freqRegex.hasMatch(query)) return null;

  final mhz = double.tryParse(query);
  if (mhz == null || mhz < 1 || mhz >= 10000) return null;

  final decimals = query.contains('.') ? query.split('.')[1].length : 0;
  final stepHz = pow(10, 6 - decimals).toInt();
  final minHz = (mhz * 1000000).round();
  final maxHz = minHz + stepHz - 1;

  return (minHz: minHz, maxHz: maxHz);
}
