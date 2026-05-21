import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/sota_marker_helper.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/sota/data/repository/sota_repository.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/controller/sota_spots_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class SotaSpotsMapPage extends HookConsumerWidget {
  const SotaSpotsMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<MapboxMap?>(null);
    final isStyleLoaded = useState(false);
    final summitsByCode = useState<Map<String, SotaSummit>>({});
    final hasLoadedSummits = useState(false);
    final hasFittedBounds = useState(false);
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final asyncState = ref.watch(sotaSpotsControllerProvider);
    final spots = asyncState.value?.spots ?? const <SotaSpot>[];

    final userPosition = switch (ref.watch(cachedUserPositionProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };

    // Lazy-load summit coordinates once we have spots.
    useEffect(
      () {
        if (spots.isNotEmpty && !hasLoadedSummits.value) {
          hasLoadedSummits.value = true;
          unawaited(_loadSummits(ref, spots, summitsByCode));
        }
        return null;
      },
      [spots.length],
    );

    // Update map source whenever data or style changes.
    useEffect(
      () {
        final map = mapController.value;
        if (map != null &&
            isStyleLoaded.value &&
            summitsByCode.value.isNotEmpty) {
          unawaited(
            _updateSotaSource(map, spots, summitsByCode.value),
          );
          if (!hasFittedBounds.value) {
            hasFittedBounds.value = true;
            unawaited(_fitCameraToSummits(map, summitsByCode.value));
          }
        }
        return null;
      },
      [spots.length, summitsByCode.value.length, isStyleLoaded.value],
    );

    final initialLat =
        userPosition?.latitude ?? LocationService.defaultLatitude;
    final initialLon =
        userPosition?.longitude ?? LocationService.defaultLongitude;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/sota_logo.png', width: 24, height: 24),
            const SizedBox(width: 8),
            Text(l10n.sotaTitle),
          ],
        ),
      ),
      body: Stack(
        children: [
          MapWidget(
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(initialLon, initialLat)),
              zoom: 6,
            ),
            styleUri: MapboxStyles.OUTDOORS,
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              await Future.wait([
                mapboxMap.scaleBar
                    .updateSettings(ScaleBarSettings(enabled: false)),
                mapboxMap.compass
                    .updateSettings(CompassSettings(enabled: false)),
                mapboxMap.gestures.updateSettings(
                  GesturesSettings(
                    pitchEnabled: false,
                    rotateEnabled: false,
                  ),
                ),
                mapboxMap.location.updateSettings(
                  LocationComponentSettings(
                    enabled: true,
                    pulsingEnabled: true,
                    showAccuracyRing: true,
                  ),
                ),
              ]);
            },
            onStyleLoadedListener: (_) async {
              final map = mapController.value;
              if (map == null) return;
              await SotaMarkerHelper.addSotaStyleImage(map);
              await _addSotaLayer(map);
              isStyleLoaded.value = true;
              if (summitsByCode.value.isNotEmpty) {
                await _updateSotaSource(map, spots, summitsByCode.value);
              }
            },
            onTapListener: (gestureContext) async {
              final map = mapController.value;
              if (map == null) return;
              await _handleTap(map, gestureContext, context);
            },
          ),
          if (spots.isNotEmpty)
            Positioned(
              top: 12,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/sota_logo.png',
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.sotaSpotCount(spots.length),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          if (!hasLoadedSummits.value || summitsByCode.value.isEmpty)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.sotaPursuitLoading,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Future<void> _loadSummits(
  WidgetRef ref,
  List<SotaSpot> spots,
  ValueNotifier<Map<String, SotaSummit>> sink,
) async {
  try {
    final repository = ref.read(sotaRepositoryProvider);
    final summits = await repository.getSummitsForSpots(spots);
    sink.value = summits;
  } catch (e, st) {
    log('SOTA map: failed to load summits: $e\n$st');
  }
}

Future<void> _addSotaLayer(MapboxMap mapboxMap) async {
  try {
    final sourceExists =
        await mapboxMap.style.styleSourceExists(MapKeys.sotaSource);
    if (!sourceExists) {
      await mapboxMap.style.addSource(
        GeoJsonSource(
          id: MapKeys.sotaSource,
          data: jsonEncode({
            'type': 'FeatureCollection',
            'features': <Map<String, dynamic>>[],
          }),
        ),
      );
    }
    final layerExists =
        await mapboxMap.style.styleLayerExists(MapKeys.sotaLayer);
    if (!layerExists) {
      final layerJson = await rootBundle.loadString(MapLayers.sotaLayer);
      await mapboxMap.style.addStyleLayer(layerJson, null);
    }
  } catch (e) {
    log('Error adding SOTA layer: $e');
  }
}

Future<void> _updateSotaSource(
  MapboxMap mapboxMap,
  List<SotaSpot> spots,
  Map<String, SotaSummit> summits,
) async {
  try {
    final features = <Map<String, dynamic>>[];
    for (final spot in spots) {
      final summit = summits[spot.summitCode];
      if (summit == null) continue;
      features.add({
        'type': 'Feature',
        'geometry': {
          'type': 'Point',
          'coordinates': [summit.longitude, summit.latitude],
        },
        'properties': {
          'spotId': spot.id,
          'activator': spot.activator,
          'frequency': spot.frequencyMhz,
          'mode': spot.mode,
          'summitCode': spot.summitCode,
          'summitName': spot.summitName,
          'altM': spot.altitudeM,
          'points': spot.points,
        },
      });
    }
    final geoJson =
        jsonEncode({'type': 'FeatureCollection', 'features': features});
    final exists = await mapboxMap.style.styleSourceExists(MapKeys.sotaSource);
    if (exists) {
      final source =
          await mapboxMap.style.getSource(MapKeys.sotaSource) as GeoJsonSource?;
      await source?.updateGeoJSON(geoJson);
    } else {
      await mapboxMap.style.addSource(
        GeoJsonSource(id: MapKeys.sotaSource, data: geoJson),
      );
    }
  } catch (e) {
    log('Error updating SOTA source: $e');
  }
}

Future<void> _handleTap(
  MapboxMap mapboxMap,
  MapContentGestureContext gestureContext,
  BuildContext context,
) async {
  try {
    final screen = await mapboxMap.pixelForCoordinate(gestureContext.point);
    final features = await mapboxMap.queryRenderedFeatures(
      RenderedQueryGeometry.fromScreenCoordinate(screen),
      RenderedQueryOptions(layerIds: [MapKeys.sotaLayer]),
    );
    if (features.isEmpty) return;
    final feature = features.first;
    if (feature == null) return;
    final featureMap = feature.queriedFeature.feature as Map<dynamic, dynamic>;
    final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
    if (properties == null) return;

    final spotId = properties['spotId'] as int?;
    final summitCode = properties['summitCode'] as String?;
    if (spotId == null || summitCode == null) return;

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
      await context.router.push(
        SotaSpotDetailRoute(spotId: spotId, summitCode: summitCode),
      );
    }
  } catch (e) {
    log('Error handling SOTA map tap: $e');
  }
}

Future<void> _fitCameraToSummits(
  MapboxMap mapboxMap,
  Map<String, SotaSummit> summits,
) async {
  try {
    var minLat = 90.0;
    var maxLat = -90.0;
    var minLon = 180.0;
    var maxLon = -180.0;
    for (final s in summits.values) {
      if (s.latitude < minLat) minLat = s.latitude;
      if (s.latitude > maxLat) maxLat = s.latitude;
      if (s.longitude < minLon) minLon = s.longitude;
      if (s.longitude > maxLon) maxLon = s.longitude;
    }
    if (minLat > maxLat) return;
    await mapboxMap.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            (minLon + maxLon) / 2,
            (minLat + maxLat) / 2,
          ),
        ),
        zoom: 4,
      ),
      MapAnimationOptions(duration: 500),
    );
  } catch (e) {
    log('Error fitting SOTA camera: $e');
  }
}
