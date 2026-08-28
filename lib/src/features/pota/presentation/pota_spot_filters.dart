import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart'
    show normalizePotaMode;

/// Pure filtering logic shared between the POTA list page (via its controller)
/// and the POTA map page, which keeps its own local copy of the filters.
List<PotaSpot> filterPotaSpots(
  List<PotaSpot> spots, {
  String searchQuery = '',
  String? band,
  String? mode,
}) {
  var results = spots.toList();

  if (searchQuery.isNotEmpty) {
    final lower = searchQuery.toLowerCase();
    results = results
        .where(
          (spot) =>
              spot.activator.toLowerCase().contains(lower) ||
              spot.reference.toLowerCase().contains(lower) ||
              spot.name.toLowerCase().contains(lower) ||
              spot.mode.toLowerCase().contains(lower),
        )
        .toList();
  }

  if (band != null) {
    results = results
        .where((spot) => bandFromFrequencyKhz(spot.frequency) == band)
        .toList();
  }

  if (mode != null) {
    results =
        results.where((spot) => normalizePotaMode(spot.mode) == mode).toList();
  }

  return results;
}
