import 'package:hamqrg/src/features/repeaters/data/model/coverage/repeater_coverage_model.dart';

abstract interface class CoverageDatasource {
  /// Requests a coverage map. The radius (and other RF parameters) are
  /// decided server-side; the app only sends the transmitter essentials.
  Future<RepeaterCoverageModel> getCoverage({
    required double lat,
    required double lon,
    required double frequencyMhz,
    required double txHeightM,
    required double txPowerDbm,
    String? repeaterId,
  });
}
