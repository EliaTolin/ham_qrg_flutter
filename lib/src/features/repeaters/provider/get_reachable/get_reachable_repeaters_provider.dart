import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/reachable_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_reachable_repeaters_provider.g.dart';

/// ITM is invalid above ~20 GHz; skip those candidates (the engine rejects
/// them) so we don't waste a request on a guaranteed failure.
const _maxFrequencyMhz = 20000.0;

/// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
/// service which reach the user (point-to-point, same model as the map), and
/// joins the verdicts back onto the full [Repeater] entities for the UI.
@riverpod
Future<ReachableSummary> getReachableRepeaters(
  Ref ref, {
  required double latitude,
  required double longitude,
  double radiusKm = 80,
}) async {
  final nearby = await ref.watch(
    getRepeatersNearbyProvider(
      latitude: latitude,
      longitude: longitude,
      radiusKm: radiusKm,
    ).future,
  );

  final byId = <String, Repeater>{};
  final candidates = <ReachableCandidate>[];
  for (final r in nearby) {
    final lat = r.latitude;
    final lon = r.longitude;
    if (lat == null || lon == null) continue;
    final freqMhz = r.frequencyHz / 1000000.0;
    if (freqMhz <= 0 || freqMhz > _maxFrequencyMhz) continue;
    byId[r.id] = r;
    candidates.add(
      ReachableCandidate(id: r.id, lat: lat, lon: lon, frequencyMhz: freqMhz),
    );
  }

  if (candidates.isEmpty) return const ReachableSummary(reachableCount: 0);

  final outcomes = await ref
      .read(reachableRepositoryProvider)
      .getReachable(lat: latitude, lon: longitude, candidates: candidates);

  // Outcomes already come strongest-first from the service.
  final entries = <ReachableEntry>[];
  for (final o in outcomes) {
    final repeater = byId[o.id];
    if (repeater == null) continue;
    entries.add(
      ReachableEntry(
        repeater: repeater,
        dbm: o.dbm,
        distanceKm: o.distanceKm,
        reachable: o.reachable,
      ),
    );
  }

  final reachableCount = entries.where((e) => e.reachable).length;
  return ReachableSummary(reachableCount: reachableCount, entries: entries);
}
