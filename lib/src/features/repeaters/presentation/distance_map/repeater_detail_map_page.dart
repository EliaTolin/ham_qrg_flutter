import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart' hide Position;
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class RepeaterDetailMapPage extends HookConsumerWidget {
  const RepeaterDetailMapPage({
    required this.repeaterLatitude,
    required this.repeaterLongitude,
    required this.repeaterName,
    this.repeaterLocality,
    this.repeaterLocator,
    super.key,
  });

  final double repeaterLatitude;
  final double repeaterLongitude;
  final String repeaterName;
  final String? repeaterLocality;
  final String? repeaterLocator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final mapController = useState<MapboxMap?>(null);
    final userPosition =
        useState<({double latitude, double longitude})?>(null);
    final distanceMeters = useState<double?>(null);
    final isLoading = useState(true);

    // Fetch user position on mount
    useEffect(
      () {
        Future<void> fetchPosition() async {
          try {
            final position =
                await ref.read(locationServiceProvider).getCurrentPosition();
            userPosition.value = position;
            distanceMeters.value = Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              repeaterLatitude,
              repeaterLongitude,
            );
          } catch (_) {
            // Location unavailable
          } finally {
            isLoading.value = false;
          }
        }
        fetchPosition();
        return null;
      },
      [],
    );

    // Draw line + marker and fit camera when map and user position are ready
    useEffect(
      () {
        final map = mapController.value;
        final user = userPosition.value;
        if (map != null && user != null) {
          _drawLineAndFitCamera(map, user, colorScheme);
        }
        return null;
      },
      [mapController.value, userPosition.value],
    );

    return Scaffold(
      appBar: AppBar(title: Text(repeaterName)),
      body: Stack(
        children: [
          MapWidget(
            cameraOptions: CameraOptions(
              center: Point(
                coordinates:
                    Position(repeaterLongitude, repeaterLatitude),
              ),
              zoom: 10,
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
                  GesturesSettings(pitchEnabled: false),
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
          ),
          // Bottom card
          if (!isLoading.value)
            Positioned(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              child: _DistanceCard(
                distanceMeters: distanceMeters.value,
                repeaterLocality: repeaterLocality,
                repeaterLocator: repeaterLocator,
                locationUnavailable:
                    context.localization.repeaterDistanceMapNoLocation,
              ),
            ),
          if (isLoading.value)
            const Center(child: CircularProgressIndicator.adaptive()),
        ],
      ),
    );
  }

  Future<void> _drawLineAndFitCamera(
    MapboxMap map,
    ({double latitude, double longitude}) user,
    ColorScheme colorScheme,
  ) async {
    try {
      // Draw polyline between user and repeater
      final polylineManager =
          await map.annotations.createPolylineAnnotationManager();
      await polylineManager.create(
        PolylineAnnotationOptions(
          geometry: LineString(
            coordinates: [
              Position(user.longitude, user.latitude),
              Position(repeaterLongitude, repeaterLatitude),
            ],
          ),
          lineColor: colorScheme.primary.toARGB32(),
          lineWidth: 3,
          lineOpacity: 0.8,
        ),
      );

      // Add repeater marker
      final pointManager =
          await map.annotations.createPointAnnotationManager();
      await pointManager.create(
        PointAnnotationOptions(
          geometry: Point(
            coordinates: Position(repeaterLongitude, repeaterLatitude),
          ),
          iconSize: 1.5,
          iconColor: colorScheme.primary.toARGB32(),
        ),
      );

      // Fit camera to show both points with padding
      final minLat = math.min(user.latitude, repeaterLatitude);
      final maxLat = math.max(user.latitude, repeaterLatitude);
      final minLng = math.min(user.longitude, repeaterLongitude);
      final maxLng = math.max(user.longitude, repeaterLongitude);

      final latPadding = (maxLat - minLat) * 0.15;
      final lngPadding = (maxLng - minLng) * 0.15;

      final camera = await map.cameraForCoordinateBounds(
        CoordinateBounds(
          southwest: Point(
            coordinates:
                Position(minLng - lngPadding, minLat - latPadding),
          ),
          northeast: Point(
            coordinates:
                Position(maxLng + lngPadding, maxLat + latPadding),
          ),
          infiniteBounds: false,
        ),
        MbxEdgeInsets(top: 80, left: 40, bottom: 140, right: 40),
        null,
        null,
        null,
        null,
      );

      await map.flyTo(camera, MapAnimationOptions(duration: 1000));
    } catch (e) {
      log('Error drawing distance line: $e');
    }
  }
}

class _DistanceCard extends StatelessWidget {
  const _DistanceCard({
    required this.distanceMeters,
    required this.locationUnavailable,
    this.repeaterLocality,
    this.repeaterLocator,
  });

  final double? distanceMeters;
  final String? repeaterLocality;
  final String? repeaterLocator;
  final String locationUnavailable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (repeaterLocality != null || repeaterLocator != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      [repeaterLocality, repeaterLocator]
                          .whereType<String>()
                          .join(' \u2022 '),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            if (distanceMeters != null)
              Row(
                children: [
                  Icon(
                    Icons.straighten,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    RepeaterFormatHelper.formatDistance(distanceMeters)
                        .replaceAll(' away', ''),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Icon(
                    Icons.location_disabled,
                    size: 18,
                    color: colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    locationUnavailable,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
