import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ham_qrg/clients/package_info/package_info.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/widgets/profile/profile_avatar.dart';
import 'package:ham_qrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:ham_qrg/config/app_configs.dart';
import 'package:ham_qrg/router/app_router.dart';
import 'package:ham_qrg/src/features/profile/presentation/profile/controller/profile_controller.dart';
import 'package:ham_qrg/src/features/profile/presentation/profile/unregistered_profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    return Scaffold(
      body: ref.watch(profileControllerProvider).when(
            data: (state) {
              // Show unregistered profile screen if user is anonymous
              if (state.isAnonymous) {
                return const UnregisteredProfileScreen();
              }

              // Show registered profile screen
              final profile = state.profile;
              return Scaffold(
                appBar: AppBar(title: Text(l10n.profile)),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ProfileAvatar(
                        imageProfileUrl: state.imageProfileUrl,
                        size: 200,
                      ),
                      const Gap(20),
                      Text(
                        '${profile.name} ${profile.surname}',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(10),
                      if (state.email != null) ...[
                        Text(
                          state.email!,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                      ],
                      // Impostazioni
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.settings,
                            color: Colors.blueAccent,
                          ),
                          title: Text(
                            l10n.settings,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            context.router.push(const UserSettingsRoute());
                          },
                        ),
                      ),
                      const Gap(10),
                      // Logout
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.logout, color: Colors.redAccent),
                          title: Text(
                            l10n.logout,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                            await ref.read(profileControllerProvider.notifier).logout();
                            if (context.mounted) {
                              await context.router.pushAndPopUntil(
                                const AuthRoute(),
                                predicate: (_) => false,
                              );
                            }
                          },
                        ),
                      ),
                      const Gap(10),
                      // Contattaci
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.email, color: Colors.greenAccent),
                          title: Text(
                            l10n.contact_us,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                            final emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'info@auroradigital.it',
                              queryParameters: {
                                'subject': 'HamQRG-Support',
                              },
                            );
                            if (await canLaunchUrl(emailLaunchUri)) {
                              await launchUrl(emailLaunchUri);
                            } else {
                              if (context.mounted) {
                                showErrorSnackbar(
                                  context,
                                  l10n.profileErrorOpeningEmail,
                                );
                              }
                            }
                          },
                        ),
                      ),

                      // Telegram
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.telegram,
                            color: Colors.blueAccent,
                          ),
                          title: Text(
                            l10n.profileJoinTelegramCommunity,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () async {
                            try {
                              final telegramUrl = AppConfigs.getTelegramLink();
                              final uri = Uri.parse(telegramUrl);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                if (context.mounted) {
                                  showErrorSnackbar(
                                    context,
                                    l10n.errorOpenTelegram,
                                  );
                                }
                              }
                            } catch (e) {
                              if (context.mounted) {
                                showErrorSnackbar(
                                  context,
                                  l10n.errorOpenTelegram,
                                );
                              }
                            }
                          },
                        ),
                      ),

                      const Gap(30),

                      // Versione dell'app
                      HookConsumer(
                        builder: (context, ref, _) {
                          return ref.watch(packageInfoProvider).when(
                                data: (packageInfo) => Text(
                                  l10n.profileVersion(
                                    packageInfo.version,
                                    packageInfo.buildNumber,
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                                ),
                                loading: () => const SizedBox.shrink(),
                                error: (error, _) => Text(
                                  l10n.profileError(error.toString()),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
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
}
