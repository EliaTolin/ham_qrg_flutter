import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_http_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/reachable_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/reachable/reachable_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reachable_repository.g.dart';

class ReachableRepository {
  ReachableRepository(this._datasource);

  final ReachableDatasource _datasource;
  final _mapper = ReachableMapper();

  /// Raw reachability outcomes for [candidates] (sorted by signal server-side).
  Future<List<ReachableRepeaterModel>> getReachable({
    required double lat,
    required double lon,
    required List<ReachableCandidate> candidates,
    double rxHeightM = 2,
  }) async {
    final response = await _datasource.getReachable(
      lat: lat,
      lon: lon,
      candidates: candidates,
      rxHeightM: rxHeightM,
    );
    return response.reachable;
  }

  /// Full link (with terrain profile) to a single repeater.
  Future<LinkProfile> getLink({
    required double lat,
    required double lon,
    required ReachableCandidate candidate,
    double rxHeightM = 2,
  }) async {
    final model = await _datasource.getLink(
      lat: lat,
      lon: lon,
      candidate: candidate,
      rxHeightM: rxHeightM,
    );
    return _mapper.linkFromModel(model);
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
ReachableRepository reachableRepository(Ref ref) {
  return ReachableRepository(ref.watch(reachableDatasourceProvider));
}
