import 'package:hamqrg/src/features/repeaters/data/repository/altimetric_profile_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_altimetric_profile_provider.g.dart';

@riverpod
Future<AltimetricProfile> getAltimetricProfile(
  Ref ref, {
  required double repeaterLat,
  required double repeaterLon,
}) async {
  final repository = ref.read(altimetricProfileRepositoryProvider);
  final userPosition = await ref.read(cachedUserPositionProvider.future);

  return repository.getAltimetricProfile(
    repeaterLat: repeaterLat,
    repeaterLon: repeaterLon,
    userLat: userPosition.latitude,
    userLon: userPosition.longitude,
  );
}
