import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';

part 'repeater.freezed.dart';

enum RepeaterMode {
  analog,
  digital,
  mixed,
}

@freezed
abstract class Repeater with _$Repeater {
  const factory Repeater({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int frequencyHz,
    required RepeaterMode mode,
    required String source,
    String? callsign,
    String? name,
    String? manager,
    int? shiftHz,
    String? shiftRaw,
    String? region,
    String? provinceCode,
    String? locality,
    String? locator,
    double? latitude,
    double? longitude,
    double? distanceMeters,
    @Default([]) List<RepeaterAccess> accesses,
  }) = _Repeater;
}
