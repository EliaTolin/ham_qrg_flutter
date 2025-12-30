import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';

class RepeatersMappers implements Mapper<Repeater, RepeaterModel> {
  @override
  Repeater fromModel(RepeaterModel model) {
    return Repeater(
      id: model.id,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      name: model.name,
      callsign: model.callsign,
      nodeNumber: model.nodeNumber,
      managerCallsign: model.managerCallsign,
      frequencyHz: model.frequencyHz,
      shiftHz: model.shiftHz,
      shiftRaw: model.shiftRaw,
      toneRaw: model.toneRaw,
      ctcssHz: model.ctcssHz,
      mode: _modeFromString(model.mode),
      network: model.network,
      region: model.region,
      provinceCode: model.provinceCode,
      locality: model.locality,
      locator: model.locator,
      latitude: model.lat,
      longitude: model.lon,
      distanceMeters: model.distanceM,
    );
  }

  @override
  RepeaterModel toModel(Repeater entity) {
    return RepeaterModel(
      id: entity.id,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      name: entity.name,
      callsign: entity.callsign,
      nodeNumber: entity.nodeNumber,
      managerCallsign: entity.managerCallsign,
      frequencyHz: entity.frequencyHz,
      shiftHz: entity.shiftHz,
      shiftRaw: entity.shiftRaw,
      toneRaw: entity.toneRaw,
      ctcssHz: entity.ctcssHz,
      mode: _modeToString(entity.mode),
      network: entity.network,
      region: entity.region,
      provinceCode: entity.provinceCode,
      locality: entity.locality,
      locator: entity.locator,
      lat: entity.latitude,
      lon: entity.longitude,
      distanceM: entity.distanceMeters,
    );
  }

  String mapModeToValue(RepeaterMode mode) => _modeToString(mode);

  List<String>? mapModesToValues(List<RepeaterMode>? modes) {
    return modes?.map(_modeToString).toList();
  }

  RepeaterMode _modeFromString(String value) {
    final normalized = value.toLowerCase();
    switch (normalized) {
      case 'analog':
        return RepeaterMode.analog;
      case 'c4fm':
        return RepeaterMode.c4fm;
      case 'dstar':
        return RepeaterMode.dstar;
      case 'dmr':
        return RepeaterMode.dmr;
      case 'allmode':
        return RepeaterMode.allmode;
      case 'echolink':
        return RepeaterMode.echolink;
      case 'winlink':
        return RepeaterMode.winlink;
      default:
        return RepeaterMode.analog;
    }
  }

  String _modeToString(RepeaterMode mode) {
    switch (mode) {
      case RepeaterMode.analog:
        return 'Analog';
      case RepeaterMode.c4fm:
        return 'C4FM';
      case RepeaterMode.dstar:
        return 'DSTAR';
      case RepeaterMode.dmr:
        return 'DMR';
      case RepeaterMode.allmode:
        return 'ALLMODE';
      case RepeaterMode.echolink:
        return 'Echolink';
      case RepeaterMode.winlink:
        return 'Winlink';
    }
  }
}
