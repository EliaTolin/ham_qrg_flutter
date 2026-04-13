import 'package:hamqrg/src/features/spots/data/datasource/spots_datasource.dart';
import 'package:hamqrg/src/features/spots/data/datasource/spots_supabase_datasource.dart';
import 'package:hamqrg/src/features/spots/data/mappers/spot_mapper.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'spots_repository.g.dart';

class SpotsRepository {
  SpotsRepository(this._datasource) : _mapper = SpotMapper();
  final SpotsDatasource _datasource;
  final SpotMapper _mapper;

  Future<RepeaterSpot> createSelfSpot({
    required String repeaterId,
    required int durationMinutes,
    String? accessId,
  }) async {
    final model = await _datasource.createSelfSpot(
      repeaterId: repeaterId,
      durationMinutes: durationMinutes,
      accessId: accessId,
    );
    return _mapper.fromModel(model);
  }

  Future<RepeaterSpot> createOtherSpot({
    required String repeaterId,
    required String spottedCallsign,
    String? accessId,
  }) async {
    final model = await _datasource.createOtherSpot(
      repeaterId: repeaterId,
      spottedCallsign: spottedCallsign,
      accessId: accessId,
    );
    return _mapper.fromModel(model);
  }

  Future<RepeaterSpot> closeSpot({required String spotId}) async {
    final model = await _datasource.closeSpot(spotId: spotId);
    return _mapper.fromModel(model);
  }

  Future<List<RepeaterSpot>> getActiveSpotsForRepeater(
    String repeaterId,
  ) async {
    final models = await _datasource.getActiveSpotsForRepeater(repeaterId);
    return models.map(_mapper.fromModel).toList();
  }

  Future<List<RepeaterSpot>> getRecentSpots() async {
    final models = await _datasource.getRecentSpots();
    return models.map(_mapper.fromModel).toList();
  }

  Future<RepeaterSpot?> getMyActiveSpot(String userId) async {
    final model = await _datasource.getMyActiveSpot(userId);
    if (model == null) return null;
    return _mapper.fromModel(model);
  }

  Future<Set<String>> getRepeaterIdsWithActiveSpots() async {
    final ids = await _datasource.getRepeaterIdsWithActiveSpots();
    return ids.toSet();
  }

  Future<void> setClusterNotificationsEnabled({required bool enabled}) {
    return _datasource.setClusterNotificationsEnabled(enabled: enabled);
  }

  Future<void> setFavoriteClusterNotifications({
    required String favoriteId,
    required bool enabled,
  }) {
    return _datasource.setFavoriteClusterNotifications(
      favoriteId: favoriteId,
      enabled: enabled,
    );
  }
}

@riverpod
SpotsRepository spotsRepository(Ref ref) {
  final client = Supabase.instance.client;
  return SpotsRepository(SpotsSupabaseDatasource(client));
}
