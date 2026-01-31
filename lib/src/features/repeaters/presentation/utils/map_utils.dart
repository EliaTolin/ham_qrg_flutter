import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/repeater_details_sheet.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Move camera to specified location
Future<void> moveCameraToLocation(
  MapboxMap map,
  double latitude,
  double longitude, {
  double zoom = 8.5,
}) {
  return map.easeTo(
    CameraOptions(
      center: Point(
        coordinates: Position(longitude, latitude),
      ),
      zoom: zoom,
      bearing: 0,
      pitch: 0,
    ),
    MapAnimationOptions(duration: 800),
  );
}

/// Show repeater details in a bottom sheet
void showRepeaterDetails(BuildContext context, String repeaterId) {
  showRepeaterDetailsSheet(context, repeaterId);
}
