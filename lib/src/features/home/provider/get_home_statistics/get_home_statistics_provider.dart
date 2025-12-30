import 'package:ham_qrg/src/features/home/data/repository/home_dashboard_repository.dart';
import 'package:ham_qrg/src/features/home/domain/home_statistics/home_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_home_statistics_provider.g.dart';

@riverpod
Future<HomeStatistics> getHomeStatistics(Ref ref) async {
  final repository = ref.read(homeDashboardRepositoryProvider);
  return repository.getHomeStatistics();
}
