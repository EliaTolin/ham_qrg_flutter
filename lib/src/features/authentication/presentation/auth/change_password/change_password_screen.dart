import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
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
        title: Text('Cambia Password'.hardcoded),
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
              label: 'Nuova Password'.hardcoded,
            ),
            const SizedBox(height: 16),
            // Campo conferma nuova password
            PasswordField(
              controller: confirmPasswordController,
              label: 'Conferma Nuova Password'.hardcoded,
            ),
            const SizedBox(height: 24),
            // Bottone di salvataggio
            Center(
              child: SaveButton(
                onSave: () async {
                  if (!formKey.currentState!.validate()) return;
                  if (newPasswordController.text != confirmPasswordController.text) {
                    showErrorSnackbar(
                      context,
                      'Le password non corrispondono'.hardcoded,
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
                        'Password cambiata con successo'.hardcoded,
                      );
                      await context.replaceRoute(const HomeRoute());
                    }
                  } catch (e) {
                    if (context.mounted) {
                      showErrorSnackbar(context, 'Errore: $e'.hardcoded);
                    }
                  }
                },
                text: 'Cambia Password'.hardcoded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
