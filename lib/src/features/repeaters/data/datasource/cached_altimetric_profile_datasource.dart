import 'package:hamqrg/common/cache/cache_keys.dart';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/altimetric_profile_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_model.dart';

/// Decorator offline-first di [AltimetricProfileDatasource].
///
/// Il profilo altimetrico dipende dal terreno (statico): TTL lungo. Le
/// coordinate del ripetitore sono arrotondate a 4 decimali (~11 m), quelle
/// dell'utente a 3 (~110 m): un profilo è sensibile alla posizione ma non al
/// metro. La edge function passa dal client HTTP di Supabase (senza timeout),
/// quindi il gate deve imporre anche un tetto di tempo ([remoteTimeout]).
class CachedAltimetricProfileDatasource implements AltimetricProfileDatasource {
  CachedAltimetricProfileDatasource({
    required AltimetricProfileDatasource inner,
    required OfflineCacheGate gate,
  })  : _inner = inner,
        _gate = gate;

  final AltimetricProfileDatasource _inner;
  final OfflineCacheGate _gate;

  /// Da passare al gate dal provider.
  static const remoteTimeout = Duration(seconds: 20);
  static const _profileTtl = Duration(days: 90);

  @override
  Future<AltimetricProfileModel> getAltimetricProfile({
    required double repeaterLat,
    required double repeaterLon,
    required double userLat,
    required double userLon,
  }) =>
      _gate.cached(
        key: 'pro:v1:alti'
            ':${CacheKeys.coord(repeaterLat, 4)}'
            ':${CacheKeys.coord(repeaterLon, 4)}'
            ':${CacheKeys.coord(userLat, 3)}'
            ':${CacheKeys.coord(userLon, 3)}',
        ttl: _profileTtl,
        fetch: () => _inner.getAltimetricProfile(
          repeaterLat: repeaterLat,
          repeaterLon: repeaterLon,
          userLat: userLat,
          userLon: userLon,
        ),
        fromJson: (json) =>
            AltimetricProfileModel.fromJson(json! as Map<String, dynamic>),
      );
}
