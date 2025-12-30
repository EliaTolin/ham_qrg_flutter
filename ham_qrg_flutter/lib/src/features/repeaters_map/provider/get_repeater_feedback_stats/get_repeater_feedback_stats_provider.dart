import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_stats.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_feedback_stats_provider.g.dart';

@riverpod
Future<FeedbackStats?> getRepeaterFeedbackStats(
  Ref ref,
  String repeaterId,
) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeaterFeedbackStats(repeaterId);
}

