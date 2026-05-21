import 'package:freezed_annotation/freezed_annotation.dart';

part 'bm_device.freezed.dart';

@freezed
abstract class BmDevice with _$BmDevice {
  const factory BmDevice({
    required int id,
    String? callsign,
    String? hardware,
    String? firmware,
    String? txFrequency,
    String? rxFrequency,
    int? colorCode,
    int? status,
    double? latitude,
    double? longitude,
    String? city,
    String? website,

    /// Power in watts
    int? powerWatts,

    /// Antenna height above ground level (m)
    int? antennaHeightM,
    String? description,
    DateTime? lastSeen,
  }) = _BmDevice;
}
