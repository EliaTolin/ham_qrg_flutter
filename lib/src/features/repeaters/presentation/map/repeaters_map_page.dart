import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/widgets/mode_filter_chips_horizontal.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/utils/map_utils.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/info_banner.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/permission_banner.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/cluster_repeaters_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/repeater_details_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/summary_chip.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Initial zoom level for the map
const double _initialZoom = 8;

/// Debounce delay for camera changes (milliseconds)
const int _cameraDebounceMs = 500;

/// Zoom increment when clicking on a cluster
const double _clusterZoomIncrement = 1.5;

/// Maximum zoom level at which clustering is enabled.
/// Above this zoom level, all points are shown individually.
/// Lower value = less clustering (individual points shown earlier)
/// Higher value = more clustering (clusters persist longer when zooming)
///
/// Zoom level reference:
/// - 0-3: World/Continent view
/// - 4-6: Country view
/// - 7-9: Region/State view
/// - 10-12: City view
/// - 13-15: Neighborhood view
/// - 16-18: Street view
/// - 19+: Building view
const double _clusterMaxZoom = 6;

/// Radius in pixels within which points are clustered together.
/// Smaller value = tighter clusters (more clusters visible)
/// Larger value = looser clusters (fewer, bigger clusters)
const double _clusterRadius = 50;

@RoutePage()
class RepeatersMapPage extends HookConsumerWidget {
  const RepeatersMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<MapboxMap?>(null);
    final cameraChangeTimer = useRef<Timer?>(null);
    final isStyleLoaded = useState<bool>(false);

    final asyncState = ref.watch(repeatersMapControllerProvider);
    final notifier = ref.read(repeatersMapControllerProvider.notifier);
    final mapState = asyncState.value;

    if (asyncState.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (asyncState.hasError) {
      return Center(
        child: Text(asyncState.error.toString()),
      );
    }

    final data = asyncState.value;
    if (data == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    // Update GeoJSON source when repeaters change
    useEffect(
      () {
        if (mapController.value != null && isStyleLoaded.value) {
          _updateGeoJsonSource(mapController.value!, mapState!.repeaters);
        }
        return null;
      },
      [mapState?.repeaters, isStyleLoaded.value],
    );

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position(data.longitude!, data.latitude!),
              ),
              zoom: _initialZoom,
              bearing: 0,
              pitch: 0,
            ),
            styleUri: MapboxStyles.OUTDOORS,
            onCameraChangeListener: (cameraState) {
              _handleCameraChange(
                ref,
                mapController.value,
                cameraChangeTimer,
              );
            },
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              await _initializeMap(
                mapboxMap,
                ref,
                context,
                data.latitude != null && data.longitude != null,
              );
            },
            onStyleLoadedListener: (styleLoaded) async {
              if (mapController.value != null) {
                await _onStyleLoaded(mapController.value!, context, ref);
                isStyleLoaded.value = true;
              }
            },
            onTapListener: (gestureContext) async {
              if (mapController.value != null) {
                await _handleMapTap(
                  mapController.value!,
                  gestureContext,
                  ref,
                  context,
                );
              }
            },
          ),

          // Overlays (header, banners, chips, buttons)
          _buildOverlays(
            context,
            ref,
            asyncState,
            mapState,
            notifier,
            mapController.value,
          ),
        ],
      ),
    );
  }

  /// Handle camera changes with debounce
  void _handleCameraChange(
    WidgetRef ref,
    MapboxMap? map,
    ObjectRef<Timer?> timerRef,
  ) {
    if (map == null) return;

    timerRef.value?.cancel();
    timerRef.value = Timer(
      const Duration(milliseconds: _cameraDebounceMs),
      () async {
        try {
          await _loadRepeatersForVisibleBounds(ref, map);
        } catch (e) {
          // Ignore errors during camera movement
        }
      },
    );
  }

  /// Initialize map settings
  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    WidgetRef ref,
    BuildContext context,
    bool hasUserLocation,
  ) async {
    // Configure map settings
    await Future.wait([
      mapboxMap.scaleBar.updateSettings(ScaleBarSettings(enabled: false)),
      mapboxMap.compass.updateSettings(CompassSettings(enabled: false)),
      mapboxMap.gestures.updateSettings(
        GesturesSettings(pitchEnabled: false, rotateEnabled: false),
      ),
      mapboxMap.location.updateSettings(
        LocationComponentSettings(
          enabled: true,
          pulsingEnabled: true,
          showAccuracyRing: true,
        ),
      ),
    ]);

    // If we have user location, center map on it
    if (hasUserLocation) {
      final mapState = ref.read(repeatersMapControllerProvider).value;
      if (mapState?.latitude != null && mapState?.longitude != null) {
        await moveCameraToLocation(
          mapboxMap,
          mapState!.latitude!,
          mapState.longitude!,
          zoom: 10,
        );
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    // Load repeaters for visible bounds
    await _loadRepeatersForVisibleBounds(ref, mapboxMap);
  }

  /// Called when the map style is fully loaded
  Future<void> _onStyleLoaded(
    MapboxMap mapboxMap,
    BuildContext context,
    WidgetRef ref,
  ) async {
    await Future.wait([
      _addMarkerImages(mapboxMap),
      _addStyleLayers(mapboxMap),
    ]);

    // Update source with current repeaters
    final mapState = ref.read(repeatersMapControllerProvider).value;
    if (mapState != null) {
      await _updateGeoJsonSource(mapboxMap, mapState.repeaters);
    }
  }

  /// Add marker images to the map style.
  /// This is now a no-op since images are generated dynamically.
  Future<void> _addMarkerImages(MapboxMap mapboxMap) async {
    // Images are now generated dynamically based on access modes
    // in _addMarkerImagesForRepeaters
  }

  /// Add marker images for a list of repeaters based on their access modes
  Future<void> _addMarkerImagesForRepeaters(
    MapboxMap mapboxMap,
    List<Repeater> repeaters,
  ) async {
    try {
      // Collect unique access mode combinations
      final accessModeKeys = <String, List<AccessMode>>{};
      for (final repeater in repeaters) {
        final modes = repeater.accesses.map((a) => a.mode).toList();
        final key = RepeaterModeHelper.getAccessModesKey(modes);
        accessModeKeys.putIfAbsent(key, () => modes);
      }

      // Generate and add images for each unique combination
      for (final entry in accessModeKeys.entries) {
        final imageId = 'marker-${entry.key}';
        final exists = await mapboxMap.style.hasStyleImage(imageId);
        if (exists) continue;

        final iconBytes = await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
          entry.value,
        );

        final buffer = await ui.ImmutableBuffer.fromUint8List(iconBytes);
        final descriptor = await ui.ImageDescriptor.encoded(buffer);

        await mapboxMap.style.addStyleImage(
          imageId,
          1,
          MbxImage(
            width: descriptor.width,
            height: descriptor.height,
            data: iconBytes,
          ),
          false,
          [],
          [],
          null,
        );
      }
    } catch (e) {
      log('Error adding marker images: $e');
    }
  }

  /// Add style layers for clusters and points
  Future<void> _addStyleLayers(MapboxMap mapboxMap) async {
    try {
      // Check if layers already exist
      final clusterExists = await mapboxMap.style.styleLayerExists(
        MapKeys.clusterLayer,
      );

      if (!clusterExists) {
        await Future.wait([
          // Native Mapbox clusters
          _addLayerFromAsset(mapboxMap, MapLayers.clusterLayer),
          _addLayerFromAsset(mapboxMap, MapLayers.clusterCountLayer),
          // Synthetic same-location clusters
          _addLayerFromAsset(mapboxMap, MapLayers.sameLocationClusterLayer),
          _addLayerFromAsset(
            mapboxMap,
            MapLayers.sameLocationClusterCountLayer,
          ),
          // Individual points
          _addLayerFromAsset(mapboxMap, MapLayers.unclusteredPointLayer),
        ]);
      }
    } catch (e) {
      log('Error adding style layers: $e');
    }
  }

  /// Load and add a style layer from asset
  Future<void> _addLayerFromAsset(MapboxMap mapboxMap, String assetPath) async {
    try {
      final layerJson = await rootBundle.loadString(assetPath);
      await mapboxMap.style.addStyleLayer(layerJson, null);
    } catch (e) {
      log('Error adding layer from $assetPath: $e');
    }
  }

  /// Update or create the GeoJSON source with repeaters
  Future<void> _updateGeoJsonSource(
    MapboxMap mapboxMap,
    List<Repeater> repeaters,
  ) async {
    try {
      // Generate marker images for unique access mode combinations
      await _addMarkerImagesForRepeaters(mapboxMap, repeaters);

      final geoJson = _repeatersToGeoJson(repeaters);

      final sourceExists = await mapboxMap.style.styleSourceExists(
        MapKeys.repeatersSource,
      );

      if (!sourceExists) {
        await mapboxMap.style.addSource(
          GeoJsonSource(
            id: MapKeys.repeatersSource,
            cluster: true,
            clusterRadius: _clusterRadius,
            clusterMaxZoom: _clusterMaxZoom,
            data: geoJson,
          ),
        );
      } else {
        final source = await mapboxMap.style.getSource(MapKeys.repeatersSource) as GeoJsonSource?;
        if (source != null) {
          await source.updateGeoJSON(geoJson);
        }
      }
    } catch (e) {
      log('Error updating GeoJSON source: $e');
    }
  }

  /// Convert repeaters to GeoJSON format.
  /// Groups repeaters at identical coordinates into synthetic clusters.
  String _repeatersToGeoJson(List<Repeater> repeaters) {
    final validRepeaters = repeaters.where((r) => r.latitude != null && r.longitude != null);

    // Group repeaters by exact coordinates
    final groupedByCoords = <String, List<Repeater>>{};
    for (final repeater in validRepeaters) {
      final key = '${repeater.latitude}_${repeater.longitude}';
      groupedByCoords.putIfAbsent(key, () => []).add(repeater);
    }

    final features = <Map<String, dynamic>>[];

    for (final entry in groupedByCoords.entries) {
      final repeatersAtLocation = entry.value;
      final first = repeatersAtLocation.first;

      if (repeatersAtLocation.length == 1) {
        // Generate marker key based on access modes
        final accessModes = first.accesses.map((a) => a.mode).toList();
        final markerKey = 'marker-${RepeaterModeHelper.getAccessModesKey(accessModes)}';

        // Use callsign as label, fallback to name
        final label = first.callsign ?? first.name ?? '';

        // Single repeater - normal feature
        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [first.longitude, first.latitude],
          },
          'properties': {
            'id': first.id,
            'callsign': first.callsign,
            'locality': first.locality,
            'frequencyHz': first.frequencyHz,
            'mode': first.mode.name,
            'latitude': first.latitude,
            'longitude': first.longitude,
            'marker_key': markerKey,
            'label': label,
          },
        });
      } else {
        // Multiple repeaters at same location - create synthetic cluster
        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [first.longitude, first.latitude],
          },
          'properties': {
            // These properties make Mapbox render it as a cluster
            'point_count': repeatersAtLocation.length,
            'point_count_abbreviated': repeatersAtLocation.length.toString(),
            // Custom properties for tap handling
            'is_same_location_cluster': true,
            'cluster_repeater_ids': repeatersAtLocation.map((r) => r.id).toList(),
            'latitude': first.latitude,
            'longitude': first.longitude,
          },
        });
      }
    }

    return jsonEncode({
      'type': 'FeatureCollection',
      'features': features,
    });
  }

  /// Handle tap on the map
  Future<void> _handleMapTap(
    MapboxMap mapboxMap,
    MapContentGestureContext gestureContext,
    WidgetRef ref,
    BuildContext context,
  ) async {
    if (!context.mounted) return;

    try {
      final screenCoordinate = await mapboxMap.pixelForCoordinate(
        gestureContext.point,
      );

      if (!context.mounted) return;

      // First check for cluster tap
      final clusterHandled = await _handleClusterTap(
        mapboxMap,
        screenCoordinate,
        ref,
        context,
      );
      if (clusterHandled) return;

      if (!context.mounted) return;

      // Then check for single point tap
      await _handlePointTap(mapboxMap, screenCoordinate, ref, context);
    } catch (e) {
      log('Error handling map tap: $e');
    }
  }

  /// Handle tap on a cluster (native Mapbox cluster or synthetic same-location cluster)
  Future<bool> _handleClusterTap(
    MapboxMap mapboxMap,
    ScreenCoordinate screenCoordinate,
    WidgetRef ref,
    BuildContext context,
  ) async {
    try {
      // First check for synthetic same-location clusters
      final sameLocationFeatures = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.sameLocationClusterLayer]),
      );

      if (sameLocationFeatures.isNotEmpty) {
        final feature = sameLocationFeatures.first;
        if (feature != null) {
          final featureMap = feature.queriedFeature.feature as Map<dynamic, dynamic>;
          final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
          final clusterIds = properties?['cluster_repeater_ids'] as List<dynamic>?;

          if (clusterIds != null && clusterIds.isNotEmpty) {
            final repeaters = _extractRepeatersFromIds(
              clusterIds.cast<String>(),
              ref,
            );
            if (repeaters.isNotEmpty && context.mounted) {
              showClusterRepeatersSheet(context, repeaters);
            }
          }
          return true;
        }
      }

      // Then check for native Mapbox clusters
      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.clusterLayer]),
      );

      if (features.isEmpty) return false;

      final feature = features.first;
      if (feature == null) return false;

      final featureMap = feature.queriedFeature.feature as Map<dynamic, dynamic>;

      // Native Mapbox cluster - use getGeoJsonClusterLeaves
      final clusterLeaves = await mapboxMap.getGeoJsonClusterLeaves(
        feature.queriedFeature.source,
        feature.queriedFeature.feature,
        null,
        null,
      );

      final leaves = clusterLeaves.featureCollection ?? [];

      // Check if all points are at the same coordinates
      final uniqueCoordinates = <String>{};
      for (final leaf in leaves) {
        if (leaf != null) {
          final geometry = leaf['geometry'] as Map<dynamic, dynamic>?;
          if (geometry != null) {
            final coords = geometry['coordinates'] as List<dynamic>?;
            if (coords != null && coords.length >= 2) {
              uniqueCoordinates.add('${coords[0]}_${coords[1]}');
            }
          }
        }
      }

      if (uniqueCoordinates.length == 1 && leaves.isNotEmpty) {
        // All repeaters at same location - show list
        final repeaters = _extractRepeatersFromLeaves(leaves, ref);
        if (repeaters.isNotEmpty && context.mounted) {
          showClusterRepeatersSheet(context, repeaters);
        }
        return true;
      } else {
        // Different locations - zoom in
        final cameraState = await mapboxMap.getCameraState();
        final geometry = featureMap['geometry'] as Map<dynamic, dynamic>?;
        if (geometry != null) {
          final coords = geometry['coordinates'] as List<dynamic>?;
          if (coords != null && coords.length >= 2) {
            await mapboxMap.flyTo(
              CameraOptions(
                center: Point(
                  coordinates: Position(
                    (coords[0] as num).toDouble(),
                    (coords[1] as num).toDouble(),
                  ),
                ),
                zoom: cameraState.zoom + _clusterZoomIncrement,
              ),
              MapAnimationOptions(duration: 300),
            );
          }
        }
        return true;
      }
    } catch (e) {
      log('Error handling cluster tap: $e');
      return false;
    }
  }

  /// Extract repeaters from a list of IDs
  List<Repeater> _extractRepeatersFromIds(
    List<String> ids,
    WidgetRef ref,
  ) {
    final currentState = ref.read(repeatersMapControllerProvider).value;
    if (currentState == null) return [];

    return currentState.repeaters.where((r) => ids.contains(r.id)).toList();
  }

  /// Extract repeaters from cluster leaves
  List<Repeater> _extractRepeatersFromLeaves(
    List<Map<dynamic, dynamic>?> leaves,
    WidgetRef ref,
  ) {
    final currentState = ref.read(repeatersMapControllerProvider).value;
    if (currentState == null) return [];

    final repeaterIds = <String>[];
    for (final leaf in leaves) {
      if (leaf != null) {
        final properties = leaf['properties'] as Map<dynamic, dynamic>?;
        if (properties != null) {
          final id = properties['id'] as String?;
          if (id != null) {
            repeaterIds.add(id);
          }
        }
      }
    }

    return currentState.repeaters.where((r) => repeaterIds.contains(r.id)).toList();
  }

  /// Handle tap on a single point
  Future<void> _handlePointTap(
    MapboxMap mapboxMap,
    ScreenCoordinate screenCoordinate,
    WidgetRef ref,
    BuildContext context,
  ) async {
    try {
      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.unclusteredPointLayer]),
      );

      if (features.isEmpty) return;

      final feature = features.first;
      if (feature == null) return;

      final featureMap = feature.queriedFeature.feature as Map<dynamic, dynamic>;
      final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
      if (properties == null) return;

      final repeaterId = properties['id'] as String?;
      if (repeaterId == null) return;

      final currentState = ref.read(repeatersMapControllerProvider).value;
      if (currentState == null) return;

      // Center on the point
      final geometry = featureMap['geometry'] as Map<dynamic, dynamic>?;
      if (geometry != null) {
        final coords = geometry['coordinates'] as List<dynamic>?;
        if (coords != null && coords.length >= 2) {
          await mapboxMap.flyTo(
            CameraOptions(
              center: Point(
                coordinates: Position(
                  (coords[0] as num).toDouble(),
                  (coords[1] as num).toDouble(),
                ),
              ),
            ),
            MapAnimationOptions(duration: 200),
          );
        }
      }

      if (context.mounted) {
        await showRepeaterDetailsSheet(context, repeaterId);
      }
    } catch (e) {
      log('Error handling point tap: $e');
    }
  }

  /// Load repeaters based on visible map bounds
  Future<void> _loadRepeatersForVisibleBounds(
    WidgetRef ref,
    MapboxMap map,
  ) async {
    try {
      final bounds = await _getVisibleBounds(map);
      final controller = ref.read(repeatersMapControllerProvider.notifier);
      await controller.loadRepeatersFromBounds(
        lat1: bounds.lat1,
        lon1: bounds.lon1,
        lat2: bounds.lat2,
        lon2: bounds.lon2,
      );
    } catch (e) {
      // Ignore errors
    }
  }

  /// Build overlay widgets (header, banners, chips, buttons)
  Widget _buildOverlays(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<RepeatersMapState> asyncState,
    RepeatersMapState? mapState,
    RepeatersMapController notifier,
    MapboxMap? mapController,
  ) {
    return Stack(
      children: [
        // Header with gradient and filters
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: ModeFilterChipsHorizontal(
              allLabel: context.localization.repeaterModeAllmode,
              selectedModes: mapState?.selectedModes ?? {},
              onModeToggled: (mode) async {
                if (mapController != null) {
                  final visibleBounds = await _getVisibleBounds(mapController);
                  await notifier.toggleModeFilter(
                    lat1: visibleBounds.lat1,
                    lon1: visibleBounds.lon1,
                    lat2: visibleBounds.lat2,
                    lon2: visibleBounds.lon2,
                    mode: mode,
                  );
                }
              },
              onAllSelected: () async {
                if (mapController != null) {
                  final visibleBounds = await _getVisibleBounds(mapController);
                  await notifier.clearAllModes(
                    lat1: visibleBounds.lat1,
                    lon1: visibleBounds.lon1,
                    lat2: visibleBounds.lat2,
                    lon2: visibleBounds.lon2,
                  );
                }
              },
            ),
          ),
        ),
        // Error banners
        if (mapState?.locationError != null)
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SafeArea(
              child: PermissionBanner(
                errorType: mapState!.locationError!,
                onRetry: () async {
                  ref.invalidate(repeatersMapControllerProvider);
                },
              ),
            ),
          ),
        if (asyncState.hasError && mapState?.locationError == null)
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SafeArea(
              child: InfoBanner(
                icon: const Icon(Icons.warning_amber_rounded),
                label: context.localization.repeatersMapGenericError,
              ),
            ),
          ),
        if (!asyncState.isLoading && (mapState?.repeaters.isEmpty ?? false))
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SafeArea(
              child: InfoBanner(
                icon: const Icon(Icons.location_off_outlined),
                label: context.localization.repeatersMapEmpty,
              ),
            ),
          ),
        // Summary chip
        if (mapState?.repeaters.isNotEmpty ?? false)
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SafeArea(
              child: SummaryChip(
                count: mapState!.repeaters.length,
              ),
            ),
          ),
      ],
    );
  }
}

Future<({double lat1, double lon1, double lat2, double lon2})> _getVisibleBounds(
  MapboxMap map,
) async {
  final bounds = await map.coordinateBoundsForCamera(
    CameraOptions(
      center: await map.getCameraState().then((s) => s.center),
      zoom: await map.getCameraState().then((s) => s.zoom),
    ),
  );
  final sw = bounds.southwest.coordinates;
  final ne = bounds.northeast.coordinates;
  return (
    lat1: sw[1]!.toDouble(),
    lon1: sw[0]!.toDouble(),
    lat2: ne[1]!.toDouble(),
    lon2: ne[0]!.toDouble()
  );
}
