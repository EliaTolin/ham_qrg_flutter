import 'package:hamqrg/src/features/repeaters/data/datasource/coverage_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/coverage_http_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeater_coverage_mapper.dart';
import 'package:hamqrg/src/features/repeaters/domain/coverage/repeater_coverage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coverage_repository.g.dart';

class CoverageRepository {
  CoverageRepository(this._datasource);

  final CoverageDatasource _datasource;
  final _mapper = RepeaterCoverageMapper();

  Future<RepeaterCoverage> getCoverage({
    required double lat,
    required double lon,
    required double frequencyMhz,
    required double txHeightM,
    required double txPowerDbm,
    String? repeaterId,
  }) async {
    final model = await _datasource.getCoverage(
      lat: lat,
      lon: lon,
      frequencyMhz: frequencyMhz,
      txHeightM: txHeightM,
      txPowerDbm: txPowerDbm,
      repeaterId: repeaterId,
    );
    return _mapper.fromModel(model);
  }
}

@riverpod
CoverageRepository coverageRepository(Ref ref) {
  return CoverageRepository(ref.read(coverageDatasourceProvider));
}
