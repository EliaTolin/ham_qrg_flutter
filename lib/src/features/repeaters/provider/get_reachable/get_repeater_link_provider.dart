import 'package:hamqrg/src/features/repeaters/data/datasource/reachable_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/reachable_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_link_provider.g.dart';

/// Full point-to-point link (with terrain profile) from the user to one
/// repeater — powers the elevation/signal chart and the preview badge.
@riverpod
Future<LinkProfile> getRepeaterLink(
  Ref ref, {
  required double userLat,
  required double userLon,
  required String repeaterId,
  required double repeaterLat,
  required double repeaterLon,
  required int frequencyHz,
  double rxHeightM = 2,
}) async {
  final candidate = ReachableCandidate(
    id: repeaterId,
    lat: repeaterLat,
    lon: repeaterLon,
    frequencyMhz: frequencyHz / 1000000.0,
  );
  return ref.read(reachableRepositoryProvider).getLink(
        lat: userLat,
        lon: userLon,
        candidate: candidate,
        rxHeightM: rxHeightM,
      );
}
