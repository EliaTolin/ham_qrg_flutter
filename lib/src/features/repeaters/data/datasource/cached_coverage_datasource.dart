import 'package:hamqrg/common/cache/cache_keys.dart';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/coverage_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/coverage/repeater_coverage_model.dart';
import 'package:hamqrg/src/features/repeaters/service/coverage_image_cache.dart';

/// Decorator offline-first di [CoverageDatasource] (solo Pro — la feature è
/// già gated a monte, i free non arrivano qui con `coverageRequiresPro`).
///
/// Oltre al JSON, la risposta fresca fa scaricare il PNG di copertura in
/// locale ([CoverageImageCache]) e la voce cachata punta al `file://`: la
/// pagina renderizza sempre dal disco, online e offline.
///
/// Nessun timeout nel gate: un cold-miss del servizio di coverage può
/// legittimamente richiedere minuti (il Dio interno ha `receiveTimeout` 600s);
/// offline si corto-circuita e la cache risponde all'istante.
class CachedCoverageDatasource implements CoverageDatasource {
  CachedCoverageDatasource({
    required CoverageDatasource inner,
    required CoverageImageCache imageCache,
    required OfflineCacheGate gate,
  })  : _inner = inner,
        _imageCache = imageCache,
        _gate = gate;

  final CoverageDatasource _inner;
  final CoverageImageCache _imageCache;
  final OfflineCacheGate _gate;

  static const _coverageTtl = Duration(days: 90);

  @override
  Future<RepeaterCoverageModel> getCoverage({
    required double lat,
    required double lon,
    required double frequencyMhz,
    required double txHeightM,
    required double txPowerDbm,
    String? repeaterId,
  }) {
    final target =
        repeaterId ?? '${CacheKeys.coord(lat, 4)}:${CacheKeys.coord(lon, 4)}';
    final key = 'pro:v1:coverage:$target'
        ':${frequencyMhz.toStringAsFixed(3)}'
        ':${txHeightM.toStringAsFixed(0)}'
        ':${txPowerDbm.toStringAsFixed(0)}';

    return _gate.cached(
      key: key,
      ttl: _coverageTtl,
      fetch: () async {
        final model = await _inner.getCoverage(
          lat: lat,
          lon: lon,
          frequencyMhz: frequencyMhz,
          txHeightM: txHeightM,
          txPowerDbm: txPowerDbm,
          repeaterId: repeaterId,
        );
        // Per i free il PNG resta remoto: il download locale serve solo alla
        // voce in cache.
        if (!_gate.isPro) return model;
        final imageUrl = model.imageUrl ?? model.image;
        if (imageUrl != null && imageUrl.startsWith('http')) {
          final localUri = await _imageCache.download(
            url: imageUrl,
            cacheKey: key,
          );
          return model.copyWith(imageUrl: localUri);
        }
        return model;
      },
      fromJson: (json) =>
          RepeaterCoverageModel.fromJson(json! as Map<String, dynamic>),
    );
  }
}
