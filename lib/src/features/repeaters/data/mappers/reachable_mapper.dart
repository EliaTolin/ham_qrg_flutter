import 'package:hamqrg/src/features/repeaters/data/model/reachable/reachable_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/reachable/reachable_link.dart';

class ReachableMapper {
  LinkProfile linkFromModel(LinkDetailModel m) => LinkProfile(
        dbm: m.dbm,
        lossDb: m.lossDb,
        distanceKm: m.distanceKm,
        azimuthDeg: m.azimuthDeg,
        reachable: m.reachable,
        points: m.profile
            .map(
              (p) => LinkProfilePoint(
                distanceKm: p.distanceKm,
                groundM: p.groundM,
              ),
            )
            .toList(),
      );
}
