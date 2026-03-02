import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/src/features/user_reports/data/model/user_report_model.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';

class UserReportMapper implements Mapper<UserReport, UserReportModel> {
  @override
  UserReport fromModel(UserReportModel model) {
    final repeaterData = model.repeater;
    return UserReport(
      id: model.id,
      repeaterId: model.repeaterId,
      repeaterCallsign: repeaterData?['callsign'] as String? ?? '—',
      repeaterName: repeaterData?['name'] as String?,
      description: model.description,
      status: UserReportStatus.values.firstWhere(
        (e) => e.name == model.status,
        orElse: () => UserReportStatus.pending,
      ),
      coordinatorResponse: model.coordinatorResponse,
      createdAt: DateTime.parse(model.createdAt),
      updatedAt: DateTime.parse(model.updatedAt),
      resolvedAt:
          model.resolvedAt != null ? DateTime.parse(model.resolvedAt!) : null,
    );
  }

  @override
  UserReportModel toModel(UserReport entity) {
    return UserReportModel(
      id: entity.id,
      repeaterId: entity.repeaterId,
      description: entity.description,
      status: entity.status.name,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
    );
  }
}
