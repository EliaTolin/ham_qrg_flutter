import 'package:hamqrg/common/cache/cache_keys.dart';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_stats_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';
import 'package:remote_caching/remote_caching.dart';

/// Decorator offline-first di [RepeatersDatasource].
///
/// Due responsabilità, entrambe assenti nel datasource Supabase:
///
/// 1. **Limite di tempo su ogni chiamata remota** (per tutti gli utenti):
///    il client HTTP di Supabase non ha timeout, quindi offline una richiesta
///    può restare appesa per minuti. Qui ogni remota è corto-circuitata se il
///    device è senza rete (`OfflineException` immediata) e comunque limitata
///    da [remoteTimeout] — politica condivisa in [OfflineCacheGate].
/// 2. **Cache network-first delle letture** (solo utenti Pro): online il dato
///    è sempre fresco e riscrive la voce; offline `remote_caching` ricade
///    sulla copia conservata, anche scaduta. I free user bypassano la cache
///    e mantengono il comportamento di sempre (più il timeout).
///
/// Le scritture non vengono mai messe in coda: offline falliscono subito e
/// il chiamante mostra l'errore. Dopo una scrittura riuscita i prefissi
/// interessati vengono invalidati, così la rilettura non serve dati stantii.
///
/// ## Prefissi delle chiavi
///
/// - `repeaters:v1:` letture ripetitori (bounds/nearby/search/count)
/// - `favorites:v1:<userId>:` preferiti dell'utente
/// - `feedback:v1:` feedback e statistiche
///
/// Distinti dal prefisso `repeater:v1:` della cache condivisa delle postazioni
/// salvate (INV-1/INV-2 in CLAUDE.md): qui si invalida SOLO per prefisso
/// proprio, mai con `clearCache()`.
class CachedRepeatersDatasource implements RepeatersDatasource {
  CachedRepeatersDatasource({
    required RepeatersDatasource inner,
    required OfflineCacheGate gate,
  })  : _inner = inner,
        _gate = gate;

  final RepeatersDatasource _inner;
  final OfflineCacheGate _gate;

  /// 6s: abbastanza per una query Supabase sana, abbastanza poco da non
  /// tenere in ostaggio la UI su una rete degradata (Wi-Fi senza internet)
  /// prima della ricaduta sulla cache. Va passato al gate dal provider.
  static const remoteTimeout = Duration(seconds: 6);
  static const _repeatersTtl = Duration(days: 30);
  static const _feedbackTtl = Duration(days: 7);

  /// Passo della griglia (in gradi, ~11 km) su cui vengono agganciati i bounds
  /// della mappa: chiavi deterministiche e query leggermente più ampie del
  /// viewport, così pan ripetuti sulla stessa zona colpiscono la cache.
  static const _boundsGridDeg = 0.1;

  static List<RepeaterModel> _repeaterListFromJson(Object? json) =>
      (json! as List)
          .map((e) => RepeaterModel.fromJson(e as Map<String, dynamic>))
          .toList();

  static List<RepeaterFeedbackModel> _feedbackListFromJson(Object? json) =>
      (json! as List)
          .map(
            (e) => RepeaterFeedbackModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();

  // ---------------------------------------------------------------------------
  // Letture ripetitori
  // ---------------------------------------------------------------------------

  @override
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? accessModes,
  }) {
    if (!_gate.isPro) {
      return _gate.remote(
        () => _inner.getRepeatersInBounds(
          lat1: lat1,
          lon1: lon1,
          lat2: lat2,
          lon2: lon2,
          accessModes: accessModes,
        ),
      );
    }

    // I bounds sono continui: agganciati verso l'esterno alla griglia, la
    // stessa zona produce la stessa chiave e la query resta un soprainsieme
    // del viewport (la mappa clusterizza comunque ciò che riceve).
    final minLat =
        CacheKeys.snapDown(lat1 < lat2 ? lat1 : lat2, _boundsGridDeg);
    final maxLat = CacheKeys.snapUp(lat1 > lat2 ? lat1 : lat2, _boundsGridDeg);
    final minLon =
        CacheKeys.snapDown(lon1 < lon2 ? lon1 : lon2, _boundsGridDeg);
    final maxLon = CacheKeys.snapUp(lon1 > lon2 ? lon1 : lon2, _boundsGridDeg);

    final key = 'repeaters:v1:bounds'
        ':${CacheKeys.coord(minLat, 1)}:${CacheKeys.coord(minLon, 1)}'
        ':${CacheKeys.coord(maxLat, 1)}:${CacheKeys.coord(maxLon, 1)}'
        ':${CacheKeys.modes(accessModes)}';

    return _gate.cached(
      key: key,
      ttl: _repeatersTtl,
      fetch: () => _inner.getRepeatersInBounds(
        lat1: minLat,
        lon1: minLon,
        lat2: maxLat,
        lon2: maxLon,
        accessModes: accessModes,
      ),
      fromJson: _repeaterListFromJson,
    );
  }

  @override
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    List<String>? accessModes,
    int limit = 50,
  }) {
    // 1 decimale (~11 km di bucket): la posizione GPS cambia a ogni avvio e
    // con bucket più fini la chiave non colpirebbe quasi mai la cache; per
    // una query con raggio di decine di km lo scarto è irrilevante.
    final key = 'repeaters:v1:nearby'
        ':${CacheKeys.coord(latitude, 1)}:${CacheKeys.coord(longitude, 1)}'
        ':${radiusKm.toStringAsFixed(0)}:$limit:${CacheKeys.modes(accessModes)}';
    return _gate.cached(
      key: key,
      ttl: _repeatersTtl,
      fetch: () => _inner.getRepeatersNearby(
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
        accessModes: accessModes,
        limit: limit,
      ),
      fromJson: _repeaterListFromJson,
    );
  }

  @override
  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit = 100,
    List<String>? accessModes,
    double? latitude,
    double? longitude,
  }) {
    final key = 'repeaters:v1:search'
        ':${query.trim().toLowerCase()}:$limit:${CacheKeys.modes(accessModes)}'
        ':${latitude == null ? '-' : CacheKeys.coord(latitude, 1)}'
        ':${longitude == null ? '-' : CacheKeys.coord(longitude, 1)}';
    return _gate.cached(
      key: key,
      ttl: _repeatersTtl,
      fetch: () => _inner.searchRepeaters(
        query: query,
        limit: limit,
        accessModes: accessModes,
        latitude: latitude,
        longitude: longitude,
      ),
      fromJson: _repeaterListFromJson,
    );
  }

  @override
  Future<int> getTotalRepeatersCount() {
    return _gate.cached(
      key: 'repeaters:v1:count',
      ttl: _repeatersTtl,
      fetch: _inner.getTotalRepeatersCount,
      fromJson: (json) => json! as int,
    );
  }

  /// Nessun secondo livello di cache: la scheda ripetitore passa già dalla
  /// cache condivisa `repeater:v1:` (`getRepeaterByIdProvider`); qui serve
  /// solo il guard, così offline il suo fallback scatta subito.
  @override
  Future<RepeaterModel?> getRepeaterById(String repeaterId) {
    return _gate.remote(() => _inner.getRepeaterById(repeaterId));
  }

  // ---------------------------------------------------------------------------
  // Preferiti
  // ---------------------------------------------------------------------------

  @override
  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId) {
    return _gate.cached(
      key: 'favorites:v1:$userId:list',
      ttl: _repeatersTtl,
      fetch: () => _inner.getFavoriteRepeaters(userId),
      fromJson: _repeaterListFromJson,
    );
  }

  @override
  Future<List<String>> getFavoriteRepeatersIds(String userId) {
    return _gate.cached(
      key: 'favorites:v1:$userId:ids',
      ttl: _repeatersTtl,
      fetch: () => _inner.getFavoriteRepeatersIds(userId),
      fromJson: (json) => (json! as List).cast<String>(),
    );
  }

  @override
  Future<int?> getTotalFavoritesCount(String userId) {
    return _gate.cachedNullable(
      key: 'favorites:v1:$userId:count',
      ttl: _repeatersTtl,
      fetch: () => _inner.getTotalFavoritesCount(userId),
      encode: (value) => value,
      decode: (json) => json! as int,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getFavoritesMeta(String userId) {
    return _gate.cached(
      key: 'favorites:v1:$userId:meta',
      ttl: _repeatersTtl,
      fetch: () => _inner.getFavoritesMeta(userId),
      fromJson: (json) => (json! as List)
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList(),
    );
  }

  @override
  Future<void> addFavoriteRepeater(String userId, String repeaterId) async {
    await _gate.remote(() => _inner.addFavoriteRepeater(userId, repeaterId));
    await RemoteCaching.instance.clearCacheByPrefix('favorites:v1:$userId:');
  }

  @override
  Future<void> removeFavoriteRepeater(String userId, String repeaterId) async {
    await _gate.remote(() => _inner.removeFavoriteRepeater(userId, repeaterId));
    await RemoteCaching.instance.clearCacheByPrefix('favorites:v1:$userId:');
  }

  // ---------------------------------------------------------------------------
  // Feedback
  // ---------------------------------------------------------------------------

  @override
  Future<RepeaterFeedbackStatsModel?> getRepeaterFeedbackStats(
    String repeaterId, {
    String? userId,
  }) {
    return _gate.cachedNullable(
      key: 'feedback:v1:stats:$repeaterId:${userId ?? '-'}',
      ttl: _feedbackTtl,
      fetch: () => _inner.getRepeaterFeedbackStats(
        repeaterId,
        userId: userId,
      ),
      encode: (value) => value.toJson(),
      decode: (json) =>
          RepeaterFeedbackStatsModel.fromJson(json! as Map<String, dynamic>),
    );
  }

  @override
  Future<List<RepeaterFeedbackStatsModel>> getRepeatersFeedbackStatsFromIds(
    List<String> repeaterIds, {
    String? userId,
  }) {
    return _gate.cached(
      key: 'feedback:v1:statsmulti'
          ':${CacheKeys.idsHash(repeaterIds)}:${userId ?? '-'}',
      ttl: _feedbackTtl,
      fetch: () => _inner.getRepeatersFeedbackStatsFromIds(
        repeaterIds,
        userId: userId,
      ),
      fromJson: (json) => (json! as List)
          .map(
            (e) => RepeaterFeedbackStatsModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<List<RepeaterFeedbackModel>> getRepeaterFeedbacks({
    required String repeaterId,
    int? limit,
  }) {
    return _gate.cached(
      key: 'feedback:v1:list:$repeaterId:${limit ?? 'all'}',
      ttl: _feedbackTtl,
      fetch: () => _inner.getRepeaterFeedbacks(
        repeaterId: repeaterId,
        limit: limit,
      ),
      fromJson: _feedbackListFromJson,
    );
  }

  @override
  Future<RepeaterFeedbackModel?> getMyRepeaterFeedback({
    required String userId,
    required String repeaterId,
  }) {
    return _gate.cachedNullable(
      key: 'feedback:v1:my:$userId:$repeaterId',
      ttl: _feedbackTtl,
      fetch: () => _inner.getMyRepeaterFeedback(
        userId: userId,
        repeaterId: repeaterId,
      ),
      encode: (value) => value.toJson(),
      decode: (json) =>
          RepeaterFeedbackModel.fromJson(json! as Map<String, dynamic>),
    );
  }

  @override
  Future<List<RepeaterFeedbackModel>> getMyRepeaterFeedbacks({
    required String userId,
    required String repeaterId,
  }) {
    return _gate.cached(
      key: 'feedback:v1:mine:$userId:$repeaterId',
      ttl: _feedbackTtl,
      fetch: () => _inner.getMyRepeaterFeedbacks(
        userId: userId,
        repeaterId: repeaterId,
      ),
      fromJson: _feedbackListFromJson,
    );
  }

  @override
  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String repeaterAccessId,
    required String type,
    required String station,
    required double latitude,
    required double longitude,
    required String comment,
  }) async {
    await _gate.remote(
      () => _inner.addRepeaterFeedback(
        userId: userId,
        repeaterId: repeaterId,
        repeaterAccessId: repeaterAccessId,
        type: type,
        station: station,
        latitude: latitude,
        longitude: longitude,
        comment: comment,
      ),
    );
    await RemoteCaching.instance.clearCacheByPrefix('feedback:v1:');
  }

  @override
  Future<void> deleteRepeaterFeedback(String userId, String feedbackId) async {
    await _gate.remote(() => _inner.deleteRepeaterFeedback(userId, feedbackId));
    await RemoteCaching.instance.clearCacheByPrefix('feedback:v1:');
  }

  // ---------------------------------------------------------------------------
  // Segnalazioni e proposte (sola delega, con guard)
  // ---------------------------------------------------------------------------

  @override
  Future<void> submitRepeaterReport({
    required String userId,
    required String repeaterId,
    required String description,
  }) {
    return _gate.remote(
      () => _inner.submitRepeaterReport(
        userId: userId,
        repeaterId: repeaterId,
        description: description,
      ),
    );
  }

  @override
  Future<void> submitRepeaterSubmission({
    required String userId,
    required String name,
    required String callsign,
    required int frequencyHz,
    required List<Map<String, dynamic>> accesses,
    int? shiftHz,
    String? region,
    String? provinceCode,
    String? locality,
    double? lat,
    double? lon,
    String? locator,
    String? notes,
  }) {
    return _gate.remote(
      () => _inner.submitRepeaterSubmission(
        userId: userId,
        name: name,
        callsign: callsign,
        frequencyHz: frequencyHz,
        accesses: accesses,
        shiftHz: shiftHz,
        region: region,
        provinceCode: provinceCode,
        locality: locality,
        lat: lat,
        lon: lon,
        locator: locator,
        notes: notes,
      ),
    );
  }
}
