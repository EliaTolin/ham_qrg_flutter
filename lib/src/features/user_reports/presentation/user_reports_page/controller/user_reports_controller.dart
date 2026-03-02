import 'package:hamqrg/src/features/user_reports/presentation/user_reports_page/controller/state/user_reports_state.dart';
import 'package:hamqrg/src/features/user_reports/provider/get_user_reports/get_user_reports_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_reports_controller.g.dart';

@riverpod
class UserReportsController extends _$UserReportsController {
  @override
  FutureOr<UserReportsState> build() async {
    final reports = await ref.watch(getUserReportsProvider.future);
    return UserReportsState(reports: reports);
  }

  void setFilter(UserReportStatusFilter filter) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(activeFilter: filter));
  }

  Future<void> reload() async {
    final currentState = state.value;
    try {
      ref.invalidate(getUserReportsProvider);
      final reports = await ref.read(getUserReportsProvider.future);
      state = AsyncData(
        (currentState ?? const UserReportsState(reports: [])).copyWith(
          reports: reports,
          hasLoadError: false,
        ),
      );
    } catch (_) {
      state = AsyncData(
        (currentState ?? const UserReportsState(reports: [])).copyWith(
          hasLoadError: true,
        ),
      );
    }
  }
}
