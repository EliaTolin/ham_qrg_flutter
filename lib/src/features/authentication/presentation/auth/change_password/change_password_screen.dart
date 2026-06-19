import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/button/save_button.dart';
import 'package:hamqrg/common/widgets/card/error_card.dart';
import 'package:hamqrg/common/widgets/form/password_field.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/change_password/controller/change_password_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ChangePasswordScreen extends HookConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.changePasswordTitle),
      ),
      body: ref.watch(changePasswordControllerProvider).when(
            data: (state) => buildBody(
              context,
              ref,
              formKey,
              newPasswordController,
              confirmPasswordController,
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) {
              return ErrorCard(errorMessage: error.toString());
            },
          ),
    );
  }

  Padding buildBody(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController newPasswordController,
    TextEditingController confirmPasswordController,
  ) {
    final l10n = context.localization;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo nuova password
            PasswordField(
              controller: newPasswordController,
              label: l10n.fieldNewPassword,
            ),
            const SizedBox(height: 16),
            // Campo conferma nuova password
            PasswordField(
              controller: confirmPasswordController,
              label: l10n.fieldConfirmNewPassword,
            ),
            const SizedBox(height: 24),
            // Bottone di salvataggio
            Center(
              child: SaveButton(
                onSave: () async {
                  if (!formKey.currentState!.validate()) return;
                  if (newPasswordController.text !=
                      confirmPasswordController.text) {
                    showErrorSnackbar(
                      context,
                      l10n.validationPasswordsNoMatch,
                    );
                    return;
                  }
                  try {
                    await ref
                        .read(changePasswordControllerProvider.notifier)
                        .resetPassword(newPasswordController.text);
                    if (context.mounted) {
                      showSuccessSnackbar(
                        context,
                        l10n.passwordChangedSuccess,
                      );
                      await context.replaceRoute(const HomeRoute());
                    }
                  } catch (e) {
                    if (context.mounted) {
                      showErrorSnackbar(
                        context,
                        l10n.errorWithMessage(e.toString()),
                      );
                    }
                  }
                },
                text: l10n.changePasswordTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
