import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_other_spot_provider.g.dart';

@riverpod
Future<RepeaterSpot> createOtherSpot(
  Ref ref, {
  required String repeaterId,
  required String spottedCallsign,
  String? accessId,
}) async {
  final repository = ref.read(spotsRepositoryProvider);
  return repository.createOtherSpot(
    repeaterId: repeaterId,
    spottedCallsign: spottedCallsign,
    accessId: accessId,
  );
}
