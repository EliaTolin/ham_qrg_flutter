import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Hook to manage map annotations
void useMapAnnotations(
  MapboxMap? map,
  List<Repeater> repeaters,
) {
  final managerRef = useRef<PointAnnotationManager?>(null);

  useEffect(
    () {
      if (map == null || repeaters.isEmpty) {
        return null;
      }

      Future<void> syncAnnotations() async {
        if (managerRef.value == null) {
          try {
            managerRef.value = await map.annotations.createPointAnnotationManager();
          } catch (e) {
            return;
          }
        }

        final manager = managerRef.value;
        if (manager == null) return;

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

      // Delay to ensure map is ready
      Future.delayed(const Duration(milliseconds: 200), syncAnnotations);

      return null;
    },
    [map, repeaters],
  );
}
