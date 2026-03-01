import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_google_provider.g.dart';

@riverpod
Future<bool> signInWithGoogle(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  final result = await repository.signinWithGoogle();
  final userId = await ref.refresh(getUserIdProvider.future);
  if (userId != null) {
    await OneSignal.login(userId);
  }
  return result;
}
