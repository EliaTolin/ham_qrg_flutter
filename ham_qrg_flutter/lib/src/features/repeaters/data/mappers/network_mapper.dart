import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/network/network_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network_kind.dart';

class NetworkMapper implements Mapper<Network, NetworkModel> {
  @override
  Network fromModel(NetworkModel model) {
    return Network(
      id: model.id,
      name: model.name,
      kind: NetworkKind.values.firstWhere(
        (e) => e.name.toLowerCase() == model.kind.toLowerCase(),
        orElse: () => NetworkKind.other,
      ),
      parentNetworkId: model.parentNetworkId,
      website: model.website,
      notes: model.notes,
      createdAt: DateTime.parse(model.createdAt),
    );
  }

  @override
  NetworkModel toModel(Network entity) {
    return NetworkModel(
      id: entity.id,
      name: entity.name,
      kind: entity.kind.name,
      parentNetworkId: entity.parentNetworkId,
      website: entity.website,
      notes: entity.notes,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }
}
