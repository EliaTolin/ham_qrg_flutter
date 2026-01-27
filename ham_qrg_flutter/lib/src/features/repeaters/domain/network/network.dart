import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network_kind.dart';

part 'network.freezed.dart';

@freezed
abstract class Network with _$Network {
  const factory Network({
    required String id,
    required String name,
    required NetworkKind kind,
    required DateTime createdAt,
    String? parentNetworkId,
    String? website,
    String? notes,
  }) = _Network;
}
