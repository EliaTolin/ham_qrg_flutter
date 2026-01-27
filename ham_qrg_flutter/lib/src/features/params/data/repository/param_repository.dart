import 'package:hamqrg/src/features/params/data/datasource/param_datasource.dart';
import 'package:hamqrg/src/features/params/data/datasource/param_supabase_datasource.dart';
import 'package:hamqrg/src/features/params/data/mappers/param_mappers.dart';
import 'package:hamqrg/src/features/params/domain/param/param.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'param_repository.g.dart';

class ParamRepository {
  ParamRepository(this._paramDatasource);
  final ParamDatasource _paramDatasource;

  final _mapper = ParamMappers();

  Future<List<Param>> getAllParams() async {
    final models = await _paramDatasource.getAllParams();
    return models.map(_mapper.fromModel).toList();
  }

  Future<Param?> getParamByKey(String key) async {
    final model = await _paramDatasource.getParamByKey(key);
    if (model == null) {
      return null;
    }
    return _mapper.fromModel(model);
  }
}

@riverpod
ParamRepository paramRepository(Ref ref) {
  final datasource = ref.read(paramSupabaseDatasourceProvider);
  return ParamRepository(datasource);
}
