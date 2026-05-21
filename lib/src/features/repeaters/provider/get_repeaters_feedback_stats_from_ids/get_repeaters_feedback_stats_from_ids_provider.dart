import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeaters_feedback_stats_from_ids_provider.g.dart';

@riverpod
Future<Map<String, RepeaterFeedbackStats>> getRepeatersFeedbackStatsFromIds(
  Ref ref,
  List<String> repeaterIds,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeatersFeedbackStatsFromIds(
    repeaterIds,
    userId: userId,
  );
}
