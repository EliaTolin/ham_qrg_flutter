import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_report.dart';
import 'package:hamqrg/src/features/user_reports/domain/user_submission.dart';

part 'user_reports_state.freezed.dart';

enum UserReportStatusFilter { all, open, closed }

@freezed
abstract class UserReportsState with _$UserReportsState {
  const factory UserReportsState({
    required List<UserReport> reports,
    @Default([]) List<UserSubmission> submissions,
    @Default(UserReportStatusFilter.all) UserReportStatusFilter activeFilter,
    @Default(false) bool hasLoadError,
  }) = _UserReportsState;
}
