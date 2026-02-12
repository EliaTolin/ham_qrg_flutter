/// Utility to convert geographic coordinates to a 6-character
/// Maidenhead grid locator (e.g., JN54IO).
class MaidenheadLocator {
  MaidenheadLocator._();

  /// Converts latitude and longitude to a 6-character Maidenhead locator.
  ///
  /// Returns a string like `JN54IO`.
  static String fromCoordinates({
    required double latitude,
    required double longitude,
  }) {
    // Shift coordinates to positive range
    var lon = longitude + 180.0;
    var lat = latitude + 90.0;

    // Field (first pair): 18 zones of 20° lon × 10° lat
    final fieldLon = (lon / 20).floor();
    final fieldLat = (lat / 10).floor();
    lon -= fieldLon * 20;
    lat -= fieldLat * 10;

    // Square (second pair): 10 zones of 2° lon × 1° lat
    final squareLon = (lon / 2).floor();
    final squareLat = lat.floor();
    lon -= squareLon * 2;
    lat -= squareLat;

    // Subsquare (third pair): 24 zones of 5' lon × 2.5' lat
    final subLon = (lon / (2 / 24)).floor().clamp(0, 23);
    final subLat = (lat / (1 / 24)).floor().clamp(0, 23);

    return String.fromCharCodes([
      0x41 + fieldLon, // A-R
      0x41 + fieldLat, // A-R
      0x30 + squareLon, // 0-9
      0x30 + squareLat, // 0-9
      0x41 + subLon, // A-X (uppercase)
      0x41 + subLat, // A-X (uppercase)
    ]);
  }
}
