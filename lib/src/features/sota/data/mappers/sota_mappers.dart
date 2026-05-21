import 'dart:math' as math;

import 'package:hamqrg/src/features/sota/data/model/sota_spot_model.dart';
import 'package:hamqrg/src/features/sota/data/model/sota_summit_model.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';

enum AltitudeBand { low, mid, high }

class SotaMappers {
  /// Maps a SOTA spot DTO to the domain entity. Returns `null` when the
  /// spot lacks a usable frequency — the SOTA API occasionally posts spots
  /// with `frequency: null` (typically administrative/test entries) which
  /// would not be actionable for an operator.
  SotaSpot? spotFromModel(SotaSpotModel model) {
    final id = model.id;
    final freq = model.frequency;
    if (id == null) return null;
    if (freq == null) return null;
    final activator = model.activatorCallsign;
    final summitCode = model.summitCode;
    if (activator == null || activator.isEmpty) return null;
    if (summitCode == null || summitCode.isEmpty) return null;
    final summitName = model.summitName;
    return SotaSpot(
      id: id,
      timestamp:
          DateTime.tryParse(model.timeStamp ?? '')?.toLocal() ?? DateTime.now(),
      activator: activator,
      activatorName: model.activatorName,
      summitCode: summitCode,
      summitName:
          summitName == null || summitName.isEmpty ? summitCode : summitName,
      altitudeM: model.altM ?? 0,
      altitudeFt: model.altFt ?? 0,
      points: model.points ?? 0,
      frequencyMhz: freq,
      mode: model.mode ?? '',
      comments: model.comments,
      type: _parseType(model.type),
      spotter: model.callsign,
    );
  }

  SotaSummit summitFromModel(SotaSummitModel model) {
    final notes = model.notes;
    return SotaSummit(
      code: model.summitCode,
      name: model.name,
      associationName: model.associationName,
      associationCode: model.associationCode,
      regionName: model.regionName,
      regionCode: model.regionCode,
      latitude: model.latitude,
      longitude: model.longitude,
      altitudeM: model.altM,
      altitudeFt: model.altFt,
      points: model.points,
      locator: model.locator,
      validFrom: DateTime.tryParse(model.validFrom) ?? DateTime(2000),
      validTo: DateTime.tryParse(model.validTo) ?? DateTime(2099),
      valid: model.valid,
      hasRestrictions: model.restrictionMask,
      restrictions: model.restrictionList,
      notes: notes == null || notes.isEmpty ? null : notes,
    );
  }

  static SotaSpotType _parseType(String? raw) {
    switch (raw?.toUpperCase()) {
      case 'QRT':
        return SotaSpotType.qrt;
      default:
        return SotaSpotType.normal;
    }
  }
}

/// Returns a band label from a frequency in MHz, e.g. 14.075 → "20m".
String? bandFromFrequencyMhz(double mhz) {
  if (mhz <= 0) return null;
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

/// Returns the altitude band {low, mid, high} for a summit in meters.
AltitudeBand altitudeBand(int meters) {
  if (meters >= 2000) return AltitudeBand.high;
  if (meters >= 1000) return AltitudeBand.mid;
  return AltitudeBand.low;
}

/// Extracts the SOTA association code from a summit code like "I/PM-272" → "I".
String associationFromSummitCode(String summitCode) {
  final idx = summitCode.indexOf('/');
  if (idx <= 0) return summitCode;
  return summitCode.substring(0, idx);
}

/// Initial bearing in degrees [0, 360) from point A to point B (great circle).
double bearingDegrees(
  double fromLat,
  double fromLon,
  double toLat,
  double toLon,
) {
  final lat1 = _toRad(fromLat);
  final lat2 = _toRad(toLat);
  final dLon = _toRad(toLon - fromLon);
  final y = math.sin(dLon) * math.cos(lat2);
  final x = math.cos(lat1) * math.sin(lat2) -
      math.sin(lat1) * math.cos(lat2) * math.cos(dLon);
  final theta = math.atan2(y, x);
  return (theta * 180 / math.pi + 360) % 360;
}

/// Haversine great-circle distance in km between two coordinates.
double distanceKm(
  double fromLat,
  double fromLon,
  double toLat,
  double toLon,
) {
  const r = 6371.0;
  final dLat = _toRad(toLat - fromLat);
  final dLon = _toRad(toLon - fromLon);
  final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_toRad(fromLat)) *
          math.cos(_toRad(toLat)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  return r * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
}

double _toRad(double deg) => deg * math.pi / 180;
