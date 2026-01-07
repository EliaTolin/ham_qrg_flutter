import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/tone_direction.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/tone_scope.dart';

part 'repeater_access.freezed.dart';

@freezed
abstract class RepeaterAccess with _$RepeaterAccess {
  const factory RepeaterAccess({
    required String id,
    required String repeaterId,
    required AccessMode mode,
    required ToneScope toneScope,
    required ToneDirection toneDirection,
    required String source,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? networkId,
    double? ctcssHz,
    int? dcsCode,
    int? colorCode,
    int? dmrId,
    int? dgId,
    String? notes,
  }) = _RepeaterAccess;
}
