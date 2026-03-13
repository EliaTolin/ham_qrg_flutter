import 'package:hamqrg/src/features/pota/data/repository/pota_repository.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pota_park_provider.g.dart';

@riverpod
Future<PotaPark> getPotaPark(Ref ref, String reference) async {
  final repository = ref.read(potaRepositoryProvider);
  return repository.getPark(reference);
}
