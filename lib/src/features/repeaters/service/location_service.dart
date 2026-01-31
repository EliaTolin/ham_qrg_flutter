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

    final position = await Geolocator.getCurrentPosition();

    return (latitude: position.latitude, longitude: position.longitude);
  }
}

@riverpod
LocationService locationService(Ref ref) => LocationService();
