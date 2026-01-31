import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/presentation/user_settings/controller/user_settings_controller.dart';
import 'package:hamqrg/src/features/profile/provider/theme_mode_notifier/theme_mode_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class UserSettingsScreen extends HookConsumerWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final picker = ImagePicker();

    final hasChanges = useState(false);
    final initialName = useRef<String?>(null);
    final initialSurname = useRef<String?>(null);

    void checkForChanges() {
      hasChanges.value = nameController.text != initialName.value ||
          surnameController.text != initialSurname.value;
    }

    useEffect(
      () {
        nameController.addListener(checkForChanges);
        surnameController.addListener(checkForChanges);
        return () {
          nameController.removeListener(checkForChanges);
          surnameController.removeListener(checkForChanges);
        };
      },
      [nameController, surnameController],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileEditProfile),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      body: ref.watch(userSettingsControllerProvider).when(
            data: (state) {
              final profile = state.profile;

              // Initialize controllers only once
              if (initialName.value == null) {
                initialName.value = profile.name;
                initialSurname.value = profile.surname;
                nameController.text = profile.name;
                surnameController.text = profile.surname;
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Avatar section
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ProfileAvatar(
                                imageProfileUrl: state.imageProfileUrl,
                                size: 140,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () async {
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
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: colorScheme.primary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colorScheme.surface,
                                        width: 3,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: colorScheme.onPrimary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(8),
                          GestureDetector(
                            onTap: () async {
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
                            child: Text(
                              l10n.profileChangePhoto,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(32),

                    // First Name field
                    _buildFieldLabel(l10n.profileFirstName, theme, colorScheme),
                    const Gap(8),
                    _buildTextField(
                      controller: nameController,
                      icon: Icons.person,
                      colorScheme: colorScheme,
                    ),
                    const Gap(20),

                    // Last Name field
                    _buildFieldLabel(l10n.profileLastName, theme, colorScheme),
                    const Gap(8),
                    _buildTextField(
                      controller: surnameController,
                      icon: Icons.person,
                      colorScheme: colorScheme,
                    ),
                    const Gap(20),

                    // Callsign field (read-only)
                    _buildFieldLabel(
                      '${l10n.profileCallsign} (Nominativo)',
                      theme,
                      colorScheme,
                    ),
                    const Gap(8),
                    _buildReadOnlyField(
                      value: profile.callsign ?? '-',
                      icon: Icons.lock,
                      colorScheme: colorScheme,
                      theme: theme,
                    ),
                    const Gap(24),

                    // Restart identification card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: .3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.outlineVariant.withValues(
                            alpha: .5,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.profileRestartIdentificationTitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: .8),
                            ),
                          ),
                          const Gap(16),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                context.router.push(const PostLoginOnboardingRoute());
                              },
                              icon: const Icon(Icons.refresh),
                              label: Text(l10n.profileRestartIdentificationButton),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),

                    // Theme mode selector
                    _buildFieldLabel(
                      l10n.profileThemeMode,
                      theme,
                      colorScheme,
                    ),
                    const Gap(8),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<ThemeMode>(
                        segments: [
                          ButtonSegment(
                            value: ThemeMode.system,
                            label: Text(l10n.profileThemeModeSystem),
                            icon: const Icon(Icons.brightness_auto),
                          ),
                          ButtonSegment(
                            value: ThemeMode.light,
                            label: Text(l10n.profileThemeModeLight),
                            icon: const Icon(Icons.light_mode),
                          ),
                          ButtonSegment(
                            value: ThemeMode.dark,
                            label: Text(l10n.profileThemeModeDark),
                            icon: const Icon(Icons.dark_mode),
                          ),
                        ],
                        selected: {
                          ref.watch(themeModeProvider).value ??
                              ThemeMode.system,
                        },
                        onSelectionChanged: (selected) {
                          ref
                              .read(themeModeProvider.notifier)
                              .setThemeMode(selected.first);
                        },
                      ),
                    ),
                    const Gap(24),

                    // Save Changes button
                    FilledButton.icon(
                      onPressed: hasChanges.value
                          ? () {
                              final updatedProfile = profile.copyWith(
                                name: nameController.text,
                                surname: surnameController.text,
                              );
                              ref
                                  .read(
                                    userSettingsControllerProvider.notifier,
                                  )
                                  .updateProfile(updatedProfile);
                              // Reset initial values after save
                              initialName.value = nameController.text;
                              initialSurname.value = surnameController.text;
                              hasChanges.value = false;
                            }
                          : null,
                      icon: const Icon(Icons.save),
                      label: Text(l10n.profileSaveChanges),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const Gap(32),

                    // Danger Zone
                    Divider(
                      color: colorScheme.outlineVariant.withValues(alpha: .3),
                    ),
                    const Gap(16),
                    Text(
                      l10n.profileDangerZone.toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Gap(12),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final shouldDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(l10n.profileDeleteAccountConfirmTitle),
                            content: Text(l10n.profileDeleteAccountConfirmMessage),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text(l10n.profileDeleteAccountCancel),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                style: TextButton.styleFrom(
                                  foregroundColor: colorScheme.error,
                                ),
                                child: Text(l10n.profileDeleteAccountConfirm),
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
                      icon: Icon(Icons.warning_amber, color: colorScheme.error),
                      label: Text(
                        l10n.profileDeleteAccount,
                        style: TextStyle(color: colorScheme.error),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                          color: colorScheme.error.withValues(alpha: .5),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const Gap(32),

                    // App version
                    Center(
                      child: ref.watch(packageInfoProvider).when(
                            data: (packageInfo) => Text(
                              l10n.profileAppVersion(
                                packageInfo.version,
                                packageInfo.buildNumber,
                              ),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(alpha: .5),
                              ),
                            ),
                            loading: () => const SizedBox.shrink(),
                            error: (_, __) => const SizedBox.shrink(),
                          ),
                    ),
                    const Gap(20),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(
              child: Text(l10n.profileError(error.toString())),
            ),
          ),
    );
  }

  Widget _buildFieldLabel(
    String label,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Text(
      label.toUpperCase(),
      style: theme.textTheme.labelSmall?.copyWith(
        color: colorScheme.onSurface.withValues(alpha: .6),
        fontWeight: FontWeight.w600,
        letterSpacing: 1.1,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required ColorScheme colorScheme,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: colorScheme.onSurface.withValues(alpha: .5)),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: .3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({
    required String value,
    required IconData icon,
    required ColorScheme colorScheme,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorScheme.onSurface.withValues(alpha: .4),
            size: 22,
          ),
          const Gap(12),
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: .5),
            ),
          ),
        ],
      ),
    );
  }
}
