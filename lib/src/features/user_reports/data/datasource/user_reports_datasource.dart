import 'package:hamqrg/src/features/user_reports/data/model/user_report_model.dart';
import 'package:hamqrg/src/features/user_reports/data/model/user_submission_model.dart';

abstract interface class UserReportsDatasource {
  Future<List<UserReportModel>> getUserReports(String userId);
  Future<List<UserSubmissionModel>> getUserSubmissions(String userId);
}
