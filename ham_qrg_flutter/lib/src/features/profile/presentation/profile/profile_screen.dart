import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/controller/profile_controller.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/unregistered_profile_screen.dart';
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
              final hasCallsign = profile.callsign != null && profile.callsign!.isNotEmpty;
              final fullName = '${profile.name} ${profile.surname}'.trim();
              final theme = Theme.of(context);
              final colorScheme = theme.colorScheme;

              return SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Avatar
                        ProfileAvatar(
                          imageProfileUrl: state.imageProfileUrl,
                          size: 160,
                        ),
                        const Gap(20),
                        // Callsign or Name (primary)
                        Text(
                          hasCallsign ? profile.callsign! : fullName,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // Name (secondary) - only if callsign is shown
                        if (hasCallsign && fullName.isNotEmpty) ...[
                          const Gap(4),
                          Text(
                            fullName,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: .7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const Gap(16),
                        // Edit Profile button
                        OutlinedButton.icon(
                          onPressed: () {
                            context.router.push(const UserSettingsRoute());
                          },
                          icon: const Icon(Icons.tune),
                          label: Text(l10n.profileEditProfile),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        const Gap(16),
                        // Section header
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.profileSectionCommunity.toUpperCase(),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const Gap(12),
                        // Community & Support card
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // Telegram
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.telegram,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.profileJoinTelegramCommunity),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
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
                              Divider(
                                height: 1,
                                indent: 16,
                                endIndent: 16,
                                color: colorScheme.outlineVariant.withValues(
                                  alpha: .3,
                                ),
                              ),
                              // Contact Us
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.contact_us),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
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
                              Divider(
                                height: 1,
                                indent: 16,
                                endIndent: 16,
                                color: colorScheme.outlineVariant.withValues(
                                  alpha: .3,
                                ),
                              ),
                              // Log Out
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withValues(alpha: .1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.red[400],
                                    size: 20,
                                  ),
                                ),
                                title: Text(
                                  l10n.logout,
                                  style: TextStyle(color: Colors.red[400]),
                                ),
                                onTap: () async {
                                  await ref.read(profileControllerProvider.notifier).logout();
                                  if (context.mounted) {
                                    await context.router.pushAndPopUntil(
                                      const HomeRoute(),
                                      predicate: (_) => false,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        const Gap(32),
                        // App version
                        HookConsumer(
                          builder: (context, ref, _) {
                            return ref.watch(packageInfoProvider).when(
                                  data: (packageInfo) => Text(
                                    l10n.profileVersionFormat(
                                      packageInfo.version,
                                      packageInfo.buildNumber,
                                    ),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withValues(
                                        alpha: .5,
                                      ),
                                    ),
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
