import 'package:hamqrg/src/features/repeaters/data/repository/coverage_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/coverage/repeater_coverage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_coverage_provider.g.dart';

/// Default transmitter assumptions used when the repeater record does not
/// carry power/antenna data (the current schema has neither). Tuned for a
/// typical VHF/UHF amateur repeater. The coverage radius is decided by the
/// service (so it can be tuned without an app release).
const _defaultTxHeightM = 30.0; // antenna AGL, meters
const _defaultTxPowerDbm = 40.0; // 40 dBm = 10 W

@riverpod
Future<RepeaterCoverage> getRepeaterCoverage(
  Ref ref, {
  required String repeaterId,
  required double lat,
  required double lon,
  required int frequencyHz,
}) async {
  final repository = ref.read(coverageRepositoryProvider);
  return repository.getCoverage(
    lat: lat,
    lon: lon,
    frequencyMhz: frequencyHz / 1000000.0,
    txHeightM: _defaultTxHeightM,
    txPowerDbm: _defaultTxPowerDbm,
    repeaterId: repeaterId,
  );
}
