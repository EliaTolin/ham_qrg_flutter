import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeaters_in_bounds_provider.g.dart';

@riverpod
Future<List<Repeater>> getRepeatersInBounds(
  Ref ref, {
  required double lat1,
  required double lon1,
  required double lat2,
  required double lon2,
  int limit = 500,
  List<AccessMode>? accessModes,
}) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeatersInBounds(
    lat1: lat1,
    lon1: lon1,
    lat2: lat2,
    lon2: lon2,
    accessModes: accessModes,
  );
}
