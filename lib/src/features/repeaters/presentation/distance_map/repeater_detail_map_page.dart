import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart' hide Position;
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/distance_map/controller/repeater_detail_map_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/distance_map/controller/state/repeater_detail_map_state.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

@RoutePage()
class RepeaterDetailMapPage extends HookConsumerWidget {
  const RepeaterDetailMapPage({
    @PathParam('repeaterId') required this.repeaterId,
    super.key,
  });

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerAsync =
        ref.watch(repeaterDetailMapControllerProvider(repeaterId));

    return controllerAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator.adaptive()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.localization.error_message),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(
                  repeaterDetailMapControllerProvider(repeaterId),
                ),
                child: Text(context.localization.retry),
              ),
            ],
          ),
        ),
      ),
      data: (mapState) => _RepeaterDetailMapContent(
        repeaterId: repeaterId,
        mapState: mapState,
      ),
    );
  }
}

class _RepeaterDetailMapContent extends HookConsumerWidget {
  const _RepeaterDetailMapContent({
    required this.repeaterId,
    required this.mapState,
  });

  final String repeaterId;
  final RepeaterDetailMapState mapState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final repeater = mapState.repeater;
    final repeaterLatitude = repeater.latitude!;
    final repeaterLongitude = repeater.longitude!;

    final mapController = useState<MapboxMap?>(null);
    final userPosition = useState<({double latitude, double longitude})?>(null);
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

    // Draw lines and fit camera when map and user position are ready
    useEffect(
      () {
        final map = mapController.value;
        final user = userPosition.value;
        if (map != null && user != null) {
          _drawLineAndFitCamera(
            map,
            user,
            colorScheme,
            repeaterLatitude,
            repeaterLongitude,
            mapState.feedbacks,
          );
        }
        return null;
      },
      [mapController.value, userPosition.value],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(repeater.callsign ?? repeater.name ?? ''),
      ),
      body: Stack(
        children: [
          MapWidget(
            viewport: CameraViewportState(
              center: Point(
                coordinates: Position(repeaterLongitude, repeaterLatitude),
              ),
              zoom: 10,
            ),
            styleUri: MapboxStyles.OUTDOORS,
            onMapCreated: (mapboxMap) async {
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
                    puckBearingEnabled: true,
                    puckBearing: PuckBearing.HEADING,
                  ),
                ),
              ]);
              await _addRepeaterMarker(mapboxMap, repeater);
              mapController.value = mapboxMap;
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
                repeaterLocality: repeater.locality,
                repeaterLocator: repeater.locator,
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

  Future<void> _addRepeaterMarker(
    MapboxMap map,
    Repeater repeater,
  ) async {
    try {
      final accessModes = repeater.accesses.map((a) => a.mode).toList();
      final iconBytes =
          await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
        accessModes,
      );
      final pointManager = await map.annotations.createPointAnnotationManager();
      await pointManager.create(
        PointAnnotationOptions(
          geometry: Point(
            coordinates: Position(repeater.longitude!, repeater.latitude!),
          ),
          image: iconBytes,
          iconSize: 1.5,
          iconAnchor: IconAnchor.CENTER,
        ),
      );
    } catch (e) {
      log('Error adding repeater marker: $e');
    }
  }

  Future<void> _drawLineAndFitCamera(
    MapboxMap map,
    ({double latitude, double longitude}) user,
    ColorScheme colorScheme,
    double repeaterLatitude,
    double repeaterLongitude,
    List<RepeaterFeedback> feedbacks,
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

      // Draw feedback lines
      for (final feedback in feedbacks) {
        final lineColor = switch (feedback.type) {
          FeedbackType.like => const Color(0xFF1A3A6B).toARGB32(),
          FeedbackType.down => const Color(0xFFE67E22).toARGB32(),
        };

        await polylineManager.create(
          PolylineAnnotationOptions(
            geometry: LineString(
              coordinates: [
                Position(feedback.longitude, feedback.latitude),
                Position(repeaterLongitude, repeaterLatitude),
              ],
            ),
            lineColor: lineColor,
            lineWidth: 3,
            lineOpacity: 0.8,
          ),
        );
      }

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
            coordinates: Position(minLng - lngPadding, minLat - latPadding),
          ),
          northeast: Point(
            coordinates: Position(maxLng + lngPadding, maxLat + latPadding),
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
                    context.units.distance(distanceMeters!),
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
