import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/feedback_type.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/feedback/station_kind.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_repeater_feedback_provider.g.dart';

@riverpod
Future<void> addRepeaterFeedback(
  Ref ref, {
  required String repeaterId,
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
    type: type,
    station: station,
    latitude: latitude,
    longitude: longitude,
    comment: comment,
  );
}
