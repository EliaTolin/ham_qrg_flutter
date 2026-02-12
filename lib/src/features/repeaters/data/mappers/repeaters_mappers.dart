import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeater_access_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class RepeatersMappers implements Mapper<Repeater, RepeaterModel> {
  RepeatersMappers() : _accessMapper = RepeaterAccessMapper();

  final RepeaterAccessMapper _accessMapper;

  @override
  Repeater fromModel(RepeaterModel model) {
    return Repeater(
      id: model.id,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      name: model.name,
      callsign: model.callsign,
      manager: model.manager,
      frequencyHz: model.frequencyHz,
      shiftHz: model.shiftHz,
      shiftRaw: model.shiftRaw,
      
      region: model.region,
      provinceCode: model.provinceCode,
      locality: model.locality,
      locator: model.locator,
      latitude: model.lat,
      longitude: model.lon,
      distanceMeters: model.distanceM,
      source: model.source,
      accesses: model.accesses?.map(_accessMapper.fromModel).toList() ?? [],
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
      manager: entity.manager,
      frequencyHz: entity.frequencyHz,
      shiftHz: entity.shiftHz,
      shiftRaw: entity.shiftRaw,
      region: entity.region,
      provinceCode: entity.provinceCode,
      locality: entity.locality,
      locator: entity.locator,
      lat: entity.latitude,
      lon: entity.longitude,
      distanceM: entity.distanceMeters,
      source: entity.source,
      accesses: entity.accesses.map(_accessMapper.toModel).toList(),
    );
  }

  List<String>? mapAccessModesToValues(List<AccessMode>? accessModes) {
    return accessModes?.map((mode) => mode.name).toList();
  }
}
