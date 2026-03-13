import 'package:dio/dio.dart';
import 'package:hamqrg/src/features/pota/data/datasource/pota_datasource.dart';
import 'package:hamqrg/src/features/pota/data/model/pota_park_model.dart';
import 'package:hamqrg/src/features/pota/data/model/pota_spot_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_api_datasource.g.dart';

/// POTA API base URL.
const _baseUrl = 'https://api.pota.app';

class PotaApiDatasource implements PotaDatasource {
  PotaApiDatasource(this._dio);

  final Dio _dio;

  @override
  Future<List<PotaSpotModel>> getActiveSpots() async {
    final response = await _dio.get<List<dynamic>>(
      '$_baseUrl/spot/',
    );
    if (response.data == null || response.data!.isEmpty) return [];
    return response.data!
        .cast<Map<String, dynamic>>()
        .map(PotaSpotModel.fromJson)
        .toList();
  }

  @override
  Future<PotaParkModel> getPark(String reference) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_baseUrl/park/$reference',
    );
    return PotaParkModel.fromJson(response.data!);
  }
}

@riverpod
PotaDatasource potaDatasource(Ref ref) {
  return PotaApiDatasource(Dio());
}
