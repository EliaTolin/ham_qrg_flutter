import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/utils/map_utils.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/sheet/repeater_details_sheet.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Initial zoom level for the dashboard map
const double _dashboardMapZoom = 10.0;

class MapSectionWidget extends HookConsumerWidget {
  const MapSectionWidget({
    required this.nearbyRepeaters,
    super.key,
  });

  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);
    final userLocation = useState<({double lat, double lon})?>(null);

    // Get initial camera position (default to Italy center if no user location)
    final initialPosition = getInitialCameraPosition();

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
        // User Profile Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'IU1ABC',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        // My Location Button
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () async {
              if (mapController.value != null && userLocation.value != null) {
                await moveCameraToLocation(
                  mapController.value!,
                  userLocation.value!.lat,
                  userLocation.value!.lon,
                  zoom: _dashboardMapZoom,
                );
              }
            },
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            child: const Icon(Icons.my_location),
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

