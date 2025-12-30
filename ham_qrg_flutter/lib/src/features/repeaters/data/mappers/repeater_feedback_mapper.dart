import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:ham_qrg/src/features/repeaters/domain/feedback/station_kind.dart';

class RepeaterFeedbackMapper
    implements Mapper<RepeaterFeedback, RepeaterFeedbackModel> {
  @override
  RepeaterFeedback fromModel(RepeaterFeedbackModel model) {
    return RepeaterFeedback(
      id: model.id,
      repeaterId: model.repeaterId,
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
      createdAt: DateTime.parse(model.createdAt),
    );
  }

  @override
  RepeaterFeedbackModel toModel(RepeaterFeedback entity) {
    return RepeaterFeedbackModel(
      id: entity.id,
      repeaterId: entity.repeaterId,
      userId: entity.userId,
      type: entity.type.name,
      station: entity.station.name,
      lat: entity.latitude,
      lon: entity.longitude,
      comment: entity.comment,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }
}

