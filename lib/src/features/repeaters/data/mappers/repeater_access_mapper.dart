import 'package:flutter/foundation.dart';
import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/network_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/access/repeater_access_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';

class RepeaterAccessMapper
    implements Mapper<RepeaterAccess, RepeaterAccessModel> {
  final _networkMapper = NetworkMapper();

  /// Converte il valore `access_mode` del backend nell'enum locale.
  ///
  /// Se il backend introduce un modo che questa versione dell'app non conosce,
  /// il fallback resta `analog` per non rompere la UI, ma la cosa viene
  /// segnalata in debug: senza log un disallineamento fra enum SQL ed enum Dart
  /// resterebbe invisibile, mostrando ponti digitali come analogici.
  static AccessMode _parseMode(String raw) {
    final normalized = raw.toUpperCase();
    for (final mode in AccessMode.values) {
      if (mode.name.toUpperCase() == normalized) return mode;
    }
    assert(() {
      debugPrint(
        '[RepeaterAccessMapper] access_mode sconosciuto dal backend: "$raw" '
        '-> fallback su AccessMode.analog. '
        'Aggiornare enum AccessMode e AccessModeHelper.',
      );
      return true;
    }());
    return AccessMode.analog;
  }

  @override
  RepeaterAccess fromModel(RepeaterAccessModel model) {
    return RepeaterAccess(
      id: model.id,
      repeaterId: model.repeaterId,
      networkId: model.networkId,
      network: model.network != null
          ? _networkMapper.fromModel(model.network!)
          : null,
      mode: _parseMode(model.mode),
      ctcssTxHz: model.ctcssTxHz,
      ctcssRxHz: model.ctcssRxHz,
      dcsCode: model.dcsCode,
      colorCode: model.colorCode,
      nodeId: model.nodeId,
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
      network: entity.network != null
          ? _networkMapper.toModel(entity.network!)
          : null,
      mode: entity.mode.name.toUpperCase(),
      ctcssTxHz: entity.ctcssTxHz,
      ctcssRxHz: entity.ctcssRxHz,
      dcsCode: entity.dcsCode,
      colorCode: entity.colorCode,
      nodeId: entity.nodeId,
      dgId: entity.dgId,
      notes: entity.notes,
      source: entity.source,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
    );
  }
}
