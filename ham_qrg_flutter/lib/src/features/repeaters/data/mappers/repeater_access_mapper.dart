import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/access/repeater_access_model.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/tone_direction.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/tone_scope.dart';

class RepeaterAccessMapper implements Mapper<RepeaterAccess, RepeaterAccessModel> {
  @override
  RepeaterAccess fromModel(RepeaterAccessModel model) {
    return RepeaterAccess(
      id: model.id,
      repeaterId: model.repeaterId,
      networkId: model.networkId,
      mode: AccessMode.values.firstWhere(
        (e) => e.name.toUpperCase() == model.mode.toUpperCase(),
        orElse: () => AccessMode.analog,
      ),
      ctcssHz: model.ctcssHz,
      dcsCode: model.dcsCode,
      toneScope: ToneScope.values.firstWhere(
        (e) => e.name.toLowerCase() == model.toneScope.toLowerCase(),
        orElse: () => ToneScope.unknown,
      ),
      toneDirection: ToneDirection.values.firstWhere(
        (e) => e.name.toLowerCase() == model.toneDirection.toLowerCase(),
        orElse: () => ToneDirection.unknown,
      ),
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
      mode: entity.mode.name.toUpperCase(),
      ctcssHz: entity.ctcssHz,
      dcsCode: entity.dcsCode,
      toneScope: entity.toneScope.name,
      toneDirection: entity.toneDirection.name,
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


