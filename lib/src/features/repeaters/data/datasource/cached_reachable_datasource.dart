import 'package:hamqrg/common/cache/cache_keys.dart';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/reachable/reachable_model.dart';

/// Decorator offline-first di [ReachableDatasource] (funzionalità già gated
/// Pro a monte).
///
/// Le chiavi dipendono dalla posizione dell'utente: le coordinate sono
/// arrotondate a 2 decimali (~1,1 km) così spostamenti minimi colpiscono la
/// stessa voce. Nessun timeout nel gate: il Dio interno ha già i suoi
/// (`connectTimeout` 15s, `receiveTimeout` 60s); offline si corto-circuita.
class CachedReachableDatasource implements ReachableDatasource {
  CachedReachableDatasource({
    required ReachableDatasource inner,
    required OfflineCacheGate gate,
  })  : _inner = inner,
        _gate = gate;

  final ReachableDatasource _inner;
  final OfflineCacheGate _gate;

  static const _reachableTtl = Duration(days: 30);
  static const _coordDecimals = 2;

  @override
  Future<ReachableResponseModel> getReachable({
    required double lat,
    required double lon,
    required List<ReachableCandidate> candidates,
    double rxHeightM = 2,
  }) =>
      _gate.cached(
        key: 'pro:v1:reach'
            ':${CacheKeys.coord(lat, _coordDecimals)}'
            ':${CacheKeys.coord(lon, _coordDecimals)}'
            ':${rxHeightM.toStringAsFixed(0)}'
            ':${CacheKeys.idsHash(candidates.map((c) => c.id))}',
        ttl: _reachableTtl,
        fetch: () => _inner.getReachable(
          lat: lat,
          lon: lon,
          candidates: candidates,
          rxHeightM: rxHeightM,
        ),
        fromJson: (json) =>
            ReachableResponseModel.fromJson(json! as Map<String, dynamic>),
      );

  @override
  Future<LinkDetailModel> getLink({
    required double lat,
    required double lon,
    required ReachableCandidate candidate,
    double rxHeightM = 2,
  }) =>
      _gate.cached(
        key: 'pro:v1:link'
            ':${CacheKeys.coord(lat, _coordDecimals)}'
            ':${CacheKeys.coord(lon, _coordDecimals)}'
            ':${candidate.id}:${rxHeightM.toStringAsFixed(0)}',
        ttl: _reachableTtl,
        fetch: () => _inner.getLink(
          lat: lat,
          lon: lon,
          candidate: candidate,
          rxHeightM: rxHeightM,
        ),
        fromJson: (json) =>
            LinkDetailModel.fromJson(json! as Map<String, dynamic>),
      );
}
