import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/network/network.dart';

part 'repeater_access.freezed.dart';

@freezed
abstract class RepeaterAccess with _$RepeaterAccess {
  const factory RepeaterAccess({
    required String id,
    required String repeaterId,
    required AccessMode mode,
    required String source,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? networkId,
    Network? network,
    double? ctcssTxHz,
    double? ctcssRxHz,
    int? dcsCode,
    int? colorCode,
    int? dmrId,
    int? dgId,
    String? notes,
  }) = _RepeaterAccess;
}
