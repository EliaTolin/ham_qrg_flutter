import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/feedback/feedback_model.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/feedback/feedback_stats_model.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_stats.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/station_kind.dart';

class FeedbackMapper implements Mapper<Feedback, FeedbackModel> {
  @override
  Feedback fromModel(FeedbackModel model) {
    return Feedback(
      id: model.id,
      repeaterId: model.repeaterId,
      userId: model.userId,
      type: _parseFeedbackType(model.type),
      station: _parseStationKind(model.station),
      latitude: model.lat,
      longitude: model.lon,
      comment: model.comment,
      createdAt: DateTime.parse(model.createdAt),
    );
  }

  @override
  FeedbackModel toModel(Feedback entity) {
    return FeedbackModel(
      id: entity.id,
      repeaterId: entity.repeaterId,
      userId: entity.userId,
      type: _feedbackTypeToString(entity.type),
      station: _stationKindToString(entity.station),
      lat: entity.latitude,
      lon: entity.longitude,
      comment: entity.comment,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }

  FeedbackType _parseFeedbackType(String type) {
    switch (type.toLowerCase()) {
      case 'like':
        return FeedbackType.like;
      case 'down':
        return FeedbackType.down;
      default:
        throw ArgumentError('Unknown feedback type: $type');
    }
  }

  String _feedbackTypeToString(FeedbackType type) {
    switch (type) {
      case FeedbackType.like:
        return 'like';
      case FeedbackType.down:
        return 'down';
    }
  }

  StationKind _parseStationKind(String station) {
    switch (station.toLowerCase()) {
      case 'portable':
        return StationKind.portable;
      case 'mobile':
        return StationKind.mobile;
      case 'fixed':
        return StationKind.fixed;
      default:
        throw ArgumentError('Unknown station kind: $station');
    }
  }

  String _stationKindToString(StationKind station) {
    switch (station) {
      case StationKind.portable:
        return 'portable';
      case StationKind.mobile:
        return 'mobile';
      case StationKind.fixed:
        return 'fixed';
    }
  }
}

class FeedbackStatsMapper implements Mapper<FeedbackStats, FeedbackStatsModel> {
  @override
  FeedbackStats fromModel(FeedbackStatsModel model) {
    return FeedbackStats(
      repeaterId: model.repeaterId,
      likesTotal: model.likesTotal,
      downTotal: model.downTotal,
      lastLikeAt: model.lastLikeAt != null ? DateTime.parse(model.lastLikeAt!) : null,
      lastDownAt: model.lastDownAt != null ? DateTime.parse(model.lastDownAt!) : null,
    );
  }

  @override
  FeedbackStatsModel toModel(FeedbackStats entity) {
    return FeedbackStatsModel(
      repeaterId: entity.repeaterId,
      likesTotal: entity.likesTotal,
      downTotal: entity.downTotal,
      lastLikeAt: entity.lastLikeAt?.toIso8601String(),
      lastDownAt: entity.lastDownAt?.toIso8601String(),
    );
  }
}
