import 'package:hamqrg/src/features/pota/data/model/pota_park_model.dart';
import 'package:hamqrg/src/features/pota/data/model/pota_spot_model.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';

class PotaMappers {
  PotaSpot spotFromModel(PotaSpotModel model) {
    return PotaSpot(
      spotId: model.spotId,
      spotTime: DateTime.tryParse(model.spotTime) ?? DateTime.now(),
      activator: model.activator,
      frequency: model.frequency,
      mode: model.mode,
      reference: model.reference,
      name: model.name,
      locationDesc: model.locationDesc,
      spotter: model.spotter,
      comments: model.comments,
      source: model.source,
    );
  }

  PotaPark parkFromModel(PotaParkModel model) {
    return PotaPark(
      reference: model.reference,
      name: model.name,
      latitude: model.latitude,
      longitude: model.longitude,
      grid4: model.grid4,
      grid6: model.grid6,
      parktypeDesc: model.parktypeDesc,
      locationName: model.locationName,
      entityName: model.entityName,
      website: model.website,
      accessMethods: model.accessMethods,
      firstActivator: model.firstActivator,
      firstActivationDate: model.firstActivationDate,
    );
  }
}

/// Converts a POTA frequency string (MHz) to Hz.
/// Example: "14.075" → 14075000
int? parsePotaFrequencyToHz(String freqMhz) {
  final mhz = double.tryParse(freqMhz);
  if (mhz == null) return null;
  return (mhz * 1000).round() * 1000;
}

/// Returns a human-readable band label from a frequency string in kHz.
/// Example: "14075" → "20m", "7074" → "40m"
String? bandFromFrequencyKhz(String freqKhz) {
  final khz = double.tryParse(freqKhz);
  if (khz == null) return null;
  final mhz = khz / 1000;

  if (mhz >= 1.8 && mhz < 2.0) return '160m';
  if (mhz >= 3.5 && mhz < 4.0) return '80m';
  if (mhz >= 5.3 && mhz < 5.5) return '60m';
  if (mhz >= 7.0 && mhz < 7.3) return '40m';
  if (mhz >= 10.1 && mhz < 10.15) return '30m';
  if (mhz >= 14.0 && mhz < 14.35) return '20m';
  if (mhz >= 18.068 && mhz < 18.168) return '17m';
  if (mhz >= 21.0 && mhz < 21.45) return '15m';
  if (mhz >= 24.89 && mhz < 24.99) return '12m';
  if (mhz >= 28.0 && mhz < 29.7) return '10m';
  if (mhz >= 50.0 && mhz < 54.0) return '6m';
  if (mhz >= 144.0 && mhz < 148.0) return '2m';
  if (mhz >= 420.0 && mhz < 450.0) return '70cm';

  return null;
}
