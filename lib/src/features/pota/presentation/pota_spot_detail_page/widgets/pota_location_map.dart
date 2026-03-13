import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class PotaLocationMap extends StatelessWidget {
  const PotaLocationMap({
    required this.park,
    this.height = 150,
    super.key,
  });

  final PotaPark park;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (park.latitude == null || park.longitude == null) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            Icons.map,
            size: 48,
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withValues(alpha: 0.3),
          ),
        ),
      );
    }

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              MapWidget(
                cameraOptions: CameraOptions(
                  center: Point(
                    coordinates:
                        Position(park.longitude!, park.latitude!),
                  ),
                  zoom: 13,
                  bearing: 0,
                  pitch: 0,
                ),
                styleUri: MapboxStyles.OUTDOORS,
                onMapCreated: (mapboxMap) async {
                  await mapboxMap.location.updateSettings(
                    LocationComponentSettings(enabled: false),
                  );
                },
              ),
              // Dark overlay
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ),
              // Park marker
              Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.shade700.withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.park,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
