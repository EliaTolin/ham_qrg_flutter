import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeaters_nearby_provider.g.dart';

@riverpod
Future<List<Repeater>> getRepeatersNearby(
  Ref ref, {
  required double latitude,
  required double longitude,
  double radiusKm = 50,
  List<AccessMode>? accessModes,
}) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeatersNearby(
    latitude: latitude,
    longitude: longitude,
    radiusKm: radiusKm,
    accessModes: accessModes,
  );
}
