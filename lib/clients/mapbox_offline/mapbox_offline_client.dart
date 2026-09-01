/// Astrazione sul sistema offline di Mapbox (StylePack + TileStore).
///
/// Le classi dati sono Dart puro (stesso approccio di `ReachableCandidate`):
/// il client non dipende da freezed né dal dominio di alcuna feature.
library;

/// Richiesta di download di una regione circolare.
class OfflineRegionRequest {
  const OfflineRegionRequest({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.radiusKm,
    this.maxZoom = 14,
  });

  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final double radiusKm;

  /// I tile pack sono scaricati a lotti di zoom predefiniti (0–5, 6–10,
  /// 11–14, 15–16): un valore tra 11 e 14 costa uguale, quindi le uniche
  /// scelte sensate sono 10 ("panoramica") e 14 ("dettaglio", default).
  final int maxZoom;

  Map<String?, Object?> toMetadata() => {
        'name': name,
        'lat': latitude,
        'lon': longitude,
        'radius_km': radiusKm,
        'max_zoom': maxZoom,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      };
}

/// Fotografia di una regione presente nel TileStore.
class OfflineRegionSnapshot {
  const OfflineRegionSnapshot({
    required this.id,
    required this.name,
    required this.sizeBytes,
    required this.isComplete,
    this.latitude,
    this.longitude,
    this.radiusKm,
    this.createdAt,
  });

  final String id;
  final String name;
  final int sizeBytes;
  final bool isComplete;
  final double? latitude;
  final double? longitude;
  final double? radiusKm;
  final DateTime? createdAt;
}

enum OfflineDownloadPhase { stylePack, tiles }

/// Avanzamento complessivo di un download (style pack + tiles), 0..1.
class OfflineDownloadProgress {
  const OfflineDownloadProgress({required this.phase, required this.fraction});

  final OfflineDownloadPhase phase;
  final double fraction;
}

/// Stima di dimensione prima del download.
class OfflineRegionEstimate {
  const OfflineRegionEstimate({
    required this.transferSizeBytes,
    required this.storageSizeBytes,
  });

  final int transferSizeBytes;
  final int storageSizeBytes;
}

abstract class MapboxOfflineClient {
  /// Regioni presenti nel TileStore, con i metadati leggibili (nome, raggio…).
  Future<List<OfflineRegionSnapshot>> listRegions();

  /// Stima trasferimento/occupazione per [request] senza scaricare nulla.
  Future<OfflineRegionEstimate> estimateRegion(OfflineRegionRequest request);

  /// Scarica lo style pack (una tantum, aggiornandolo) e la regione di tile.
  /// Emette l'avanzamento complessivo e si chiude a download completato.
  /// Rilanciare con lo stesso [OfflineRegionRequest.id] riprende le risorse
  /// mancanti di una regione incompleta.
  Stream<OfflineDownloadProgress> downloadRegion(OfflineRegionRequest request);

  /// Rimuove una regione. I byte vengono davvero liberati solo dall'eviction
  /// del quota: quando si elimina l'ultima regione il quota viene azzerato e
  /// ripristinato per forzare la pulizia.
  Future<void> deleteRegion(String id);
}
