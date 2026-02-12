import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_account_provider.g.dart';

@riverpod
Future<void> deleteAccount(Ref ref) async {
  final authRepository = await ref.read(authRepositoryProvider.future);
  await authRepository.deleteAccount();
  ref.invalidate(authRepositoryProvider);
}
