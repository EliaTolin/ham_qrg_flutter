import 'package:hamqrg/src/features/sota/data/datasource/sota_api_datasource.dart';
import 'package:hamqrg/src/features/sota/data/datasource/sota_datasource.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sota_repository.g.dart';

class SotaRepository {
  SotaRepository(this._datasource);

  final SotaDatasource _datasource;
  final SotaMappers _mappers = SotaMappers();

  /// In-memory cache for summit details (avoids ri-fetch in same session).
  final Map<String, SotaSummit> _summitCache = {};

  /// Returns active SOTA spots from the public API, mapped to domain entities,
  /// sorted by timestamp descending (most recent first). Spots with a null
  /// frequency (rare API quirk) are dropped — they cannot be used by an
  /// operator and would only confuse the UI.
  Future<List<SotaSpot>> getActiveSpots() async {
    final models = await _datasource.getActiveSpots();
    final spots = <SotaSpot>[];
    for (final m in models) {
      final spot = _mappers.spotFromModel(m);
      if (spot == null) continue;
      spots.add(spot);
    }
    spots.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return spots;
  }

  /// Returns summit details by code, using the in-memory cache.
  Future<SotaSummit> getSummit(String summitCode) async {
    final cached = _summitCache[summitCode];
    if (cached != null) return cached;

    final model = await _datasource.getSummit(summitCode);
    final summit = _mappers.summitFromModel(model);
    _summitCache[summitCode] = summit;
    return summit;
  }

  /// Fetches summit details for all unique summit codes in [spots],
  /// using the in-memory cache. Failed lookups are silently skipped
  /// (the resulting map only contains successfully resolved summits).
  Future<Map<String, SotaSummit>> getSummitsForSpots(
    List<SotaSpot> spots,
  ) async {
    final uniqueCodes = spots.map((s) => s.summitCode).toSet();
    final missing =
        uniqueCodes.where((c) => !_summitCache.containsKey(c)).toList();

    if (missing.isNotEmpty) {
      final results = await Future.wait(
        missing.map((code) async {
          try {
            return await getSummit(code);
          } catch (_) {
            return null;
          }
        }),
      );
      for (final summit in results) {
        if (summit != null) {
          _summitCache[summit.code] = summit;
        }
      }
    }

    return {
      for (final code in uniqueCodes)
        if (_summitCache.containsKey(code)) code: _summitCache[code]!,
    };
  }
}

@Riverpod(keepAlive: true)
SotaRepository sotaRepository(Ref ref) {
  return SotaRepository(ref.read(sotaDatasourceProvider));
}
