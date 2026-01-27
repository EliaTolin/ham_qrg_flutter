import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_repeater_report_provider.g.dart';

@riverpod
Future<void> submitRepeaterReport(
  Ref ref, {
  required String repeaterId,
  required String description,
}) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.submitRepeaterReport(
    userId: userId,
    repeaterId: repeaterId,
    description: description,
  );
}
