import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/sota_marker_helper.dart';
import 'package:hamqrg/common/widgets/units/map_scale_bar.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SotaLocationMap extends StatelessWidget {
  const SotaLocationMap({
    required this.summit,
    this.height = 150,
    super.key,
  });

  final SotaSummit summit;
  final double height;

  @override
  Widget build(BuildContext context) {
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
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
                        coordinates: Position(
                          summit.longitude,
                          summit.latitude,
                        ),
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
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .shadow
                        .withValues(alpha: 0.2),
                  ),
                ),
                const Center(child: _SotaMarker()),
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
      builder: (context) => _FullMapDialog(summit: summit),
    );
  }
}

class _FullMapDialog extends StatelessWidget {
  const _FullMapDialog({required this.summit});

  final SotaSummit summit;

  @override
  Widget build(BuildContext context) {
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(summit.name),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: MapWidget(
          viewport: CameraViewportState(
            center: Point(
              coordinates: Position(summit.longitude, summit.latitude),
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
            await _addSummitAnnotation(mapboxMap);
          },
        ),
      ),
    );
  }

  Future<void> _addSummitAnnotation(MapboxMap mapboxMap) async {
    try {
      await SotaMarkerHelper.addSotaStyleImage(mapboxMap);
      await SotaMarkerHelper.addSummitMarker(
        mapboxMap,
        latitude: summit.latitude,
        longitude: summit.longitude,
        name: summit.name,
      );
    } catch (e) {
      log('Error adding summit annotation: $e');
    }
  }
}

class _SotaMarker extends StatelessWidget {
  const _SotaMarker();

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
          'assets/images/sota_logo.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
