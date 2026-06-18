import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/pota_marker_helper.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/pota_spots_controller.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class PotaSpotsMapPage extends HookConsumerWidget {
  const PotaSpotsMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<MapboxMap?>(null);
    final isStyleLoaded = useState(false);
    final l10n = context.localization;

    final asyncState = ref.watch(potaSpotsControllerProvider);
    final spotsState = asyncState.value;

    // User position for initial camera
    final userPosition = switch (ref.watch(cachedUserPositionProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };

    final hasFittedBounds = useState(false);

    // Update POTA source when spots or park cache change
    useEffect(
      () {
        if (mapController.value != null &&
            isStyleLoaded.value &&
            spotsState != null) {
          _updatePotaSource(
            mapController.value!,
            spotsState.spots,
            spotsState.parkCache,
          );

          // Fit camera to spot bounds on first load
          if (!hasFittedBounds.value && spotsState.parkCache.isNotEmpty) {
            hasFittedBounds.value = true;
            _fitCameraToSpots(mapController.value!, spotsState.parkCache);
          }
        }
        return null;
      },
      [spotsState?.spots, spotsState?.parkCache, isStyleLoaded.value],
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
            Image.asset('assets/images/pota_logo.png', width: 24, height: 24),
            const SizedBox(width: 8),
            Text(l10n.potaTitle),
          ],
        ),
      ),
      body: Stack(
        children: [
          MapWidget(
            viewport: CameraViewportState(
              center: Point(
                coordinates: Position(initialLon, initialLat),
              ),
              zoom: 6,
            ),
            styleUri: MapboxStyles.OUTDOORS,
            onMapCreated: (mapboxMap) async {
              mapController.value = mapboxMap;
              mapboxMap.addInteraction(
                TapInteraction.onMap((gestureContext) async {
                  await _handleTap(mapboxMap, gestureContext, context);
                }),
              );
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
              if (mapController.value == null) return;
              final map = mapController.value!;

              await _addPotaLogoImage(map);
              await _addPotaLayer(map);
              isStyleLoaded.value = true;

              if (spotsState != null) {
                await _updatePotaSource(
                  map,
                  spotsState.spots,
                  spotsState.parkCache,
                );
              }
            },
          ),
          // Spot count chip
          if (spotsState != null && spotsState.spots.isNotEmpty)
            Positioned(
              top: 12,
              left: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/pota_logo.png',
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.potaSpotsCount(spotsState.spots.length),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _addPotaLogoImage(MapboxMap mapboxMap) async {
    await PotaMarkerHelper.addPotaStyleImage(mapboxMap);
  }

  Future<void> _addPotaLayer(MapboxMap mapboxMap) async {
    try {
      final sourceExists =
          await mapboxMap.style.styleSourceExists(MapKeys.potaSource);
      if (!sourceExists) {
        await mapboxMap.style.addSource(
          GeoJsonSource(
            id: MapKeys.potaSource,
            data: jsonEncode({
              'type': 'FeatureCollection',
              'features': <Map<String, dynamic>>[],
            }),
          ),
        );
      }

      final layerExists =
          await mapboxMap.style.styleLayerExists(MapKeys.potaLayer);
      if (!layerExists) {
        final layerJson = await rootBundle.loadString(MapLayers.potaLayer);
        await mapboxMap.style.addStyleLayer(layerJson, null);
      }
    } catch (e) {
      log('Error adding POTA layer: $e');
    }
  }

  Future<void> _updatePotaSource(
    MapboxMap mapboxMap,
    List<PotaSpot> spots,
    Map<String, PotaPark> parkCache,
  ) async {
    try {
      log('POTA map: updating source with ${spots.length} spots');

      final features = <Map<String, dynamic>>[];
      for (final spot in spots) {
        final park = parkCache[spot.reference];
        if (park == null || park.latitude == null || park.longitude == null) {
          continue;
        }
        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [park.longitude, park.latitude],
          },
          'properties': {
            'spotId': spot.spotId,
            'activator': spot.activator,
            'frequency': spot.frequency,
            'mode': spot.mode,
            'reference': spot.reference,
            'name': spot.name,
          },
        });
      }

      final geoJson = jsonEncode({
        'type': 'FeatureCollection',
        'features': features,
      });

      log('POTA map: ${features.length} features with coordinates');

      final sourceExists =
          await mapboxMap.style.styleSourceExists(MapKeys.potaSource);
      if (sourceExists) {
        final source = await mapboxMap.style.getSource(MapKeys.potaSource)
            as GeoJsonSource?;
        await source?.updateGeoJSON(geoJson);
        log('POTA map: updated existing source');
      } else {
        await mapboxMap.style.addSource(
          GeoJsonSource(id: MapKeys.potaSource, data: geoJson),
        );
        log('POTA map: created new source');
      }
    } catch (e) {
      log('Error updating POTA source: $e');
    }
  }

  Future<void> _handleTap(
    MapboxMap mapboxMap,
    MapContentGestureContext gestureContext,
    BuildContext context,
  ) async {
    try {
      final screenCoordinate =
          await mapboxMap.pixelForCoordinate(gestureContext.point);

      final features = await mapboxMap.queryRenderedFeatures(
        RenderedQueryGeometry.fromScreenCoordinate(screenCoordinate),
        RenderedQueryOptions(layerIds: [MapKeys.potaLayer]),
      );

      if (features.isEmpty) return;
      final feature = features.first;
      if (feature == null) return;

      final featureMap =
          feature.queriedFeature.feature as Map<dynamic, dynamic>;
      final properties = featureMap['properties'] as Map<dynamic, dynamic>?;
      if (properties == null) return;

      final spotId = properties['spotId'] as int?;
      final reference = properties['reference'] as String?;
      if (spotId == null || reference == null) return;

      // Center on spot
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
          PotaSpotDetailRoute(spotId: spotId, reference: reference),
        );
      }
    } catch (e) {
      log('Error handling POTA map tap: $e');
    }
  }

  Future<void> _fitCameraToSpots(
    MapboxMap mapboxMap,
    Map<String, PotaPark> parkCache,
  ) async {
    try {
      var minLat = 90.0;
      var maxLat = -90.0;
      var minLon = 180.0;
      var maxLon = -180.0;

      for (final park in parkCache.values) {
        if (park.latitude == null || park.longitude == null) continue;
        if (park.latitude! < minLat) minLat = park.latitude!;
        if (park.latitude! > maxLat) maxLat = park.latitude!;
        if (park.longitude! < minLon) minLon = park.longitude!;
        if (park.longitude! > maxLon) maxLon = park.longitude!;
      }

      if (minLat > maxLat) return; // no valid parks

      await mapboxMap.flyTo(
        CameraOptions(
          center: Point(
            coordinates: Position(
              (minLon + maxLon) / 2,
              (minLat + maxLat) / 2,
            ),
          ),
          zoom: 2,
        ),
        MapAnimationOptions(duration: 500),
      );
    } catch (e) {
      log('Error fitting camera to spots: $e');
    }
  }
}
