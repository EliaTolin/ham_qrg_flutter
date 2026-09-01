import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/error/app_error_widget.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/controller/profile_controller.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/unregistered_profile_screen.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_status_card.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
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
              final hasCallsign =
                  profile.callsign != null && profile.callsign!.isNotEmpty;
              final fullName = '${profile.name} ${profile.surname}'.trim();
              final theme = Theme.of(context);
              final colorScheme = theme.colorScheme;
              final isPro = ref.watch(isProProvider).value ?? false;

              return SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Avatar
                        ProfileAvatar(
                          imageProfileUrl: state.imageProfilePath,
                          size: 160,
                          isPro: isPro,
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
                              color:
                                  colorScheme.onSurface.withValues(alpha: .7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        // Email
                        if (state.email != null && state.email!.isNotEmpty) ...[
                          const Gap(4),
                          Text(
                            state.email!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: .5),
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
                        const Gap(24),
                        // HamQRG Pro
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.proSectionTitle.toUpperCase(),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const Gap(12),
                        const ProStatusCard(),
                        const Gap(24),
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
                                    final telegramUrl =
                                        AppConfigs.getTelegramLink();
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
                              // Le mie postazioni
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_outline_rounded,
                                    color: colorScheme.onPrimary,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.stationsTitle),
                                subtitle: Text(
                                  l10n.coverageTeaserBenefitOffline,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
                                onTap: () {
                                  context.router.push(
                                    const SavedStationsRoute(),
                                  );
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
                              // Mappe offline (PRO)
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.download_for_offline_outlined,
                                    color: colorScheme.onTertiary,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.offlineMapsTitle),
                                subtitle: Text(
                                  l10n.offlineMapsEntrySubtitle,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
                                onTap: () async {
                                  final isAllowed = await requirePro(
                                    ref,
                                    PaywallPlacement.offlineMaps,
                                  );
                                  if (!isAllowed) return;
                                  if (context.mounted) {
                                    await context.router.push(
                                      const OfflineMapsRoute(),
                                    );
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
                              // My Reports
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.assignment_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.userReportsProfileTile),
                                subtitle: Text(
                                  l10n.userReportsProfileTileSubtitle,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
                                onTap: () {
                                  context.router.push(const UserReportsRoute());
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
                              // Add Repeater
                              ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.cell_tower,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                title: Text(l10n.addRepeaterProfileTile),
                                subtitle: Text(
                                  l10n.addRepeaterProfileTileSubtitle,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: .5,
                                  ),
                                ),
                                onTap: () {
                                  context.router.push(const AddRepeaterRoute());
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
                                    query: 'subject=HamQRG-Support',
                                  );
                                  try {
                                    await launchUrl(emailLaunchUri);
                                  } catch (_) {
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
                                  await ref
                                      .read(profileControllerProvider.notifier)
                                      .logout();
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
                                  error: (_, __) => const SizedBox.shrink(),
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
            error: (error, stackTrace) => AppErrorWidget(
              label: 'Profile',
              error: error,
              stackTrace: stackTrace,
              onRetry: () => ref.invalidate(profileControllerProvider),
            ),
          ),
    );
  }
}
