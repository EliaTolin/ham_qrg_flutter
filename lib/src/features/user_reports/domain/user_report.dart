import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report.freezed.dart';

enum UserReportStatus { pending, reviewed, resolved, rejected }

@freezed
abstract class UserReport with _$UserReport {
  const factory UserReport({
    required String id,
    required String repeaterId,
    required String repeaterCallsign,
    required String? repeaterName,
    required String description,
    required UserReportStatus status,
    required String? coordinatorResponse,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? resolvedAt,
  }) = _UserReport;
}
