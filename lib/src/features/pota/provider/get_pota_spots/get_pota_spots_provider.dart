import 'package:hamqrg/src/features/pota/data/repository/pota_repository.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pota_spots_provider.g.dart';

@riverpod
Future<List<PotaSpot>> getPotaSpots(Ref ref) async {
  final repository = ref.read(potaRepositoryProvider);
  return repository.getActiveSpots();
}
