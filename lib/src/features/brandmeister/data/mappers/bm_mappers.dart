import 'package:hamqrg/src/features/brandmeister/data/model/bm_device_model.dart';
import 'package:hamqrg/src/features/brandmeister/data/model/bm_talkgroup_model.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_device.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';

class BmMappers {
  BmDevice deviceFromModel(BmDeviceModel model) {
    return BmDevice(
      id: model.id,
      callsign: model.callsign,
      hardware: model.hardware,
      firmware: model.firmware,
      txFrequency: model.tx,
      rxFrequency: model.rx,
      colorCode: model.colorCode,
      status: model.status,
      latitude: model.lat,
      longitude: model.lng,
      city: model.city,
      website: model.website,
      powerWatts: model.pep,
      antennaHeightM: model.agl,
      description: model.description,
      lastSeen: model.lastSeen != null
          ? DateTime.tryParse(model.lastSeen!)
          : null,
    );
  }

  BmTalkgroup talkgroupFromModel(BmTalkgroupModel model) {
    return BmTalkgroup(
      talkgroupId: int.parse(model.talkgroup),
      slot: int.parse(model.slot),
      repeaterId: int.parse(model.repeaterId),
    );
  }
}
