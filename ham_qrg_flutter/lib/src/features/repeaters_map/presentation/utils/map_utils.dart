import 'package:flutter/material.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/sheet/repeater_details_sheet.dart';
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
void showRepeaterDetails(BuildContext context, Repeater repeater) {
  showModalBottomSheet(
    context: context,
    builder: (context) => RepeaterDetailsSheet(repeater: repeater),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}
