import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeater_access_mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeaters_mappers.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';

class RepeaterFeedbackMapper implements Mapper<RepeaterFeedback, RepeaterFeedbackModel> {
  @override
  RepeaterFeedback fromModel(RepeaterFeedbackModel model) {
    final profile = model.profile;

    return RepeaterFeedback(
      id: model.id,
      repeater: RepeatersMappers().fromModel(model.repeater),
      userId: model.userId,
      type: FeedbackType.values.firstWhere(
        (e) => e.name == model.type.toLowerCase(),
      ),
      station: StationKind.values.firstWhere(
        (e) => e.name == model.station.toLowerCase(),
      ),
      latitude: model.lat,
      longitude: model.lon,
      comment: model.comment,
      repeaterAccess: RepeaterAccessMapper().fromModel(model.repeaterAccess),
      createdAt: DateTime.parse(model.createdAt),
      userCallsign: profile?['callsign'] as String?,
      userDisplayName: _buildDisplayName(profile),
      userAvatarUrl: profile?['propic'] as String?,
    );
  }

  @override
  RepeaterFeedbackModel toModel(RepeaterFeedback entity) {
    return RepeaterFeedbackModel(
      id: entity.id,
      repeater: RepeatersMappers().toModel(entity.repeater),
      repeaterAccess: RepeaterAccessMapper().toModel(entity.repeaterAccess),
      userId: entity.userId,
      type: entity.type.name,
      station: entity.station.name,
      lat: entity.latitude,
      lon: entity.longitude,
      comment: entity.comment,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }

  static String? _buildDisplayName(Map<String, dynamic>? profile) {
    if (profile == null) return null;
    final parts = [
      profile['first_name'] as String?,
      profile['last_name'] as String?,
    ].whereType<String>().where((s) => s.isNotEmpty);
    return parts.isNotEmpty ? parts.join(' ') : null;
  }
}
