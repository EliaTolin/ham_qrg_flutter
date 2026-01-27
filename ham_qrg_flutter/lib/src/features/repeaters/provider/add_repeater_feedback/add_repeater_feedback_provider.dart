import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/feedback_type.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/station_kind.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_repeater_feedback_provider.g.dart';

@riverpod
Future<void> addRepeaterFeedback(
  Ref ref, {
  required String repeaterId,
  required String repeaterAccessId,
  required FeedbackType type,
  required StationKind station,
  required double latitude,
  required double longitude,
  required String comment,
}) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.addRepeaterFeedback(
    userId: userId,
    repeaterId: repeaterId,
    repeaterAccessId: repeaterAccessId,
    type: type,
    station: station,
    latitude: latitude,
    longitude: longitude,
    comment: comment,
  );
}
