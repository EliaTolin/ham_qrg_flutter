import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

enum LocationErrorType {
  servicesDisabled,
  permissionDenied,
  permissionPermanentlyDenied,
}

class LocationException implements Exception {
  const LocationException(this.type);

  final LocationErrorType type;
}

class LocationService {
  /// Rome
  static const defaultLatitude = 41.9028;
  static const defaultLongitude = 12.4964;

  /// Returns the current position, falling back to Rome if location
  /// services or permissions are unavailable.
  Future<({double latitude, double longitude})> getCurrentPositionOrDefault() async {
    try {
      return await getCurrentPosition();
    } catch (_) {
      return (latitude: defaultLatitude, longitude: defaultLongitude);
    }
  }

  Future<({double latitude, double longitude})> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationException(LocationErrorType.servicesDisabled);
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw const LocationException(LocationErrorType.permissionDenied);
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(
        LocationErrorType.permissionPermanentlyDenied,
      );
    }

    // Try last known position first for instant results
    final lastKnown = await Geolocator.getLastKnownPosition();
    if (lastKnown != null) {
      return (latitude: lastKnown.latitude, longitude: lastKnown.longitude);
    }

    // Fall back to current position with timeout to avoid hanging forever
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        timeLimit: Duration(seconds: 10),
      ),
    );

    return (latitude: position.latitude, longitude: position.longitude);
  }
}

@riverpod
LocationService locationService(Ref ref) => LocationService();

/// Cached user position — fetched once and shared across providers/pages.
@Riverpod(keepAlive: true)
Future<({double latitude, double longitude})> cachedUserPosition(
  Ref ref,
) async {
  return ref.read(locationServiceProvider).getCurrentPositionOrDefault();
}
