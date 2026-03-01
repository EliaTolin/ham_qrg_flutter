import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_apple_provider.g.dart';

@riverpod
Future<bool> signInWithApple(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  final result = await repository.signWithApple();
  final userId = await ref.refresh(getUserIdProvider.future);
  if (userId != null) {
    await OneSignal.login(userId);
  }
  return result;
}
