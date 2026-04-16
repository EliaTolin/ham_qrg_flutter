import 'package:hamqrg/src/features/user_reports/data/datasource/user_reports_datasource.dart';
import 'package:hamqrg/src/features/user_reports/data/datasource/user_reports_supabase_datasource.dart';
import 'package:hamqrg/src/features/user_reports/data/mappers/user_report_mapper.dart';
import 'package:hamqrg/src/features/user_reports/data/mappers/user_submission_mapper.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_submission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_reports_repository.g.dart';

class UserReportsRepository {
  UserReportsRepository(this._datasource);
  final UserReportsDatasource _datasource;

  final _reportMapper = UserReportMapper();
  final _submissionMapper = UserSubmissionMapper();

  Future<List<UserReport>> getUserReports(String userId) async {
    final models = await _datasource.getUserReports(userId);
    return models.map(_reportMapper.fromModel).toList();
  }

  Future<List<UserSubmission>> getUserSubmissions(String userId) async {
    final models = await _datasource.getUserSubmissions(userId);
    return models.map(_submissionMapper.fromModel).toList();
  }
}

@riverpod
UserReportsRepository userReportsRepository(Ref ref) {
  final datasource = ref.read(userReportsSupabaseDatasourceProvider);
  return UserReportsRepository(datasource);
}
