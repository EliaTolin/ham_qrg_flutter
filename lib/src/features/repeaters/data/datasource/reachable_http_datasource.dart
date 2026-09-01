import 'package:dio/dio.dart';
import 'package:hamqrg/common/cache/offline_cache_gate_ref.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/cached_reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/reachable/reachable_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reachable_http_datasource.g.dart';

/// Reachability over the same ham_qrg_coverage service used for coverage maps.
class ReachableHttpDatasource implements ReachableDatasource {
  ReachableHttpDatasource(this._dio);

  final Dio _dio;

  @override
  Future<ReachableResponseModel> getReachable({
    required double lat,
    required double lon,
    required List<ReachableCandidate> candidates,
    double rxHeightM = 2,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/reachable',
      data: {
        'lat': lat,
        'lon': lon,
        'rx_height_m': rxHeightM,
        'repeaters': candidates.map((c) => c.toJson()).toList(),
      },
    );
    return ReachableResponseModel.fromJson(response.data!);
  }

  @override
  Future<LinkDetailModel> getLink({
    required double lat,
    required double lon,
    required ReachableCandidate candidate,
    double rxHeightM = 2,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/link',
      data: {
        'lat': lat,
        'lon': lon,
        'rx_height_m': rxHeightM,
        'repeater': candidate.toJson(),
      },
    );
    return LinkDetailModel.fromJson(response.data!);
  }
}

@riverpod
ReachableDatasource reachableDatasource(Ref ref) {
  // Same service as coverage maps (ham_qrg_coverage).
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfigs.getCoverageServiceBaseUrl(),
      headers: {'x-api-key': AppConfigs.getCoverageServiceApiKey()},
      contentType: 'application/json; charset=UTF-8',
      connectTimeout: const Duration(seconds: 15),
      // Point-to-point is fast (cached terrain), but a cold first link for a
      // far/foreign repeater can still take a little; keep a generous ceiling.
      receiveTimeout: const Duration(seconds: 60),
    ),
  );
  return CachedReachableDatasource(
    inner: ReachableHttpDatasource(dio),
    gate: ref.watchOfflineCacheGate(),
  );
}
