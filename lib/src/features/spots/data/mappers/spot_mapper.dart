import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';

class SpotMapper {
  RepeaterSpot fromModel(SpotModel model) {
    return RepeaterSpot(
      id: model.id,
      userId: model.userId,
      repeaterId: model.repeaterId,
      callsignSnapshot: model.callsignSnapshot,
      spottedCallsign: model.spottedCallsign,
      accessId: model.accessId,
      accessMode: model.access != null
          ? AccessMode.values.firstWhere(
              (e) => e.name.toUpperCase() == model.access!.mode.toUpperCase(),
              orElse: () => AccessMode.analog,
            )
          : null,
      startedAt: model.startedAt,
      durationMinutes: model.durationMinutes,
      expiresAt: model.expiresAt,
      closedAt: model.closedAt,
      repeaterCallsign: model.repeater?.callsign,
      repeaterName: model.repeater?.name,
      spotterFirstName: model.profile?.firstName,
    );
  }
}
