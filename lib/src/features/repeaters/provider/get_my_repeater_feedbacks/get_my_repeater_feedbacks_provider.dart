import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_my_repeater_feedbacks_provider.g.dart';

@riverpod
Future<List<RepeaterFeedback>> getMyRepeaterFeedbacks(
  Ref ref,
  String repeaterId,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    return [];
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getMyRepeaterFeedbacks(
    userId: userId,
    repeaterId: repeaterId,
  );
}
