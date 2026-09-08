import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/widgets/units/map_scale_bar.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class RepeaterLocationMap extends HookConsumerWidget {
  const RepeaterLocationMap({
    required this.repeater,
    this.height = 112,
    super.key,
  });

  final Repeater repeater;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
    final mapController = useState<MapboxMap?>(null);
    final pointManager = useState<PointAnnotationManager?>(null);

    useEffect(
      () {
        if (mapController.value != null && pointManager.value != null) {
          _syncAnnotation(pointManager.value!, repeater);
        }
        return null;
      },
      [repeater],
    );

    if (repeater.latitude == null || repeater.longitude == null) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            Icons.map,
            size: 48,
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant
                .withValues(alpha: 0.3),
          ),
        ),
      );
    }

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              MapWidget(
                viewport: CameraViewportState(
                  center: Point(
                    coordinates:
                        Position(repeater.longitude!, repeater.latitude!),
                  ),
                  zoom: 13,
                  bearing: 0,
                  pitch: 0,
                ),
                styleUri: MapboxStyles.OUTDOORS,
                onMapCreated: (mapboxMap) async {
                  await applyUnitAwareScaleBar(
                    mapboxMap,
                    isImperial: isImperial,
                  );
                  await _initializeMap(
                    mapboxMap,
                    mapController,
                    pointManager,
                  );
                },
              ),
              // Dark overlay
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .shadow
                      .withValues(alpha: 0.2),
                ),
              ),
              // Repeater marker
              Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.settings_input_antenna,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initializeMap(
    MapboxMap mapboxMap,
    ValueNotifier<MapboxMap?> mapController,
    ValueNotifier<PointAnnotationManager?> pointManager,
  ) async {
    mapController.value = mapboxMap;

    // Create annotation manager
    final manager = await mapboxMap.annotations.createPointAnnotationManager();
    pointManager.value = manager;

    // Disable location component for detail view
    await mapboxMap.location.updateSettings(
      LocationComponentSettings(
        enabled: false,
      ),
    );

    // Load annotation
    await _syncAnnotation(manager, repeater);
  }

  Future<void> _syncAnnotation(
    PointAnnotationManager manager,
    Repeater repeater,
  ) async {
    try {
      await manager.deleteAll();
      if (repeater.latitude == null || repeater.longitude == null) return;

      final accessModes = repeater.accesses.map((a) => a.mode).toList();
      final iconBytes =
          await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
        accessModes,
      );
      await manager.create(
        PointAnnotationOptions(
          geometry: Point(
            coordinates: Position(repeater.longitude!, repeater.latitude!),
          ),
          image: iconBytes,
          iconSize: 1.2,
          iconAnchor: IconAnchor.CENTER,
        ),
      );
    } catch (e) {
      log('Error syncing annotation: $e');
    }
  }
}
