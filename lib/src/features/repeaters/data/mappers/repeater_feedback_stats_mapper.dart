import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_stats_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';

class RepeaterFeedbackStatsMapper
    implements Mapper<RepeaterFeedbackStats, RepeaterFeedbackStatsModel> {
  @override
  RepeaterFeedbackStats fromModel(RepeaterFeedbackStatsModel model) {
    return RepeaterFeedbackStats(
      repeaterId: model.repeaterId,
      likesTotal: model.likesTotal,
      downTotal: model.downTotal,
      hasMyLike: model.hasMyLike,
      lastLikeAt: model.lastLikeAt != null ? DateTime.parse(model.lastLikeAt!) : null,
      lastDownAt: model.lastDownAt != null ? DateTime.parse(model.lastDownAt!) : null,
    );
  }

  @override
  RepeaterFeedbackStatsModel toModel(RepeaterFeedbackStats entity) {
    return RepeaterFeedbackStatsModel(
      repeaterId: entity.repeaterId,
      likesTotal: entity.likesTotal,
      downTotal: entity.downTotal,
      hasMyLike: entity.hasMyLike,
      lastLikeAt: entity.lastLikeAt?.toIso8601String(),
      lastDownAt: entity.lastDownAt?.toIso8601String(),
    );
  }
}
