import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_spot_provider.g.dart';

@riverpod
Future<RepeaterSpot> createSpot(
  Ref ref, {
  required String repeaterId,
  required int durationMinutes,
  required String accessId,
}) async {
  final repository = ref.read(spotsRepositoryProvider);
  return repository.createSelfSpot(
    repeaterId: repeaterId,
    durationMinutes: durationMinutes,
    accessId: accessId,
  );
}
