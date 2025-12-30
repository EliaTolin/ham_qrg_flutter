import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/utils/map_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapSectionWidget extends HookConsumerWidget {
  const MapSectionWidget({
    required this.nearbyRepeaters,
    required this.initialPosition,
    super.key,
  });

  final List<Repeater> nearbyRepeaters;
  final ({double lat, double lon, double zoom}) initialPosition;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('MAP SECTION RECEIVED REPEATERS: ${nearbyRepeaters.length}');
    for (final repeater in nearbyRepeaters) {
      log('REPEATER: ${repeater.callsign}');
    }
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);

    // Sync annotations when repeaters change
    useEffect(
      () {
        if (mapController.value != null && pointManager.value != null) {
          _syncAnnotations(
            pointManager.value!,
            nearbyRepeaters,
          );
        }
        return null;
      },
      [nearbyRepeaters],
    );

    return Stack(
      children: [
        // Mapbox Map
        MapWidget(
          cameraOptions: CameraOptions(
            center: Point(
              coordinates: Position(initialPosition.lon, initialPosition.lat),
            ),
            zoom: initialPosition.zoom,
            bearing: 0,
            pitch: 0,
          ),
          styleUri: MapboxStyles.OUTDOORS,
          onMapCreated: (mapboxMap) async {
            await _initializeMap(
              mapboxMap,
              mapController,
              pointManager,
              ref,
              context,
            );
          },
        ),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.6),
                Colors.transparent,
                Colors.transparent,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              stops: const [0.0, 0.2, 0.8, 1.0],
            ),
          ),
        ),
      ],
    );
  }

  /// Initialize map and load annotations
  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    ValueNotifier<MapboxMap?> mapController,
    ValueNotifier<PointAnnotationManager?> pointManager,
    WidgetRef ref,
    BuildContext context,
  ) async {
    mapController.value = mapboxMap;

    // Create annotation manager
    final manager = await mapboxMap.annotations.createPointAnnotationManager();
    pointManager.value = manager;

    // Setup tap listener for annotations
    manager.tapEvents(
      onTap: (annotation) {
        final repeaterId = annotation.customData?['repeaterId'] as String?;
        if (repeaterId != null) {
          try {
            final repeater = nearbyRepeaters.firstWhere(
              (r) => r.id == repeaterId,
            );
            showRepeaterDetails(context, repeater);
          } catch (e) {
            log('ERROR: $e');
            // Repeater not found, ignore
          }
        }
      },
    );

    // Enable location component
    await mapboxMap.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
        showAccuracyRing: true,
      ),
    );

    // Load annotations
    await _syncAnnotations(manager, nearbyRepeaters);
  }

  /// Sync annotations on map
  Future<void> _syncAnnotations(
    PointAnnotationManager manager,
    List<Repeater> repeaters,
  ) async {
    try {
      await manager.deleteAll();
      if (repeaters.isEmpty) return;

      final annotations = <PointAnnotationOptions>[];
      for (final repeater in repeaters) {
        final lat = repeater.latitude;
        final lon = repeater.longitude;
        if (lat == null || lon == null) continue;

        final iconBytes = await RepeaterModeHelper.generateRepeaterIcon(repeater.mode);
        annotations.add(
          PointAnnotationOptions(
            geometry: Point(coordinates: Position(lon, lat)),
            image: iconBytes,
            iconSize: 1.2,
            iconAnchor: IconAnchor.BOTTOM,
            customData: {'repeaterId': repeater.id},
          ),
        );
      }

      if (annotations.isNotEmpty) {
        await manager.createMulti(annotations);
      }
    } catch (e) {
      // Ignore errors if map is not fully initialized yet
    }
  }
}
