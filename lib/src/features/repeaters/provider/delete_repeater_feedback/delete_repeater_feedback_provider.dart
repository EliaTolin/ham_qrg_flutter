import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_repeater_feedback_provider.g.dart';

@riverpod
Future<void> deleteRepeaterFeedback(
  Ref ref,
  String feedbackId,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.deleteRepeaterFeedback(userId, feedbackId);
}
