import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_repeaters_ids_provider.g.dart';

@riverpod
Future<List<String>> getFavoriteRepeatersIds(Ref ref) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    return [];
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getFavoriteRepeatersIds(userId);
}
