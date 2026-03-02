import 'package:hamqrg/src/features/user_reports/data/model/user_report_model.dart';

abstract interface class UserReportsDatasource {
  Future<List<UserReportModel>> getUserReports(String userId);
}
