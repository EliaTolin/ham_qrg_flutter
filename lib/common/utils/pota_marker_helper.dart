import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:hamqrg/config/constants/map_keys.dart';
import 'package:hamqrg/config/constants/map_layers.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Helper to generate and register the POTA marker icon for Mapbox maps.
class PotaMarkerHelper {
  PotaMarkerHelper._();

  static Uint8List? _cachedPngBytes;

  /// Returns the POTA logo as resized PNG bytes (72x72).
  static Future<Uint8List?> getPotaLogoPngBytes() async {
    if (_cachedPngBytes != null) return _cachedPngBytes;

    final rawBytes = await rootBundle.load('assets/images/pota_logo.png');
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
    return byteData.buffer.asUint8List();
  }

  /// Registers the POTA logo as a Mapbox style image.
  /// Safe to call multiple times — skips if already registered.
  static Future<void> addPotaStyleImage(MapboxMap mapboxMap) async {
    try {
      final exists = await mapboxMap.style.hasStyleImage(MapKeys.potaLogoImage);
      if (exists) return;

      final pngBytes = await getPotaLogoPngBytes();
      if (pngBytes == null) return;

      final buffer = await ui.ImmutableBuffer.fromUint8List(pngBytes);
      final descriptor = await ui.ImageDescriptor.encoded(buffer);

      await mapboxMap.style.addStyleImage(
        MapKeys.potaLogoImage,
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
      log('Error adding POTA style image: $e');
    }
  }

  /// Adds a single POTA park marker using GeoJSON source + symbol layer.
  /// Uses the same layer style as the spots map for visual consistency.
  static Future<void> addParkMarker(
    MapboxMap mapboxMap, {
    required double latitude,
    required double longitude,
    required String name,
  }) async {
    const sourceId = 'pota-detail-source';
    const layerId = 'pota-detail-layer';

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

    final layerJson = await rootBundle.loadString(MapLayers.potaLayer);
    final layerMap = jsonDecode(layerJson) as Map<String, dynamic>;
    layerMap['id'] = layerId;
    layerMap['source'] = sourceId;
    // Remove text field — detail map doesn't need callsign label
    (layerMap['layout'] as Map<String, dynamic>).remove('text-field');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-font');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-size');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-anchor');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-offset');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-allow-overlap');
    (layerMap['layout'] as Map<String, dynamic>).remove('text-optional');

    await mapboxMap.style.addStyleLayer(jsonEncode(layerMap), null);
  }
}
