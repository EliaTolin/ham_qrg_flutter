import 'package:ham_qrg/src/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:ham_qrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_dashboard_statistics_provider.g.dart';

@riverpod
Future<DashboardStatistics> getDashboardStatistics(Ref ref) async {
  final repository = ref.read(dashboardRepositoryProvider);
  return repository.getDashboardStatistics();
}
