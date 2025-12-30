import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Calculate distance from user location and determine if "return to location" button should show
bool useShouldShowLocationButton(
  MapboxMap? map,
  ({double lat, double lon})? userLocation,
) {
  final showButton = useState<bool>(false);
  final lastCenterRef = useRef<({double lat, double lon})?>(null);

  useEffect(
    () {
      if (map == null || userLocation == null) {
        showButton.value = false;
        return null;
      }

      Future<void> checkDistance() async {
        try {
          final cameraState = await map.getCameraState();
          final centerCoords = cameraState.center.coordinates;
          final centerLat = centerCoords[1]!.toDouble();
          final centerLon = centerCoords[0]!.toDouble();

          // Only update if center changed significantly
          final lastCenter = lastCenterRef.value;
          if (lastCenter != null &&
              (lastCenter.lat - centerLat).abs() < 0.001 &&
              (lastCenter.lon - centerLon).abs() < 0.001) {
            return;
          }

          lastCenterRef.value = (lat: centerLat, lon: centerLon);

          final distance = geo.Geolocator.distanceBetween(
            userLocation.lat,
            userLocation.lon,
            centerLat,
            centerLon,
          );

          showButton.value = distance > 500;
        } catch (e) {
          // Ignore errors
        }
      }

      // Check periodically
      final timer =
          Timer.periodic(const Duration(seconds: 2), (_) => checkDistance());
      checkDistance(); // Initial check

      return timer.cancel;
    },
    [map, userLocation],
  );

  return showButton.value;
}
