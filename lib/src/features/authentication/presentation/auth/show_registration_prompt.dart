import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_apple/sign_in_apple_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_google/sign_in_google_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Shows the registration prompt modal when an anonymous user tries to access
/// a feature that requires authentication.
///
/// Returns `true` if the user successfully signed in, `false` if they dismissed
/// the prompt without signing in.
Future<bool> showRegistrationPrompt(BuildContext context) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const _RegistrationPromptSheet(),
  );
  return result ?? false;
}

/// Helper function to check if user is anonymous and show registration prompt.
/// Returns `true` if user is authenticated (either already was or just signed in).
/// Returns `false` if user is still anonymous (dismissed the prompt).
Future<bool> requireAuthentication(
  BuildContext context,
  WidgetRef ref,
) async {
  final isAnonymous = await ref.watch(isAnonymousProvider.future);

  if (!isAnonymous) {
    return true; // User is already authenticated
  }

  if (!context.mounted) return false;

  // Show registration prompt
  final didSignIn = await showRegistrationPrompt(context);
  return didSignIn;
}

class _RegistrationPromptSheet extends ConsumerStatefulWidget {
  const _RegistrationPromptSheet();

  @override
  ConsumerState<_RegistrationPromptSheet> createState() => _RegistrationPromptSheetState();
}

class _RegistrationPromptSheetState extends ConsumerState<_RegistrationPromptSheet> {
  bool _isLoading = false;

  Future<void> _handleAppleSignIn() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    // Capture router BEFORE any async operations
    final router = ref.read(appRouterProvider);

    try {
      await ref.read(signInWithAppleProvider.future);

      // First, invalidate ONLY profile providers (not isAnonymous)
      ref
        ..invalidate(getProfileProvider)
        ..invalidate(checkNeedsPostLoginOnboardingProvider);

      // Close the bottom sheet
      if (mounted) {
        Navigator.of(context).pop(true);
      }

      // Check onboarding and navigate
      final needsOnboarding = await ref.read(checkNeedsPostLoginOnboardingProvider.future);
      log('Registration prompt Apple: needsOnboarding=$needsOnboarding');

      if (needsOnboarding) {
        await router.pushAndPopUntil(
          const PostLoginOnboardingRoute(),
          predicate: (_) => false,
        );
      } else {
        await router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (_) => false,
        );
      }
    } on Exception catch (e) {
      log('Apple sign in error: $e');
      if (mounted) {
        showErrorSnackbar(context, context.localization.authUnexpectedError);
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    // Capture router BEFORE any async operations
    final router = ref.read(appRouterProvider);

    try {
      await ref.read(signInWithGoogleProvider.future);

      // First, invalidate ONLY profile providers (not isAnonymous)
      ref
        ..invalidate(getProfileProvider)
        ..invalidate(checkNeedsPostLoginOnboardingProvider);

      // Close the bottom sheet
      if (mounted) {
        Navigator.of(context).pop(true);
      }

      // Check onboarding and navigate
      final needsOnboarding = await ref.read(checkNeedsPostLoginOnboardingProvider.future);
      log('Registration prompt Google: needsOnboarding=$needsOnboarding');

      if (needsOnboarding) {
        await router.pushAndPopUntil(
          const PostLoginOnboardingRoute(),
          predicate: (_) => false,
        );
      } else {
        await router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (_) => false,
        );
      }
    } on Exception catch (e) {
      log('Google sign in error: $e');
      if (mounted) {
        showErrorSnackbar(context, context.localization.authUnexpectedError);
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        children: [
          // Background with hero image and gradient
          _buildHeroSection(isDark),

          // Content
          SafeArea(
            child: Stack(
              children: [
                // Scrollable content
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Spacer to push content below hero
                      SizedBox(height: MediaQuery.of(context).size.height * 0.12),

                      // Icon
                      _buildAntennaIcon(isDark),

                      const Gap(16),

                      // Title and description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Text(
                              l10n.registrationPromptTitle,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.white : AppColors.textPrimaryLight,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(8),
                            Text(
                              l10n.registrationPromptDescription,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: isDark
                                        ? AppColors.textSecondaryDark
                                        : AppColors.textSecondaryLight,
                                    height: 1.5,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      // Benefits list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          spacing: 8,
                          children: [
                            _buildBenefitItem(
                              icon: Icons.forum_outlined,
                              title: l10n.registrationBenefitInteractTitle,
                              description: l10n.registrationBenefitInteractDescription,
                              isDark: isDark,
                            ),
                            _buildBenefitItem(
                              icon: Icons.favorite_outline,
                              title: l10n.registrationBenefitFavoritesTitle,
                              description: l10n.registrationBenefitFavoritesDescription,
                              isDark: isDark,
                            ),
                            _buildBenefitItem(
                              icon: Icons.history_edu_outlined,
                              title: l10n.registrationBenefitLogbookTitle,
                              description: l10n.registrationBenefitLogbookDescription,
                              isDark: isDark,
                            ),
                          ],
                        ),
                      ),

                      const Gap(32),

                      // Sign in buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            if (Platform.isIOS) ...[
                              AppleSignInButton(
                                onPressed: _handleAppleSignIn,
                                isLoading: _isLoading,
                              ),
                              const Gap(12),
                            ],
                            GoogleSignInButton(
                              onPressed: _handleGoogleSignIn,
                              isLoading: _isLoading,
                            ),
                          ],
                        ),
                      ),

                      const Gap(16),

                      // Footer text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          l10n.registrationPromptFooter,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: isDark
                                    ? AppColors.textTertiaryDark
                                    : AppColors.textTertiaryLight,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const Gap(24),
                    ],
                  ),
                ),

                // Close button (fixed position, respects SafeArea)
                Positioned(
                  top: 50,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _buildCloseButton(isDark),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loading overlay
          if (_isLoading)
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(bool isDark) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.35,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Hero image placeholder - dark stylized pattern
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          const Color(0xFF1A3A40),
                          const Color(0xFF0D2226),
                        ]
                      : [
                          const Color(0xFF2D5A62),
                          const Color(0xFF1A3A40),
                        ],
                ),
              ),
            ),

            // Gradient overlay
            Builder(
              builder: (context) {
                final bgColor = isDark ? AppColors.backgroundDark : AppColors.backgroundLight;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        bgColor.withValues(alpha: 0.3),
                        bgColor.withValues(alpha: 0.8),
                        bgColor,
                      ],
                      stops: const [0.0, 0.5, 0.75, 1.0],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(bool isDark) {
    return Material(
      color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => Navigator.of(context).pop(false),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            color: isDark ? Colors.white70 : Colors.black54,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildAntennaIcon(bool isDark) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        border: Border.all(
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF2A3E42),
                    const Color(0xFF1A2A2E),
                  ]
                : [
                    const Color(0xFFE8F4F6),
                    const Color(0xFFD0E8EC),
                  ],
          ),
        ),
        child: const Icon(
          Icons.settings_input_antenna,
          color: AppColors.primary,
          size: 48,
        ),
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                    ),
              ),
              const Gap(2),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
