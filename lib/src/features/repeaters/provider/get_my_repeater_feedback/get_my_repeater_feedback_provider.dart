import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_my_repeater_feedback_provider.g.dart';

@riverpod
Future<RepeaterFeedback?> getMyRepeaterFeedback(
  Ref ref,
  String repeaterId,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    return null;
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getMyRepeaterFeedback(
    userId: userId,
    repeaterId: repeaterId,
  );
}
