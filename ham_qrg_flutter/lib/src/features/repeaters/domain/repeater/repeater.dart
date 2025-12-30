import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater.freezed.dart';

enum RepeaterMode {
  analog,
  c4fm,
  dstar,
  dmr,
  allmode,
  echolink,
  winlink,
}


@freezed
abstract class Repeater with _$Repeater {
  const factory Repeater({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int frequencyHz,
    required RepeaterMode mode,
    String? callsign,
    String? name,
    int? nodeNumber,
    String? managerCallsign,
    int? shiftHz,
    String? shiftRaw,
    String? toneRaw,
    double? ctcssHz,
    String? network,
    String? region,
    String? provinceCode,
    String? locality,
    String? locator,
    double? latitude,
    double? longitude,
    double? distanceMeters,
  }) = _Repeater;
}
