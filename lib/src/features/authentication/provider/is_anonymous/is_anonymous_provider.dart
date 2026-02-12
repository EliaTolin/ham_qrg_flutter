import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_anonymous_provider.g.dart';

@riverpod
Future<bool> isAnonymous(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  return repository.isAnonymous();
}
