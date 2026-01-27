import 'package:dio/dio.dart';
import 'package:hamqrg/clients/api/api_client.dart';
import 'package:hamqrg/clients/api/model/mappers/impl/dio_response_mapper.dart';
import 'package:hamqrg/clients/api/model/mappers/response_mappers.dart';
import 'package:hamqrg/clients/api/model/response_model/response_model.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

part 'dio_api_clients.g.dart';

class DioApiClient extends ApiClient {
  DioApiClient({required this.dio, required super.responseMappers});
  final Dio dio;

  @override
  Future<ResponseModel> get(String url) async {
    final response = await dio.get(url);
    final responseModel = ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
    return responseModel;
  }

  @override
  Future<ResponseModel> post(String url, dynamic data) async {
    final response = await dio.post(url, data: data);
    final responseModel = ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
    return responseModel;
  }

  @override
  Future<ResponseModel> put(String url, dynamic data) async {
    final response = await dio.put(url, data: data);
    final responseModel = ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
    return responseModel;
  }

  @override
  Future<ResponseModel> delete(String url) async {
    final response = await dio.delete(url);
    final responseModel = ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
    return responseModel;
  }
}

@riverpod
Dio _dio(
  Ref ref, {
  required TalkerDioLogger talkerDioLogger,
  required String? token,
  String? baseUrl,
}) {
  final baseOptions = BaseOptions(
    baseUrl: baseUrl ?? '',
    headers: token != null ? {'Authorization': token} : null,
    contentType: 'application/json; charset=UTF-8',
  );
  final dio = Dio(baseOptions);
  dio.interceptors.add(talkerDioLogger);
  return dio;
}

@riverpod
ResponseMappers dioResponseMapper(Ref ref) {
  return DioResponseMapper();
}

@riverpod
Future<DioApiClient> dioApiClient(
  Ref ref, {
  String? baseUrl,
  String? token,
}) async {
  ref.watch(talkerServiceProvider).info('Init DioApiClient with baseUrl: $baseUrl, token: $token');
  final talkerDioLogger = ref.watch(talkerDioLoggerProvider);
  final dio = ref.watch(
    _dioProvider(
      baseUrl: baseUrl ?? '',
      talkerDioLogger: talkerDioLogger,
      token: token,
    ),
  );
  final dioResponseMapper = ref.watch(dioResponseMapperProvider);
  return DioApiClient(dio: dio, responseMappers: dioResponseMapper);
}
