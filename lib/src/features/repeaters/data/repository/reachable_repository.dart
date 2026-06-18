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

@riverpod
ReachableRepository reachableRepository(Ref ref) {
  return ReachableRepository(ref.read(reachableDatasourceProvider));
}
