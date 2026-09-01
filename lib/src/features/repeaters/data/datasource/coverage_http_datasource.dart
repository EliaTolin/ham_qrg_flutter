import 'package:dio/dio.dart';
import 'package:hamqrg/common/cache/offline_cache_gate_ref.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/cached_coverage_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/coverage_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/coverage/repeater_coverage_model.dart';
import 'package:hamqrg/src/features/repeaters/service/coverage_image_cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'coverage_http_datasource.g.dart';

/// Talks to the standalone ham_qrg_coverage service over HTTP.
class CoverageHttpDatasource implements CoverageDatasource {
  CoverageHttpDatasource(this._dio);

  final Dio _dio;

  @override
  Future<RepeaterCoverageModel> getCoverage({
    required double lat,
    required double lon,
    required double frequencyMhz,
    required double txHeightM,
    required double txPowerDbm,
    String? repeaterId,
  }) async {
    // Radius and other RF parameters are intentionally omitted: the service
    // applies its own defaults, so the coverage extent can be tuned in one
    // place (the server) without an app release.
    final response = await _dio.post<Map<String, dynamic>>(
      '/coverage',
      data: {
        'lat': lat,
        'lon': lon,
        'frequency_mhz': frequencyMhz,
        'tx_height': txHeightM,
        'tx_power': txPowerDbm,
        if (repeaterId != null) 'repeater_id': repeaterId,
      },
    );
    return RepeaterCoverageModel.fromJson(response.data!);
  }
}

@riverpod
CoverageDatasource coverageDatasource(Ref ref) {
  final talker = ref.watch(talkerServiceProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfigs.getCoverageServiceBaseUrl(),
      headers: {'x-api-key': AppConfigs.getCoverageServiceApiKey()},
      contentType: 'application/json; charset=UTF-8',
      connectTimeout: const Duration(seconds: 15),
      // Cold compute (cache miss) can take several minutes at large radii.
      // Cached requests return in well under a second.
      receiveTimeout: const Duration(seconds: 600),
    ),
  );
  dio.interceptors.add(_CoverageLogInterceptor(talker));
  return CachedCoverageDatasource(
    inner: CoverageHttpDatasource(dio),
    imageCache: ref.read(coverageImageCacheProvider),
    gate: ref.watchOfflineCacheGate(),
  );
}

/// Logs each coverage call with the exact request body, the cache outcome
/// (`cached`/`source`) and the elapsed time — so we can tell a cache HIT
/// (sub-second) from a MISS that recomputes (minutes) straight from the logs.
class _CoverageLogInterceptor extends Interceptor {
  _CoverageLogInterceptor(this._talker);

  final Talker _talker;
  static const _startKey = '_coverageStart';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startKey] = DateTime.now();
    _talker.info('[Coverage] → POST ${options.path}  body=${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final ms = _elapsedMs(response.requestOptions);
    final data = response.data;
    final cached = data is Map ? data['cached'] : null;
    final source = data is Map ? data['source'] : null;
    _talker.info(
      '[Coverage] ← ${response.statusCode} cached=$cached source=$source in ${ms}ms',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final ms = _elapsedMs(err.requestOptions);
    _talker.error(
      '[Coverage] ✗ ${err.type} ${err.message} after ${ms}ms',
    );
    handler.next(err);
  }

  int _elapsedMs(RequestOptions options) {
    final start = options.extra[_startKey];
    if (start is DateTime) {
      return DateTime.now().difference(start).inMilliseconds;
    }
    return -1;
  }
}
