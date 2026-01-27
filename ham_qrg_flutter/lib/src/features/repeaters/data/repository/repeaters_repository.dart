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
  }) async {
    final data = await _datasource.getRepeatersNearby(
      latitude: latitude,
      longitude: longitude,
      radiusKm: radiusKm,
      accessModes: _mapper.mapAccessModesToValues(accessModes),
    );
    return data.map(_mapper.fromModel).toList();
  }

  Future<List<Repeater>> searchRepeaters({
    required String query,
    int limit = 100,
    List<AccessMode>? accessModes,
  }) async {
    final data = await _datasource.searchRepeaters(
      query: query,
      limit: limit,
      accessModes: _mapper.mapAccessModesToValues(accessModes),
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
    String repeaterId,
  ) async {
    final model = await _datasource.getRepeaterFeedbackStats(repeaterId);
    if (model == null) {
      return null;
    }
    return _feedbackStatsMapper.fromModel(model);
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
}

@riverpod
RepeatersRepository repeatersRepository(Ref ref) {
  final datasource = ref.read(repeatersSupabaseDatasourceProvider);
  return RepeatersRepository(datasource);
}
