import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeaters_nearby_provider.g.dart';

@riverpod
Future<List<Repeater>> getRepeatersNearby(
  Ref ref, {
  required double latitude,
  required double longitude,
  double radiusKm = 50,
  int limit = 50,
  List<RepeaterMode>? modes,
}) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeatersNearby(
    latitude: latitude,
    longitude: longitude,
    radiusKm: radiusKm,
    limit: limit,
    modes: modes,
  );
}
