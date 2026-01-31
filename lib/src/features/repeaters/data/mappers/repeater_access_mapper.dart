import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/network_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/access/repeater_access_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';

class RepeaterAccessMapper implements Mapper<RepeaterAccess, RepeaterAccessModel> {
  final _networkMapper = NetworkMapper();

  @override
  RepeaterAccess fromModel(RepeaterAccessModel model) {
    return RepeaterAccess(
      id: model.id,
      repeaterId: model.repeaterId,
      networkId: model.networkId,
      network: model.network != null ? _networkMapper.fromModel(model.network!) : null,
      mode: AccessMode.values.firstWhere(
        (e) => e.name.toUpperCase() == model.mode.toUpperCase(),
        orElse: () => AccessMode.analog,
      ),
      ctcssTxHz: model.ctcssTxHz,
      ctcssRxHz: model.ctcssRxHz,
      dcsCode: model.dcsCode,
      colorCode: model.colorCode,
      dmrId: model.dmrId,
      dgId: model.dgId,
      notes: model.notes,
      source: model.source,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
    );
  }

  @override
  RepeaterAccessModel toModel(RepeaterAccess entity) {
    return RepeaterAccessModel(
      id: entity.id,
      repeaterId: entity.repeaterId,
      networkId: entity.networkId,
      network: entity.network != null ? _networkMapper.toModel(entity.network!) : null,
      mode: entity.mode.name.toUpperCase(),
      ctcssTxHz: entity.ctcssTxHz,
      ctcssRxHz: entity.ctcssRxHz,
      dcsCode: entity.dcsCode,
      colorCode: entity.colorCode,
      dmrId: entity.dmrId,
      dgId: entity.dgId,
      notes: entity.notes,
      source: entity.source,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
    );
  }
}
