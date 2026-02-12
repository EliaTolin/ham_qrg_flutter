import 'package:hamqrg/src/features/params/data/repository/param_repository.dart';
import 'package:hamqrg/src/features/params/domain/param/param.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_params_provider.g.dart';

@riverpod
Future<List<Param>> getParams(Ref ref) async {
  final repository = ref.watch(paramRepositoryProvider);
  return repository.getAllParams();
}

@riverpod
Future<Param?> getParamByKey(Ref ref, String key) async {
  final repository = ref.watch(paramRepositoryProvider);
  return repository.getParamByKey(key);
}
