import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/hooks/use_map_camera.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/map/controller/repeaters_map_controller.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/map/controller/state/repeaters_map_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/utils/map_utils.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/info_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/mode_filter_chips.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/permission_banner.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/summary_chip.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class RepeatersMapPage extends HookConsumerWidget {
  const RepeatersMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(repeatersMapControllerProvider);
    final notifier = ref.read(repeatersMapControllerProvider.notifier);
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);
    final cameraChangeTimer = useRef<Timer?>(null);
    final userLocation = useState<({double lat, double lon})?>(null);

    final mapState = asyncState.value;

    // Update user location from state
    useEffect(
      () {
        if (mapState?.latitude != null && mapState?.longitude != null) {
          final lat = mapState!.latitude!;
          final lon = mapState.longitude!;
          userLocation.value = (
            lat: lat,
            lon: lon,
          );
        }
        return null;
      },
      [mapState?.latitude, mapState?.longitude],
    );

    // Sync annotations when repeaters change
    useEffect(
      () {
        if (mapController.value != null &&
            pointManager.value != null &&
            (mapState?.repeaters.isNotEmpty ?? false)) {
          _syncMapAnnotations(
            mapController.value!,
            pointManager.value!,
            mapState!.repeaters,
          );
        }
        return null;
      },
      [mapState?.repeaters],
    );

    // Check if location button should be shown
    final showLocationButton = useShouldShowLocationButton(
      mapController.value,
      userLocation.value,
    );

    // Show loading while controller is loading
    if (asyncState.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.localization.repeatersMapTitle),
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    final cameraPos = getInitialCameraPosition(
      latitude: mapState?.latitude,
      longitude: mapState?.longitude,
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
                coordinates: Position(cameraPos.lon, cameraPos.lat),
              ),
              zoom: cameraPos.zoom,
              bearing: 0,
              pitch: 0,
            ),
            styleUri: MapboxStyles.OUTDOORS,
            onCameraChangeListener: (cameraState) {
              _handleCameraChange(
                ref,
                mapController.value,
                cameraChangeTimer,
                userLocation.value,
              );
            },
            onMapCreated: (mapboxMap) async {
              await _initializeMap(
                mapboxMap,
                mapController,
                pointManager,
                ref,
                context,
                mapState?.repeaters ?? [],
              );
            },
          ),
          _buildOverlays(
            context,
            ref,
            asyncState,
            mapState,
            notifier,
            showLocationButton,
            mapController.value,
            userLocation.value,
          ),
        ],
      ),
    );
  }

  void _handleCameraChange(
    WidgetRef ref,
    MapboxMap? map,
    ObjectRef<Timer?> timerRef,
    ({double lat, double lon})? userLocation,
  ) {
    timerRef.value?.cancel();
    timerRef.value = Timer(
      const Duration(milliseconds: 800),
      () async {
        if (map == null) return;

        try {
          final cameraState = await map.getCameraState();
          final centerCoords = cameraState.center.coordinates;
          final zoom = cameraState.zoom;

          final centerLat = centerCoords[1]!.toDouble();
          final centerLon = centerCoords[0]!.toDouble();

          // Calculate bounds from center and zoom
          final latRange = 360 / (1 << zoom.toInt());
          final lonRange = latRange * (1 / (1 << (zoom.toInt() ~/ 2)));

          final controller = ref.read(repeatersMapControllerProvider.notifier);
          await controller.loadRepeatersFromBounds(
            lat1: centerLat - latRange / 2,
            lon1: centerLon - lonRange / 2,
            lat2: centerLat + latRange / 2,
            lon2: centerLon + lonRange / 2,
          );
        } catch (e) {
          // Ignore errors during camera movement
        }
      },
    );
  }

  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    ValueNotifier<MapboxMap?> mapController,
    ValueNotifier<PointAnnotationManager?> pointManager,
    WidgetRef ref,
    BuildContext context,
    List<Repeater> initialRepeaters,
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

    // Sync initial annotations after a short delay
    if (initialRepeaters.isNotEmpty) {
      await _syncMapAnnotations(mapboxMap, manager, initialRepeaters);
    }
  }

  Future<void> _syncMapAnnotations(
    MapboxMap map,
    PointAnnotationManager manager,
    List<Repeater> repeaters,
  ) async {
    try {
      await manager.deleteAll();

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
        if (mapState?.locationError != null)
          PermissionBanner(
            errorType: mapState!.locationError!,
            onRetry: () => notifier.toggleModeFilter(RepeaterMode.analog),
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
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: SafeArea(
            child: ModeFilterChips(
              selectedModes: mapState?.selectedModes ?? {},
              onModeToggled: notifier.toggleModeFilter,
            ),
          ),
        ),
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

  Future<void> _handleReturnToLocation(
    WidgetRef ref,
    MapboxMap mapController,
    ({double lat, double lon}) userLocation,
  ) async {
    await moveCameraToLocation(
      mapController,
      userLocation.lat,
      userLocation.lon,
    );

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
