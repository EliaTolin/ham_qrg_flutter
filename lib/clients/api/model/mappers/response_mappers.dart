import 'package:hamqrg/clients/api/model/response_model/response_model.dart';

abstract interface class ResponseMappers<T> {
  ResponseModel mapResponseModel(T response);
}
