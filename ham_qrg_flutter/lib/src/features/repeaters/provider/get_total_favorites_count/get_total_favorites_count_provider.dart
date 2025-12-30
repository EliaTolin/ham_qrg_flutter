import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_total_favorites_count_provider.g.dart';

@riverpod
Future<int?> getTotalFavoritesCount(Ref ref) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    return null;
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getTotalFavoritesCount(userId);
}
