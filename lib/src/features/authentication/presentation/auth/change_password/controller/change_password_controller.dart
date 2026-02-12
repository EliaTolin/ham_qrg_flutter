import 'package:hamqrg/src/features/authentication/provider/change_password/change_password_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  FutureOr<void> build() {}

  Future<void> resetPassword(String password) async {
    try {
      await ref.read(changePasswordProvider(password).future);
    } on Exception catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
