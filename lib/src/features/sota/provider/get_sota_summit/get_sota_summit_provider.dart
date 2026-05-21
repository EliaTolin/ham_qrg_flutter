import 'package:hamqrg/src/features/sota/data/repository/sota_repository.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_sota_summit_provider.g.dart';

@riverpod
Future<SotaSummit> getSotaSummit(Ref ref, {required String summitCode}) async {
  final repository = ref.read(sotaRepositoryProvider);
  return repository.getSummit(summitCode);
}
