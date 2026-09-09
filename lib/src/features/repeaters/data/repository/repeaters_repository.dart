import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_supabase_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeater_feedback_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeater_feedback_stats_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeaters_mappers.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_repository.g.dart';

class RepeatersRepository {
  RepeatersRepository(this._datasource);
  final RepeatersDatasource _datasource;

  final _mapper = RepeatersMappers();
  final _feedbackMapper = RepeaterFeedbackMapper();
  final _feedbackStatsMapper = RepeaterFeedbackStatsMapper();

  Future<List<Repeater>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<AccessMode>? accessModes,
  }) async {
    final data = await _datasource.getRepeatersInBounds(
      lat1: lat1,
      lon1: lon1,
      lat2: lat2,
      lon2: lon2,
      accessModes: _mapper.mapAccessModesToValues(accessModes),
    );
    return data.map(_mapper.fromModel).toList();
  }

  Future<List<Repeater>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    List<AccessMode>? accessModes,
    int limit = 50,
  }) async {
    final data = await _datasource.getRepeatersNearby(
      latitude: latitude,
      longitude: longitude,
      radiusKm: radiusKm,
      accessModes: _mapper.mapAccessModesToValues(accessModes),
      limit: limit,
    );
    return data.map(_mapper.fromModel).toList();
  }

  Future<List<Repeater>> searchRepeaters({
    required String query,
    int limit = 100,
    List<AccessMode>? accessModes,
    double? latitude,
    double? longitude,
  }) async {
    final data = await _datasource.searchRepeaters(
      query: query,
      limit: limit,
      accessModes: _mapper.mapAccessModesToValues(accessModes),
      latitude: latitude,
      longitude: longitude,
    );
    return data.map(_mapper.fromModel).toList();
  }

  Future<int> getTotalRepeatersCount() async {
    return _datasource.getTotalRepeatersCount();
  }

  Future<int?> getTotalFavoritesCount(String userId) async {
    return _datasource.getTotalFavoritesCount(userId);
  }

  Future<List<String>> getFavoriteRepeatersIds(String userId) async {
    return _datasource.getFavoriteRepeatersIds(userId);
  }

  Future<List<Repeater>> getFavoriteRepeaters(String userId) async {
    final data = await _datasource.getFavoriteRepeaters(userId);
    return data.map(_mapper.fromModel).toList();
  }

  /// Returns favorite metadata: maps of repeaterId → clusterNotificationsEnabled
  /// and repeaterId → favoriteId.
  Future<
      ({
        Map<String, bool> clusterNotifications,
        Map<String, String> favoriteIds
      })> getFavoritesMeta(String userId) async {
    final rows = await _datasource.getFavoritesMeta(userId);
    final clusterNotifications = <String, bool>{};
    final favoriteIds = <String, String>{};
    for (final row in rows) {
      final repeaterId = row['repeater_id'] as String;
      clusterNotifications[repeaterId] =
          row['cluster_notifications_enabled'] as bool? ?? true;
      favoriteIds[repeaterId] = row['id'] as String;
    }
    return (
      clusterNotifications: clusterNotifications,
      favoriteIds: favoriteIds
    );
  }

  Future<Repeater?> getRepeaterById(String repeaterId) async {
    final model = await _datasource.getRepeaterById(repeaterId);
    if (model == null) {
      return null;
    }
    return _mapper.fromModel(model);
  }

  Future<void> addFavoriteRepeater(String userId, String repeaterId) async {
    return _datasource.addFavoriteRepeater(userId, repeaterId);
  }

  Future<void> removeFavoriteRepeater(String userId, String repeaterId) async {
    return _datasource.removeFavoriteRepeater(userId, repeaterId);
  }

  // Feedback methods
  Future<RepeaterFeedbackStats?> getRepeaterFeedbackStats(
    String repeaterId, {
    String? userId,
  }) async {
    final model = await _datasource.getRepeaterFeedbackStats(
      repeaterId,
      userId: userId,
    );
    if (model == null) {
      return null;
    }
    return _feedbackStatsMapper.fromModel(model);
  }

  Future<Map<String, RepeaterFeedbackStats>> getRepeatersFeedbackStatsFromIds(
    List<String> repeaterIds, {
    String? userId,
  }) async {
    final models = await _datasource.getRepeatersFeedbackStatsFromIds(
      repeaterIds,
      userId: userId,
    );
    final stats = <String, RepeaterFeedbackStats>{};
    for (final model in models) {
      final entity = _feedbackStatsMapper.fromModel(model);
      stats[entity.repeaterId] = entity;
    }
    return stats;
  }

  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String repeaterAccessId,
    required FeedbackType type,
    required StationKind station,
    required double latitude,
    required double longitude,
    required String comment,
  }) async {
    return _datasource.addRepeaterFeedback(
      userId: userId,
      repeaterId: repeaterId,
      repeaterAccessId: repeaterAccessId,
      type: type.name,
      station: station.name,
      latitude: latitude,
      longitude: longitude,
      comment: comment,
    );
  }

  Future<void> deleteRepeaterFeedback(String userId, String feedbackId) async {
    return _datasource.deleteRepeaterFeedback(userId, feedbackId);
  }

  Future<List<RepeaterFeedback>> getRepeaterFeedbacks({
    required String repeaterId,
    int? limit,
  }) async {
    final data = await _datasource.getRepeaterFeedbacks(
      repeaterId: repeaterId,
      limit: limit,
    );
    return data.map(_feedbackMapper.fromModel).toList();
  }

  Future<RepeaterFeedback?> getMyRepeaterFeedback({
    required String userId,
    required String repeaterId,
  }) async {
    final model = await _datasource.getMyRepeaterFeedback(
      userId: userId,
      repeaterId: repeaterId,
    );
    if (model == null) {
      return null;
    }
    return _feedbackMapper.fromModel(model);
  }

  Future<List<RepeaterFeedback>> getMyRepeaterFeedbacks({
    required String userId,
    required String repeaterId,
  }) async {
    final data = await _datasource.getMyRepeaterFeedbacks(
      userId: userId,
      repeaterId: repeaterId,
    );
    return data.map(_feedbackMapper.fromModel).toList();
  }

  // Report methods
  Future<void> submitRepeaterReport({
    required String userId,
    required String repeaterId,
    required String description,
  }) async {
    return _datasource.submitRepeaterReport(
      userId: userId,
      repeaterId: repeaterId,
      description: description,
    );
  }

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
  }) async {
    return _datasource.submitRepeaterSubmission(
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
    );
  }
}

/// **`watch` e non `read`**: il datasource è costruito attorno a
/// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
/// della costruzione**. Letto con `read`, questo repository resterebbe
/// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
/// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
/// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
/// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
/// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
/// repository si ricostruisce da sé quando i flag si assestano, e le query
/// che lo osservano ripartono da sole.
@riverpod
RepeatersRepository repeatersRepository(Ref ref) {
  final datasource = ref.watch(repeatersSupabaseDatasourceProvider);
  return RepeatersRepository(datasource);
}
