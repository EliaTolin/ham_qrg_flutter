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

/// **`watch` e non `read`**: il datasource è costruito attorno a
/// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
/// della costruzione**. Letto con `read`, questo repository resterebbe
/// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
/// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
/// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
/// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
/// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
/// repository si ricostruisce da sé quando i flag si assestano, e le query
/// che lo osservano ripartono da sole.
@riverpod
CoverageRepository coverageRepository(Ref ref) {
  return CoverageRepository(ref.watch(coverageDatasourceProvider));
}
