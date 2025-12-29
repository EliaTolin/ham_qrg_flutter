import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/map/controller/repeaters_map_controller.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/utils/map_utils.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/info_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/mode_filter_chips.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/permission_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/summary_chip.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Initial zoom level for the map (configurable)
const double _initialZoom = 8;

/// Debounce delay for camera changes (milliseconds)
const int _cameraDebounceMs = 500;

@RoutePage()
class RepeatersMapPage extends HookConsumerWidget {
  const RepeatersMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);
    final cameraChangeTimer = useRef<Timer?>(null);
    final userLocation = useState<({double lat, double lon})?>(null);
    final showLocationButton = useState<bool>(false);

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
    // Sync annotations when repeaters change
    useEffect(
      () {
        if (mapController.value != null && pointManager.value != null) {
          _syncAnnotations(
            pointManager.value!,
            mapState!.repeaters,
          );
        }
        return null;
      },
      [mapState?.repeaters],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.repeatersMapTitle),
      ),
      body: Stack(
        children: [
          MapWidget(
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: Position(data.longitude!, data.latitude!),
              ),
              zoom: _initialZoom, // Zoom closer if we have user location
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
              await _initializeMap(
                mapboxMap,
                mapController,
                pointManager,
                ref,
                context,
                data.latitude != null && data.longitude != null,
              );
            },
          ),

          // Overlays (banners, chips, buttons)
          _buildOverlays(
            context,
            ref,
            asyncState,
            mapState,
            notifier,
            showLocationButton.value,
            mapController.value,
            userLocation.value,
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

  /// Initialize map and load initial repeaters
  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    ValueNotifier<MapboxMap?> mapController,
    ValueNotifier<PointAnnotationManager?> pointManager,
    WidgetRef ref,
    BuildContext context,
    bool hasUserLocation,
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
          final currentState = ref.read(repeatersMapControllerProvider).value;
          if (currentState != null) {
            try {
              final repeater = currentState.repeaters.firstWhere(
                (r) => r.id == repeaterId,
              );
              showRepeaterDetails(context, repeater);
            } catch (e) {
              // Repeater not found, ignore
            }
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

    // If we have user location, center map on it first
    if (hasUserLocation) {
      final mapState = ref.read(repeatersMapControllerProvider).value;
      if (mapState?.latitude != null && mapState?.longitude != null) {
        await moveCameraToLocation(
          mapboxMap,
          mapState!.latitude!,
          mapState.longitude!,
          zoom: 10,
        );
        // Wait for camera animation to complete
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    // Load repeaters for visible bounds after map is ready
    await _loadRepeatersForVisibleBounds(ref, mapboxMap);
  }

  /// Load repeaters based on visible map bounds
  Future<void> _loadRepeatersForVisibleBounds(
    WidgetRef ref,
    MapboxMap map,
  ) async {
    try {
      // Get visible bounds from map
      final bounds = await map.coordinateBoundsForCamera(
        CameraOptions(
          center: await map.getCameraState().then((s) => s.center),
          zoom: await map.getCameraState().then((s) => s.zoom),
        ),
      );

      // Extract coordinates from bounds
      final sw = bounds.southwest.coordinates;
      final ne = bounds.northeast.coordinates;

      final lat1 = sw[1]!.toDouble();
      final lon1 = sw[0]!.toDouble();
      final lat2 = ne[1]!.toDouble();
      final lon2 = ne[0]!.toDouble();

      // Load repeaters
      final controller = ref.read(repeatersMapControllerProvider.notifier);
      await controller.loadRepeatersFromBounds(
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
      );
    } catch (e) {
      // Ignore errors
    }
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

  /// Build overlay widgets (banners, chips, buttons)
  Widget _buildOverlays(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<RepeatersMapState> asyncState,
    RepeatersMapState? mapState,
    RepeatersMapController notifier,
    bool showLocationButton,
    MapboxMap? mapController,
    ({double lat, double lon})? userLocation,
  ) {
    return Stack(
      children: [
        // Error banners
        if (mapState?.locationError != null)
          PermissionBanner(
            errorType: mapState!.locationError!,
            onRetry: () async {
              ref.invalidate(repeatersMapControllerProvider);
            },
          ),
        if (asyncState.hasError && mapState?.locationError == null)
          InfoBanner(
            icon: const Icon(Icons.warning_amber_rounded),
            label: context.localization.repeatersMapGenericError,
          ),
        if (!asyncState.isLoading && (mapState?.repeaters.isEmpty ?? false))
          InfoBanner(
            icon: const Icon(Icons.location_off_outlined),
            label: context.localization.repeatersMapEmpty,
          ),
        // Summary chip
        if (mapState?.repeaters.isNotEmpty ?? false)
          Positioned(
            top: 32,
            left: 12,
            right: 12,
            child: SafeArea(
              child: SummaryChip(
                count: mapState!.repeaters.length,
              ),
            ),
          ),
        // Mode filter chips
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: SafeArea(
            child: ModeFilterChips(
              selectedModes: mapState?.selectedModes ?? {},
              onModeToggled: (mode) async {
                final visibleBounds = await _getVisibleBounds(mapController!);
                await notifier.toggleModeFilter(
                  lat1: visibleBounds.lat1,
                  lon1: visibleBounds.lon1,
                  lat2: visibleBounds.lat2,
                  lon2: visibleBounds.lon2,
                  mode: mode,
                );
              },
            ),
          ),
        ),
        // Return to location button
        if (showLocationButton && userLocation != null && mapController != null)
          Positioned(
            bottom: 100,
            right: 16,
            child: SafeArea(
              child: FloatingActionButton(
                onPressed: () => _handleReturnToLocation(
                  ref,
                  mapController,
                  userLocation,
                ),
                tooltip: 'Torna alla mia posizione',
                child: const Icon(Icons.my_location),
              ),
            ),
          ),
      ],
    );
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

  /// Handle return to user location
  Future<void> _handleReturnToLocation(
    WidgetRef ref,
    MapboxMap mapController,
    ({double lat, double lon}) userLocation,
  ) async {
    await moveCameraToLocation(
      mapController,
      userLocation.lat,
      userLocation.lon,
      zoom: 10,
    );

    // Reload repeaters for new location
    final controller = ref.read(repeatersMapControllerProvider.notifier);
    const boundsSize = 0.1;
    await controller.loadRepeatersFromBounds(
      lat1: userLocation.lat - boundsSize,
      lon1: userLocation.lon - boundsSize,
      lat2: userLocation.lat + boundsSize,
      lon2: userLocation.lon + boundsSize,
    );
  }
}
