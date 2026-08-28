import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/presentation/widgets/sota_mode_badge.dart'
    show normalizeSotaMode;

/// Pure filtering logic shared between the SOTA list page (via its controller)
/// and the SOTA map page, which keeps its own local copy of the filters.
List<SotaSpot> filterSotaSpots(
  List<SotaSpot> spots, {
  String? band,
  String? mode,
  int? minPoints,
  String? association,
}) {
  var results = spots.toList();

  if (band != null) {
    results = results
        .where((spot) => bandFromFrequencyMhz(spot.frequencyMhz) == band)
        .toList();
  }

  if (mode != null) {
    results =
        results.where((spot) => normalizeSotaMode(spot.mode) == mode).toList();
  }

  if (minPoints != null) {
    results = results.where((spot) => spot.points >= minPoints).toList();
  }

  if (association != null) {
    results = results
        .where(
          (spot) => associationFromSummitCode(spot.summitCode) == association,
        )
        .toList();
  }

  return results;
}
