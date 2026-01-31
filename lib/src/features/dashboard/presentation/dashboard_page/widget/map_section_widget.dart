import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/utils/map_utils.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/cluster_repeaters_sheet.dart';
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
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);
    final initialSyncDone = useRef(false);

    // Sync annotations when repeaters change (skip the initial sync
    // since _initializeMap already handles it)
    useEffect(
      () {
        if (mapController.value != null && pointManager.value != null) {
          if (initialSyncDone.value) {
            _syncAnnotations(
              pointManager.value!,
              nearbyRepeaters,
            );
          } else {
            initialSyncDone.value = true;
          }
        }
        return null;
      },
      [nearbyRepeaters],
    );

    // Check if is dark or light mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return IgnorePointer(
      child: Stack(
        children: [
          // Mapbox Map (light/grey style)
          MapWidget(
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position(initialPosition.lon, initialPosition.lat),
              ),
              zoom: initialPosition.zoom,
              bearing: 0,
              pitch: 0,
            ),
            styleUri: isDarkMode ? MapboxStyles.DARK : MapboxStyles.LIGHT,
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
      ),
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
        // Check if this is a cluster marker
        final clusterKey = annotation.customData?['clusterKey'] as String?;
        if (clusterKey != null) {
          // Find all repeaters at this location
          final clusterRepeaters = nearbyRepeaters.where((r) {
            if (r.latitude == null || r.longitude == null) return false;
            final key = '${r.latitude}_${r.longitude}';
            return key == clusterKey;
          }).toList();

          if (clusterRepeaters.isNotEmpty) {
            showClusterRepeatersSheet(context, clusterRepeaters);
          }
          return;
        }

        // Single repeater marker
        final repeaterId = annotation.customData?['repeaterId'] as String?;
        if (repeaterId != null) {
          showRepeaterDetails(context, repeaterId);
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

  /// Sync annotations on map with clustering for overlapping coordinates
  Future<void> _syncAnnotations(
    PointAnnotationManager manager,
    List<Repeater> repeaters,
  ) async {
    try {
      await manager.deleteAll();
      if (repeaters.isEmpty) return;

      // Group repeaters by coordinates
      final groupedRepeaters = <String, List<Repeater>>{};
      for (final repeater in repeaters) {
        final lat = repeater.latitude;
        final lon = repeater.longitude;
        if (lat == null || lon == null) continue;

        final key = '${lat}_$lon';
        groupedRepeaters.putIfAbsent(key, () => []).add(repeater);
      }

      final annotations = <PointAnnotationOptions>[];

      for (final entry in groupedRepeaters.entries) {
        final repeatersAtLocation = entry.value;
        final firstRepeater = repeatersAtLocation.first;
        final lat = firstRepeater.latitude;
        final lon = firstRepeater.longitude;

        if (repeatersAtLocation.length == 1) {
          // Single repeater - use marker with access mode segments
          final accessModes = firstRepeater.accesses.map((a) => a.mode).toList();
          final iconBytes = await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
            accessModes,
          );
          if (lon == null || lat == null) return;
          annotations.add(
            PointAnnotationOptions(
              geometry: Point(coordinates: Position(lon, lat)),
              image: iconBytes,
              iconSize: 1.2,
              iconAnchor: IconAnchor.CENTER,
              customData: {'repeaterId': firstRepeater.id},
            ),
          );
        } else {
          // Multiple repeaters - use cluster marker
          final iconBytes = await RepeaterModeHelper.generateClusterIcon(
            repeatersAtLocation.length,
          );
          if (lon == null || lat == null) return;
          annotations.add(
            PointAnnotationOptions(
              geometry: Point(coordinates: Position(lon, lat)),
              image: iconBytes,
              iconSize: 1.2,
              iconAnchor: IconAnchor.BOTTOM,
              customData: {'clusterKey': entry.key},
            ),
          );
        }
      }

      if (annotations.isNotEmpty) {
        await manager.createMulti(annotations);
      }
    } catch (e) {
      // Ignore errors if map is not fully initialized yet
    }
  }
}
