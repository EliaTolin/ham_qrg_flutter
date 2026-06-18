import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'reachable_link.freezed.dart';

/// One reachable repeater enriched with its full [Repeater] entity, ready for
/// the UI (list, map, hero). Signal is the predicted received level at the
/// user from this repeater, dBm — same ITM model as the coverage map.
@freezed
abstract class ReachableEntry with _$ReachableEntry {
  const factory ReachableEntry({
    required Repeater repeater,
    required double dbm,
    required double distanceKm,
    required bool reachable,
  }) = _ReachableEntry;
}

/// Result of "which repeaters can I reach from here?": the reachable entries
/// (strongest first) and how many cleared the reachability threshold.
@freezed
abstract class ReachableSummary with _$ReachableSummary {
  const factory ReachableSummary({
    required int reachableCount,
    @Default([]) List<ReachableEntry> entries,
  }) = _ReachableSummary;
}

/// One sample of the great-circle terrain profile between user and repeater.
@freezed
abstract class LinkProfilePoint with _$LinkProfilePoint {
  const factory LinkProfilePoint({
    required double distanceKm,
    required double groundM,
  }) = _LinkProfilePoint;
}

/// Full point-to-point link to one repeater, with the terrain profile for the
/// signal/elevation chart.
@freezed
abstract class LinkProfile with _$LinkProfile {
  const factory LinkProfile({
    required double dbm,
    required double lossDb,
    required double distanceKm,
    required double azimuthDeg,
    required bool reachable,
    @Default([]) List<LinkProfilePoint> points,
  }) = _LinkProfile;
}
