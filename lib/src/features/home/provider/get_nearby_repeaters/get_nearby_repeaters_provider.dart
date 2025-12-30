import 'package:ham_qrg/src/features/home/data/repository/home_dashboard_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_nearby_repeaters_provider.g.dart';

@riverpod
Future<List<Repeater>> getNearbyRepeaters(
  Ref ref, {
  required double latitude,
  required double longitude,
  int limit = 3,
}) async {
  final repository = ref.read(homeDashboardRepositoryProvider);
  return repository.getNearbyRepeaters(
    latitude: latitude,
    longitude: longitude,
    limit: limit,
  );
}
