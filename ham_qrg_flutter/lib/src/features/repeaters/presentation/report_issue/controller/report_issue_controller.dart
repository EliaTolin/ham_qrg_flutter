import 'package:hamqrg/src/features/repeaters/presentation/report_issue/controller/state/report_issue_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/submit_repeater_report/submit_repeater_report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_issue_controller.g.dart';

@riverpod
class ReportIssueController extends _$ReportIssueController {
  static const int minChars = 10;
  static const int maxChars = 2000;

  @override
  FutureOr<ReportIssueState> build(String repeaterId) async {
    final repeater = await ref.read(getRepeaterByIdProvider(repeaterId).future);
    if (repeater == null) {
      throw Exception('Repeater not found');
    }
    return ReportIssueState(repeater: repeater);
  }

  void setDescription(String description) {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncData(currentState.copyWith(description: description));
    }
  }

  void setConfirmed({required bool confirmed}) {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncData(currentState.copyWith(isConfirmed: confirmed));
    }
  }

  bool isFormValid() {
    final currentState = state.value;
    if (currentState == null) return false;

    final description = currentState.description.trim();
    return description.length >= minChars &&
        description.length <= maxChars &&
        currentState.isConfirmed;
  }

  Future<bool> submitReport() async {
    final currentState = state.value;
    if (currentState == null || !isFormValid()) return false;

    state = AsyncData(currentState.copyWith(isSubmitting: true));

    try {
      await ref.read(
        submitRepeaterReportProvider(
          repeaterId: currentState.repeater.id,
          description: currentState.description.trim(),
        ).future,
      );
      return true;
    } catch (e) {
      state = AsyncData(currentState.copyWith(isSubmitting: false));
      rethrow;
    }
  }
}
