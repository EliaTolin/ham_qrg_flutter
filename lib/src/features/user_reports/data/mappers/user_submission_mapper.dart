import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/user_reports/data/model/user_submission_model.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_submission.dart';

class UserSubmissionMapper
    implements Mapper<UserSubmission, UserSubmissionModel> {
  @override
  UserSubmission fromModel(UserSubmissionModel model) {
    return UserSubmission(
      id: model.id,
      name: model.name,
      callsign: model.callsign,
      frequencyHz: model.frequencyHz,
      status: UserSubmissionStatus.values.firstWhere(
        (e) => e.name == model.status,
        orElse: () => UserSubmissionStatus.pending,
      ),
      coordinatorResponse: model.coordinatorResponse,
      createdAt: DateTime.parse(model.createdAt),
      respondedAt: model.respondedAt != null
          ? DateTime.parse(model.respondedAt!)
          : null,
    );
  }

  @override
  UserSubmissionModel toModel(UserSubmission entity) {
    return UserSubmissionModel(
      id: entity.id,
      frequencyHz: entity.frequencyHz,
      status: entity.status.name,
      createdAt: entity.createdAt.toIso8601String(),
      name: entity.name,
      callsign: entity.callsign,
    );
  }
}
