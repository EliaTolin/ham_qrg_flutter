import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'report_issue_state.freezed.dart';

@freezed
abstract class ReportIssueState with _$ReportIssueState {
  const factory ReportIssueState({
    required Repeater repeater,
    @Default('') String description,
    @Default(false) bool isConfirmed,
    @Default(false) bool isSubmitting,
  }) = _ReportIssueState;
}
