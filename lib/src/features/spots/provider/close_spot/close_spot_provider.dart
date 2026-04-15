import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'close_spot_provider.g.dart';

@riverpod
Future<RepeaterSpot> closeSpot(
  Ref ref, {
  required String spotId,
}) async {
  final repository = ref.read(spotsRepositoryProvider);
  return repository.closeSpot(spotId: spotId);
}
