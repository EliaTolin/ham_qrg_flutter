import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ham_qrg/common/extension/hard_coded_string.dart';
import 'package:ham_qrg/common/widgets/button/save_button.dart';
import 'package:ham_qrg/common/widgets/profile/profile_avatar.dart';
import 'package:ham_qrg/router/app_router.dart';
import 'package:ham_qrg/src/features/profile/presentation/user_settings/controller/user_settings_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class UserSettingsScreen extends HookConsumerWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final picker = ImagePicker();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Impostazioni'.hardcoded)),
      body: ref.watch(userSettingsControllerProvider).when(
            data: (state) {
              final profile = state.profile;
              nameController.text = profile.name;
              surnameController.text = profile.surname;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Immagine del profilo
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ProfileAvatar(
                          imageProfileUrl: state.imageProfileUrl,
                          size: 200,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ref
                                    .read(
                                      userSettingsControllerProvider.notifier,
                                    )
                                    .deleteImageProfile();
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                              onPressed: () async {
                                final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedFile != null) {
                                  await ref
                                      .read(
                                        userSettingsControllerProvider.notifier,
                                      )
                                      .updateImageProfile(
                                        File(pickedFile.path),
                                      );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),

                    // Form per nome e cognome
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Campo Nome
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Nome'.hardcoded,
                                  hintText: 'Inserisci il tuo nome'.hardcoded,
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Il nome è obbligatorio'.hardcoded;
                                  }
                                  return null;
                                },
                              ),
                              const Gap(20),

                              // Campo Cognome
                              TextFormField(
                                controller: surnameController,
                                decoration: InputDecoration(
                                  labelText: 'Cognome'.hardcoded,
                                  hintText: 'Inserisci il tuo cognome'.hardcoded,
                                  prefixIcon: const Icon(Icons.person_outline),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Il cognome è obbligatorio'.hardcoded;
                                  }
                                  return null;
                                },
                              ),
                              const Gap(30),

                              // Pulsante Salva
                              Center(
                                child: SaveButton(
                                  onSave: () {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }
                                    final updatedProfile = profile.copyWith(
                                      name: nameController.text,
                                      surname: surnameController.text,
                                    );
                                    ref
                                        .read(
                                          userSettingsControllerProvider.notifier,
                                        )
                                        .updateProfile(updatedProfile);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Gap(10),
                    // // Cambio Password
                    // Card(
                    //   elevation: 2,
                    //   child: ListTile(
                    //     leading: const Icon(Icons.lock_outline),
                    //     title: Text('Cambia Password'.hardcoded),
                    //     onTap: () {
                    //       context.router.push(const ChangePasswordRoute());
                    //     },
                    //   ),
                    // ),
                    // Pulsante Elimina Account
                    Card(
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.delete_forever),
                        title: Text('Elimina Account'.hardcoded),
                        onTap: () async {
                          final shouldDelete = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Elimina Account'.hardcoded),
                              content: Text(
                                'Sei sicuro di voler eliminare il tuo account?'.hardcoded,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('Annulla'.hardcoded),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context).colorScheme.error,
                                  ),
                                  child: Text('Elimina'.hardcoded),
                                ),
                              ],
                            ),
                          );

                          if (shouldDelete ?? false) {
                            await ref.read(userSettingsControllerProvider.notifier).deleteAccount();
                            if (context.mounted) {
                              await context.router.replace(const AuthRoute());
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Errore: $error'.hardcoded)),
          ),
    );
  }
}
