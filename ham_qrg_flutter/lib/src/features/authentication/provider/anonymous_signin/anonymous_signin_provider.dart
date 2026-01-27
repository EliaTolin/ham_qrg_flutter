import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anonymous_signin_provider.g.dart';

@riverpod
Future<String> anonymousSignIn(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  final result = await repository.anonymousSignIn();
  return result;
}
