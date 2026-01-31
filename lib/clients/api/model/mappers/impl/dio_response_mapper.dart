import 'package:dio/dio.dart';
import 'package:hamqrg/clients/api/model/mappers/response_mappers.dart';
import 'package:hamqrg/clients/api/model/response_model/response_model.dart';

class DioResponseMapper implements ResponseMappers<Response> {
  @override
  ResponseModel mapResponseModel(Response response) {
    return ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
  }
}
