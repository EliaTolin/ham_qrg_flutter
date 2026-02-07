/// Amateur radio frequency bands.
///
/// Each band defines its frequency range in Hz and a display label.
enum FrequencyBand {
  m10(
    label: '10m',
    minHz: 28000000,
    maxHz: 29700000,
  ),
  m6(
    label: '6m',
    minHz: 50000000,
    maxHz: 54000000,
  ),
  m4(
    label: '4m',
    minHz: 70000000,
    maxHz: 70500000,
  ),
  m2(
    label: '2m',
    minHz: 144000000,
    maxHz: 148000000,
  ),
  m1_25(
    label: '1.25m',
    minHz: 219000000,
    maxHz: 225000000,
  ),
  cm70(
    label: '70cm',
    minHz: 420000000,
    maxHz: 450000000,
  ),
  gmrs(
    label: 'GMRS',
    minHz: 462550000,
    maxHz: 467725000,
  ),
  cm33(
    label: '33cm',
    minHz: 902000000,
    maxHz: 928000000,
  ),
  cm23(
    label: '23cm',
    minHz: 1240000000,
    maxHz: 1300000000,
  ),
  cm13plus(
    label: '13cm+',
    minHz: 2300000000,
    maxHz: 2450000000,
  );

  const FrequencyBand({
    required this.label,
    required this.minHz,
    required this.maxHz,
  });

  final String label;
  final int minHz;
  final int maxHz;

  /// Returns `true` if [frequencyHz] falls within this band's range.
  bool contains(int frequencyHz) => frequencyHz >= minHz && frequencyHz <= maxHz;

  /// Finds the band that contains [frequencyHz], or `null` if none matches.
  static FrequencyBand? fromFrequency(int frequencyHz) {
    for (final band in values) {
      if (band.contains(frequencyHz)) return band;
    }
    return null;
  }
}
