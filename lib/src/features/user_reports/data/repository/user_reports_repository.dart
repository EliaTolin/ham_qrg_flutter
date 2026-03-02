import 'package:hamqrg/src/features/user_reports/data/datasource/user_reports_datasource.dart';
import 'package:hamqrg/src/features/user_reports/data/datasource/user_reports_supabase_datasource.dart';
import 'package:hamqrg/src/features/user_reports/data/mappers/user_report_mapper.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_reports_repository.g.dart';

class UserReportsRepository {
  UserReportsRepository(this._datasource);
  final UserReportsDatasource _datasource;

  final _mapper = UserReportMapper();

  Future<List<UserReport>> getUserReports(String userId) async {
    final models = await _datasource.getUserReports(userId);
    return models.map(_mapper.fromModel).toList();
  }
}

@riverpod
UserReportsRepository userReportsRepository(Ref ref) {
  final datasource = ref.read(userReportsSupabaseDatasourceProvider);
  return UserReportsRepository(datasource);
}
