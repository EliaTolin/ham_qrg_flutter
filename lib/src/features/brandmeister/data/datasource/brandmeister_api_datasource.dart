import 'package:dio/dio.dart';
import 'package:hamqrg/src/features/brandmeister/data/datasource/brandmeister_datasource.dart';
import 'package:hamqrg/src/features/brandmeister/data/model/bm_device_model.dart';
import 'package:hamqrg/src/features/brandmeister/data/model/bm_talkgroup_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brandmeister_api_datasource.g.dart';

/// BrandMeister API base URL.
const _baseUrl = 'https://api.brandmeister.network/v2';

class BrandmeisterApiDatasource implements BrandmeisterDatasource {
  BrandmeisterApiDatasource(this._dio);

  final Dio _dio;

  @override
  Future<BmDeviceModel> getDevice(int deviceId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_baseUrl/device/$deviceId',
    );
    return BmDeviceModel.fromJson(response.data!);
  }

  @override
  Future<List<BmTalkgroupModel>> getDeviceTalkgroups(int deviceId) async {
    final response = await _dio.get<List<dynamic>>(
      '$_baseUrl/device/$deviceId/talkgroup',
    );
    if (response.data == null || response.data!.isEmpty) return [];
    return response.data!
        .cast<Map<String, dynamic>>()
        .map(BmTalkgroupModel.fromJson)
        .toList();
  }
  @override
  Future<Map<String, String>> getTalkgroupNames() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_baseUrl/talkgroup/',
    );
    if (response.data == null) return {};
    return response.data!.map((key, value) => MapEntry(key, value.toString()));
  }
}

@riverpod
BrandmeisterDatasource brandmeisterDatasource(Ref ref) {
  return BrandmeisterApiDatasource(Dio());
}
