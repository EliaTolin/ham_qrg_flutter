import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/user_reports/data/repository/user_reports_repository.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_reports_provider.g.dart';

@riverpod
Future<List<UserReport>> getUserReports(Ref ref) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(userReportsRepositoryProvider);
  return repository.getUserReports(userId);
}
