import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_repeaters_provider.g.dart';

@riverpod
Future<List<Repeater>> getFavoriteRepeaters(Ref ref) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    return [];
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getFavoriteRepeaters(userId);
}
