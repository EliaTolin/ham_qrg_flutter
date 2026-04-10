import 'package:freezed_annotation/freezed_annotation.dart';

part 'pota_park.freezed.dart';

@freezed
abstract class PotaPark with _$PotaPark {
  const factory PotaPark({
    required String reference,
    required String name,
    double? latitude,
    double? longitude,
    String? grid4,
    String? grid6,
    String? parktypeDesc,
    String? locationName,
    String? entityName,
    String? website,
    String? accessMethods,
    String? firstActivator,
    String? firstActivationDate,
  }) = _PotaPark;
}
