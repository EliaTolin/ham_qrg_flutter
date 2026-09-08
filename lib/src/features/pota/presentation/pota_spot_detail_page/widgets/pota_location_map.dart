import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/pota_marker_helper.dart';
import 'package:hamqrg/common/widgets/units/map_scale_bar.dart';
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
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
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

    return GestureDetector(
      onTap: () => _showFullMap(context),
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                IgnorePointer(
                  child: MapWidget(
                    viewport: CameraViewportState(
                      center: Point(
                        coordinates: Position(park.longitude!, park.latitude!),
                      ),
                      zoom: 13,
                      bearing: 0,
                      pitch: 0,
                    ),
                    styleUri: MapboxStyles.OUTDOORS,
                    onMapCreated: (mapboxMap) async {
                      await applyUnitAwareScaleBar(
                        mapboxMap,
                        isImperial: isImperial,
                      );
                      await mapboxMap.location.updateSettings(
                        LocationComponentSettings(enabled: false),
                      );
                    },
                  ),
                ),
                // Dark overlay
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .shadow
                        .withValues(alpha: 0.2),
                  ),
                ),
                // Park marker
                Center(
                  child: _PotaMarker(),
                ),
                // Expand hint
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.fullscreen,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFullMap(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => _FullMapDialog(park: park),
    );
  }
}

class _FullMapDialog extends StatelessWidget {
  const _FullMapDialog({required this.park});

  final PotaPark park;

  @override
  Widget build(BuildContext context) {
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(park.name),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: MapWidget(
          viewport: CameraViewportState(
            center: Point(
              coordinates: Position(park.longitude!, park.latitude!),
            ),
            zoom: 14,
            bearing: 0,
            pitch: 0,
          ),
          styleUri: MapboxStyles.OUTDOORS,
          onMapCreated: (mapboxMap) async {
            await applyUnitAwareScaleBar(
              mapboxMap,
              isImperial: isImperial,
            );
            await mapboxMap.location.updateSettings(
              LocationComponentSettings(
                enabled: true,
                showAccuracyRing: true,
              ),
            );
            await _addParkAnnotation(mapboxMap);
          },
        ),
      ),
    );
  }

  Future<void> _addParkAnnotation(MapboxMap mapboxMap) async {
    try {
      await PotaMarkerHelper.addPotaStyleImage(mapboxMap);
      await PotaMarkerHelper.addParkMarker(
        mapboxMap,
        latitude: park.latitude!,
        longitude: park.longitude!,
        name: park.name,
      );
    } catch (e) {
      log('Error adding park annotation: $e');
    }
  }
}

class _PotaMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.25),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/images/pota_logo.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
