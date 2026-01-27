import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repeater_feedbacks_provider.g.dart';

@riverpod
Future<List<RepeaterFeedback>> getRepeaterFeedbacks(
  Ref ref, {
  required String repeaterId,
  int? limit,
}) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getRepeaterFeedbacks(
    repeaterId: repeaterId,
    limit: limit,
  );
}
