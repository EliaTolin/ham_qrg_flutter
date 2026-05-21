import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hamqrg/src/features/sota/data/datasource/sota_datasource.dart';
import 'package:hamqrg/src/features/sota/data/model/sota_spot_model.dart';
import 'package:hamqrg/src/features/sota/data/model/sota_summit_model.dart';
import 'package:hamqrg/src/features/sota/errors/sota_errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sota_api_datasource.g.dart';

const _baseUrl = 'https://api-db2.sota.org.uk';
const _timeout = Duration(seconds: 10);

class SotaApiDatasource implements SotaDatasource {
  SotaApiDatasource(this._dio) {
    _dio.options
      ..connectTimeout = _timeout
      ..receiveTimeout = _timeout
      ..headers['Accept'] = 'application/json';
  }

  final Dio _dio;

  @override
  Future<List<SotaSpotModel>> getActiveSpots() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '$_baseUrl/api/spots/200/all/all',
      );
      final raw = response.data;
      if (raw == null || raw.isEmpty) return <SotaSpotModel>[];
      final spots = <SotaSpotModel>[];
      for (final item in raw) {
        try {
          if (item is! Map<String, dynamic>) continue;
          spots.add(SotaSpotModel.fromJson(item));
        } catch (e) {
          log('Skipping malformed SOTA spot: $e');
        }
      }
      return spots;
    } on DioException catch (e) {
      throw SotaApiException(
        e.message ?? 'Network error fetching SOTA spots',
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<SotaSummitModel> getSummit(String summitCode) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_baseUrl/api/summits/$summitCode',
      );
      final data = response.data;
      if (data == null) {
        throw SotaSummitNotFound(summitCode);
      }
      return SotaSummitModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw SotaSummitNotFound(summitCode);
      }
      throw SotaApiException(
        e.message ?? 'Network error fetching summit $summitCode',
        statusCode: e.response?.statusCode,
      );
    }
  }
}

@riverpod
SotaDatasource sotaDatasource(Ref ref) {
  return SotaApiDatasource(Dio());
}
