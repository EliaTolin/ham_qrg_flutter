import 'package:hamqrg/src/features/pota/data/datasource/pota_api_datasource.dart';
import 'package:hamqrg/src/features/pota/data/datasource/pota_datasource.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_repository.g.dart';

class PotaRepository {
  PotaRepository(this._datasource);

  final PotaDatasource _datasource;
  final _mapper = PotaMappers();

  /// In-memory cache for park data to avoid repeated API calls.
  final Map<String, PotaPark> _parkCache = {};

  Future<List<PotaSpot>> getActiveSpots() async {
    final models = await _datasource.getActiveSpots();
    return models.map(_mapper.spotFromModel).toList();
  }

  Future<PotaPark> getPark(String reference) async {
    if (_parkCache.containsKey(reference)) return _parkCache[reference]!;
    final model = await _datasource.getPark(reference);
    final park = _mapper.parkFromModel(model);
    _parkCache[reference] = park;
    return park;
  }

  /// Fetches park data for all unique references, using the cache.
  Future<Map<String, PotaPark>> getParksForSpots(
    List<PotaSpot> spots,
  ) async {
    final uniqueRefs = spots.map((s) => s.reference).toSet();
    final missing = uniqueRefs.where((r) => !_parkCache.containsKey(r));

    if (missing.isNotEmpty) {
      final results = await Future.wait(
        missing.map((ref) async {
          try {
            return await getPark(ref);
          } catch (_) {
            return null;
          }
        }),
      );
      for (final park in results) {
        if (park != null) {
          _parkCache[park.reference] = park;
        }
      }
    }

    return {
      for (final ref in uniqueRefs)
        if (_parkCache.containsKey(ref)) ref: _parkCache[ref]!,
    };
  }
}

@Riverpod(keepAlive: true)
PotaRepository potaRepository(Ref ref) {
  final datasource = ref.read(potaDatasourceProvider);
  return PotaRepository(datasource);
}
