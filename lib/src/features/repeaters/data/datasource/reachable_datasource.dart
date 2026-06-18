import 'package:hamqrg/src/features/repeaters/data/model/reachable/reachable_model.dart';

/// A candidate repeater sent to the reachability service.
class ReachableCandidate {
  const ReachableCandidate({
    required this.id,
    required this.lat,
    required this.lon,
    required this.frequencyMhz,
  });

  final String id;
  final double lat;
  final double lon;
  final double frequencyMhz;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lon': lon,
        'frequency_mhz': frequencyMhz,
      };
}

/// Talks to the point-to-point reachability endpoints of ham_qrg_coverage.
abstract class ReachableDatasource {
  /// Which of [candidates] reach the user at ([lat], [lon]).
  Future<ReachableResponseModel> getReachable({
    required double lat,
    required double lon,
    required List<ReachableCandidate> candidates,
    double rxHeightM,
  });

  /// Full link (with terrain profile) to a single [candidate].
  Future<LinkDetailModel> getLink({
    required double lat,
    required double lon,
    required ReachableCandidate candidate,
    double rxHeightM,
  });
}
