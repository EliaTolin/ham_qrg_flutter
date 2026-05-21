import 'package:freezed_annotation/freezed_annotation.dart';

part 'sota_summit.freezed.dart';

@freezed
abstract class SotaSummit with _$SotaSummit {
  const factory SotaSummit({
    required String code,
    required String name,
    required String associationName,
    required String associationCode,
    required String regionName,
    required String regionCode,
    required double latitude,
    required double longitude,
    required int altitudeM,
    required int altitudeFt,
    required int points,
    required String locator,
    required DateTime validFrom,
    required DateTime validTo,
    required bool valid,
    required bool hasRestrictions,
    @Default(<String>[]) List<String> restrictions,
    String? notes,
  }) = _SotaSummit;
}
