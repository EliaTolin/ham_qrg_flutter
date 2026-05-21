import 'package:hamqrg/src/features/sota/data/repository/sota_repository.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_sota_spots_provider.g.dart';

@riverpod
Future<List<SotaSpot>> getSotaSpots(Ref ref) async {
  final repository = ref.read(sotaRepositoryProvider);
  return repository.getActiveSpots();
}
