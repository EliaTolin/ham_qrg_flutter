import 'dart:async';
import 'dart:math' as math;

import 'package:hamqrg/clients/mapbox_offline/mapbox_offline_client.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapbox_offline_client_impl.g.dart';

/// Implementazione su `OfflineManager`/`TileStore` di mapbox_maps_flutter.
///
/// Usa SEMPRE [TileStore.createDefault]: è lo stesso store che la `MapWidget`
/// consulta in lettura (`TileStoreUsageMode` di default è `readOnly`), quindi
/// una regione scaricata qui viene servita automaticamente da ogni mappa
/// dell'app quando la rete manca — nessuna configurazione per-mappa.
class MapboxOfflineClientImpl implements MapboxOfflineClient {
  OfflineManager? _manager;
  TileStore? _tileStore;

  static const _styleUri = MapboxStyles.OUTDOORS;
  static const _minZoom = 6;

  /// Peso dello style pack nell'avanzamento complessivo: è piccolo rispetto
  /// ai tile ma va scaricato per primo, quindi occupa la prima parte della
  /// barra.
  static const _stylePackWeight = 0.15;

  Future<OfflineManager> _offlineManager() async =>
      _manager ??= await OfflineManager.create();

  Future<TileStore> _store() async =>
      _tileStore ??= await TileStore.createDefault();

  /// Poligono circolare (64 vertici) attorno al centro richiesto: è la
  /// geometria usata dal tile cover per decidere quali tile scaricare.
  static Map<String?, Object?> _circleGeometry(
    double latitude,
    double longitude,
    double radiusKm,
  ) {
    const vertices = 64;
    const kmPerDegreeLat = 111.32;
    final dLat = radiusKm / kmPerDegreeLat;
    final dLon =
        radiusKm / (kmPerDegreeLat * math.cos(latitude * math.pi / 180));

    final ring = <Position>[
      for (var i = 0; i <= vertices; i++)
        Position(
          longitude + dLon * math.cos(2 * math.pi * i / vertices),
          latitude + dLat * math.sin(2 * math.pi * i / vertices),
        ),
    ];
    return Map<String?, Object?>.from(
      Polygon(coordinates: [ring]).toJson(),
    );
  }

  TileRegionLoadOptions _loadOptions(OfflineRegionRequest request) {
    return TileRegionLoadOptions(
      geometry: _circleGeometry(
        request.latitude,
        request.longitude,
        request.radiusKm,
      ),
      descriptorsOptions: [
        TilesetDescriptorOptions(
          styleURI: _styleUri,
          minZoom: _minZoom,
          maxZoom: request.maxZoom,
        ),
      ],
      metadata: request.toMetadata(),
      acceptExpired: true,
      networkRestriction: NetworkRestriction.NONE,
    );
  }

  @override
  Future<List<OfflineRegionSnapshot>> listRegions() async {
    final store = await _store();
    final regions = await store.allTileRegions();
    final snapshots = <OfflineRegionSnapshot>[];
    for (final region in regions) {
      Map<String, Object>? metadata;
      try {
        metadata = await store.tileRegionMetadata(region.id);
      } catch (_) {
        // Metadati assenti o illeggibili: la regione resta gestibile
        // (dimensione, eliminazione) anche senza nome.
        metadata = null;
      }
      final createdAtMs = metadata?['created_at'];
      snapshots.add(
        OfflineRegionSnapshot(
          id: region.id,
          name: (metadata?['name'] as String?) ?? region.id,
          sizeBytes: region.completedResourceSize,
          isComplete:
              region.completedResourceCount >= region.requiredResourceCount,
          latitude: (metadata?['lat'] as num?)?.toDouble(),
          longitude: (metadata?['lon'] as num?)?.toDouble(),
          radiusKm: (metadata?['radius_km'] as num?)?.toDouble(),
          createdAt: createdAtMs is num
              ? DateTime.fromMillisecondsSinceEpoch(createdAtMs.toInt())
              : null,
        ),
      );
    }
    return snapshots;
  }

  @override
  Future<OfflineRegionEstimate> estimateRegion(
    OfflineRegionRequest request,
  ) async {
    final store = await _store();
    final result = await store.estimateTileRegion(
      request.id,
      _loadOptions(request),
      null,
      null,
    );
    return OfflineRegionEstimate(
      transferSizeBytes: result.transferSize,
      storageSizeBytes: result.storageSize,
    );
  }

  @override
  Stream<OfflineDownloadProgress> downloadRegion(
    OfflineRegionRequest request,
  ) {
    final controller = StreamController<OfflineDownloadProgress>();

    // Il plugin non cancella mai la subscription dell'EventChannel di
    // progresso: i flag "done" scartano gli eventi tardivi dopo che la
    // relativa load è completata.
    var styleDone = false;
    var tilesDone = false;

    double fractionOf(num completed, num required) =>
        required == 0 ? 0 : (completed / required).clamp(0, 1).toDouble();

    Future<void> run() async {
      final manager = await _offlineManager();
      final store = await _store();

      await manager.loadStylePack(
        _styleUri,
        StylePackLoadOptions(
          // Tutti i glifi rasterizzati sul device: i layer dei marker usano
          // font ("Open Sans Bold") diversi da quelli dello stile OUTDOORS,
          // e offline non ci deve essere alcuna dipendenza dal glyph server.
          glyphsRasterizationMode:
              GlyphsRasterizationMode.ALL_GLYPHS_RASTERIZED_LOCALLY,
          acceptExpired: false,
        ),
        (progress) {
          if (styleDone || controller.isClosed) return;
          controller.add(
            OfflineDownloadProgress(
              phase: OfflineDownloadPhase.stylePack,
              fraction: _stylePackWeight *
                  fractionOf(
                    progress.completedResourceCount,
                    progress.requiredResourceCount,
                  ),
            ),
          );
        },
      );
      styleDone = true;

      await store.loadTileRegion(
        request.id,
        _loadOptions(request),
        (progress) {
          if (tilesDone || controller.isClosed) return;
          controller.add(
            OfflineDownloadProgress(
              phase: OfflineDownloadPhase.tiles,
              fraction: _stylePackWeight +
                  (1 - _stylePackWeight) *
                      fractionOf(
                        progress.completedResourceCount,
                        progress.requiredResourceCount,
                      ),
            ),
          );
        },
      );
      tilesDone = true;

      if (!controller.isClosed) {
        controller.add(
          const OfflineDownloadProgress(
            phase: OfflineDownloadPhase.tiles,
            fraction: 1,
          ),
        );
      }
    }

    unawaited(
      run().then(
        (_) => controller.close(),
        onError: (Object error, StackTrace stackTrace) {
          styleDone = true;
          tilesDone = true;
          if (!controller.isClosed) {
            controller.addError(error, stackTrace);
          }
          return controller.close();
        },
      ),
    );

    return controller.stream;
  }

  @override
  Future<void> deleteRegion(String id) async {
    final store = await _store();
    await store.removeRegion(id);
    final remaining = await store.allTileRegions();
    if (remaining.isEmpty) {
      // removeRegion de-referenzia soltanto: azzerare e ripristinare il quota
      // forza l'eviction immediata, così lo spazio torna davvero libero.
      store
        ..setDiskQuota(0)
        ..setDiskQuota(null);
    }
  }
}

@Riverpod(keepAlive: true)
MapboxOfflineClient mapboxOfflineClient(Ref ref) {
  // keepAlive: OfflineManager/TileStore tengono canali nativi con finalizer —
  // un'unica istanza per tutta la vita dell'app.
  return MapboxOfflineClientImpl();
}
