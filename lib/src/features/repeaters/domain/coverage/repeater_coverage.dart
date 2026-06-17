import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_coverage.freezed.dart';

/// Geographic bounds of a coverage overlay image (signed degrees).
@freezed
abstract class CoverageBounds with _$CoverageBounds {
  const factory CoverageBounds({
    required double north,
    required double south,
    required double east,
    required double west,
  }) = _CoverageBounds;
}

/// One entry of the signal legend (dBm -> hex color).
@freezed
abstract class CoverageLegendStop with _$CoverageLegendStop {
  const factory CoverageLegendStop({
    required double dbm,
    required String color,
  }) = _CoverageLegendStop;
}

/// RF coverage prediction for a repeater: a PNG overlay (by URL) plus the
/// geographic bounds it spans, ready to drape on the map.
@freezed
abstract class RepeaterCoverage with _$RepeaterCoverage {
  const factory RepeaterCoverage({
    required CoverageBounds bounds,
    required int width,
    required int height,
    required String imageUrl,
    @Default([]) List<CoverageLegendStop> legend,
  }) = _RepeaterCoverage;
}
