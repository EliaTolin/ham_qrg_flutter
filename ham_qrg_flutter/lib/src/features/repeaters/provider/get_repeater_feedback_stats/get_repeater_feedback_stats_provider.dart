import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_feedback_stats_provider.g.dart';

@riverpod
Future<RepeaterFeedbackStats?> getRepeaterFeedbackStats(
  Ref ref,
  String repeaterId,
) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeaterFeedbackStats(repeaterId);
}
