import 'package:hamqrg/src/features/params/data/model/param_model/param_model.dart';

abstract interface class ParamDatasource {
  Future<List<ParamModel>> getAllParams();
  Future<ParamModel?> getParamByKey(String key);
}
