import 'package:hamqrg/clients/api/model/mappers/response_mappers.dart';
import 'package:hamqrg/clients/api/model/response_model/response_model.dart';

abstract class ApiClient {
  ApiClient({required this.responseMappers});
  final ResponseMappers responseMappers;
  Future<ResponseModel> get(String url);
  Future<ResponseModel> post(String url, dynamic data);
  Future<ResponseModel> put(String url, dynamic data);
  Future<ResponseModel> delete(String url);
}
