import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Helper to generate and register the SOTA marker icon for Mapbox maps.
/// Parity with the POTA marker helper — different asset and image id.
class SotaMarkerHelper {
  SotaMarkerHelper._();

  static Uint8List? _cachedPngBytes;

  /// Returns the SOTA logo as resized PNG bytes (72x72).
  static Future<Uint8List?> getSotaLogoPngBytes() async {
    if (_cachedPngBytes != null) return _cachedPngBytes;

    final rawBytes = await rootBundle.load('assets/images/sota_logo.png');
    final codec = await ui.instantiateImageCodec(
      rawBytes.buffer.asUint8List(),
      targetWidth: 72,
      targetHeight: 72,
    );
    final frame = await codec.getNextFrame();
    final byteData = await frame.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    if (byteData == null) return null;
    return _cachedPngBytes = byteData.buffer.asUint8List();
  }

  /// Registers the SOTA logo as a Mapbox style image.
  /// Safe to call multiple times — skips if already registered.
  static Future<void> addSotaStyleImage(MapboxMap mapboxMap) async {
    try {
      final exists = await mapboxMap.style.hasStyleImage(MapKeys.sotaLogoImage);
      if (exists) return;

      final pngBytes = await getSotaLogoPngBytes();
      if (pngBytes == null) return;

      final buffer = await ui.ImmutableBuffer.fromUint8List(pngBytes);
      final descriptor = await ui.ImageDescriptor.encoded(buffer);

      await mapboxMap.style.addStyleImage(
        MapKeys.sotaLogoImage,
        1,
        MbxImage(
          width: descriptor.width,
          height: descriptor.height,
          data: pngBytes,
        ),
        false,
        [],
        [],
        null,
      );
    } catch (e) {
      log('Error adding SOTA style image: $e');
    }
  }

  /// Adds a single SOTA summit marker using GeoJSON source + symbol layer.
  static Future<void> addSummitMarker(
    MapboxMap mapboxMap, {
    required double latitude,
    required double longitude,
    required String name,
  }) async {
    const sourceId = 'sota-detail-source';
    const layerId = 'sota-detail-layer';

    final geoJson = jsonEncode({
      'type': 'FeatureCollection',
      'features': [
        {
          'type': 'Feature',
          'geometry': {
            'type': 'Point',
            'coordinates': [longitude, latitude],
          },
          'properties': {
            'name': name,
          },
        },
      ],
    });

    await mapboxMap.style.addSource(
      GeoJsonSource(id: sourceId, data: geoJson),
    );

    final layerJson = await rootBundle.loadString(MapLayers.sotaLayer);
    final layerMap = jsonDecode(layerJson) as Map<String, dynamic>
      ..['id'] = layerId
      ..['source'] = sourceId;

    final layout = layerMap['layout'] as Map<String, dynamic>;
    for (final key in [
      'text-field',
      'text-font',
      'text-size',
      'text-anchor',
      'text-offset',
      'text-allow-overlap',
      'text-optional',
    ]) {
      layout.remove(key);
    }

    await mapboxMap.style.addStyleLayer(jsonEncode(layerMap), null);
  }
}
