import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/locale_helper.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/common/widgets/units/unit_system_selector.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_apple/sign_in_apple_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_google/sign_in_google_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/controller/profile_controller.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/profile/provider/locale_notifier/locale_notifier.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_status_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UnregisteredProfileScreen extends HookConsumerWidget {
  const UnregisteredProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final isLoading = useState<bool>(false);

    Future<void> handleSignIn(Future<void> Function() signInMethod) async {
      if (isLoading.value) return;
      isLoading.value = true;

      // Capture router BEFORE any async operations that might unmount the widget
      final router = ref.read(appRouterProvider);

      try {
        await signInMethod();

        // Invalidate profile providers
        ref
          ..invalidate(getProfileProvider)
          ..invalidate(checkNeedsPostLoginOnboardingProvider);

        // Register with OneSignal using the new user ID
        final userId = await ref.refresh(getUserIdProvider.future);
        if (userId != null) {
          await OneSignal.login(userId);
        }

        // Check onboarding with fresh user ID and profile
        final needsOnboarding =
            await ref.read(checkNeedsPostLoginOnboardingProvider.future);

        if (needsOnboarding) {
          await router.pushAndPopUntil(
            const PostLoginOnboardingRoute(),
            predicate: (_) => false,
          );
        } else {
          // No onboarding needed - invalidate all providers to refresh UI
          ref
            ..invalidate(getUserIdProvider)
            ..invalidate(isAnonymousProvider)
            ..invalidate(profileControllerProvider);
        }
      } catch (e) {
        log('Sign in error: $e');
        if (context.mounted) {
          showErrorSnackbar(context, '!!${l10n.authUnexpectedError} $e');
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Gap(32),
                    // Avatar section
                    _buildAvatarSection(context, isDark),
                    const Gap(24),
                    // Welcome text
                    Text(
                      l10n.profileWelcomeTitle,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    Text(
                      l10n.profileWelcomeDescription,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    const Gap(32),
                    // Sign in buttons
                    Column(
                      children: [
                        if (Platform.isIOS) ...[
                          AppleSignInButton(
                            onPressed: () => handleSignIn(
                              () => ref.read(signInWithAppleProvider.future),
                            ),
                            isLoading: isLoading.value,
                          ),
                          const Gap(12),
                        ],
                        GoogleSignInButton(
                          onPressed: () => handleSignIn(
                            () => ref.read(signInWithGoogleProvider.future),
                          ),
                          isLoading: isLoading.value,
                        ),
                      ],
                    ),
                    const Gap(32),
                    // HamQRG Pro — l'upsell deve esistere anche senza account:
                    // l'acquisto non richiede la registrazione (come negli
                    // altri placement) e questa era l'unica pagina del profilo
                    // in cui non c'era alcun accesso alla paywall.
                    _buildSectionHeader(context, l10n.proSectionTitle),
                    const Gap(12),
                    const ProStatusCard(),
                    const Gap(24),
                    // Community section
                    _buildSectionHeader(context, l10n.profileSectionCommunity),
                    const Gap(12),
                    _buildTelegramButton(context, isDark),
                    const Gap(12),
                    _buildAddRepeaterButton(context, ref, isDark),
                    const Gap(24),
                    // Support section
                    _buildSectionHeader(context, l10n.profileSectionSupport),
                    const Gap(12),
                    _buildContactUsButton(context, isDark),
                    const Gap(24),
                    // Language section
                    _buildSectionHeader(context, l10n.profileLanguage),
                    const Gap(12),
                    _buildLanguageButton(context, ref, isDark),
                    const Gap(24),
                    // Unit system section
                    _buildSectionHeader(context, l10n.profileUnitSystem),
                    const Gap(12),
                    const UnitSystemSelector(),
                    const Gap(32),
                    // Version
                    ref.watch(packageInfoProvider).when(
                          data: (packageInfo) => Text(
                            l10n.profileVersionFormat(
                              packageInfo.version,
                              packageInfo.buildNumber,
                            ),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.4),
                            ),
                          ),
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                    const Gap(32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow effect
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary.withValues(alpha: 0.1),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: 32,
                spreadRadius: 8,
              ),
            ],
          ),
        ),
        // Avatar container
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? colorScheme.surfaceContainerHighest
                : colorScheme.surfaceContainerHighest,
            border: Border.all(
              color: isDark
                  ? colorScheme.outline.withValues(alpha: 0.2)
                  : colorScheme.outline.withValues(alpha: 0.1),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.account_circle,
            size: 64,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildTelegramButton(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? colorScheme.outline.withValues(alpha: 0.1)
              : colorScheme.outline.withValues(alpha: 0.05),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            try {
              final telegramUrl = AppConfigs.getTelegramLink();
              final uri = Uri.parse(telegramUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  showErrorSnackbar(context, l10n.errorOpenTelegram);
                }
              }
            } catch (e) {
              if (context.mounted) {
                showErrorSnackbar(context, l10n.errorOpenTelegram);
              }
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0088CC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Text(
                    l10n.profileJoinTelegramCommunity,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddRepeaterButton(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? colorScheme.outline.withValues(alpha: 0.1)
              : colorScheme.outline.withValues(alpha: 0.05),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.router.push(const AddRepeaterRoute()),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
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
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.addRepeaterProfileTile,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        l10n.addRepeaterProfileTileSubtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context,
    WidgetRef ref,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final currentLocale = ref.watch(localeProvider).value;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? colorScheme.outline.withValues(alpha: 0.1)
              : colorScheme.outline.withValues(alpha: 0.05),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showLanguagePicker(context, ref),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Builder(
                  builder: (context) {
                    final flag = getLocaleFlag(currentLocale);
                    if (flag.isNotEmpty) {
                      return Text(
                        flag,
                        style: const TextStyle(fontSize: 28),
                      );
                    }
                    return Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                        size: 20,
                      ),
                    );
                  },
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.profileLanguage,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        getLocaleDisplayName(currentLocale, l10n),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactUsButton(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? colorScheme.surface : colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? colorScheme.outline.withValues(alpha: 0.1)
              : colorScheme.outline.withValues(alpha: 0.05),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
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
                showErrorSnackbar(context, l10n.profileErrorOpeningEmail);
              }
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.mail,
                    color: isDark ? Colors.white : Colors.black87,
                    size: 20,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Text(
                    l10n.contact_us,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
