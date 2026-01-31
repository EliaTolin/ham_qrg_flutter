import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/logo_icon.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/splashscreen/provider/set_onboarding_seen/set_onboarding_seen_provider.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        FocusManager.instance.primaryFocus?.unfocus();
      });
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              spacing: 8,
              children: [
                // Logo e Titolo - migliorato
                const LogoIcon(size: 100),
                const Gap(16),
                Text(
                  'HamQRG'.hardcoded,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                ),
                const Gap(8),
                Text(
                  '73!'.hardcoded,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                        fontSize: 18,
                      ),
                ),
                const Gap(32),
                // Sezione Social Login
                SignInButtons(
                  onSignInComplete: () async {
                    log('AuthScreen: onSignInComplete called');

                    // Invalidate auth providers first
                    ref
                      ..invalidate(getUserIdProvider)
                      ..invalidate(isAnonymousProvider)
                      ..invalidate(getProfileProvider)
                      ..invalidate(checkNeedsPostLoginOnboardingProvider);

                    await ref.read(setOnboardingSeenProvider.future);

                    log('AuthScreen: checking needsOnboarding...');
                    try {
                      final needsOnboarding =
                          await ref.read(checkNeedsPostLoginOnboardingProvider.future);
                      log('AuthScreen: needsOnboarding=$needsOnboarding');

                      if (context.mounted) {
                        if (needsOnboarding) {
                          log('AuthScreen: navigating to PostLoginOnboardingRoute');
                          await context.router.pushAndPopUntil(
                            const PostLoginOnboardingRoute(),
                            predicate: (_) => false,
                          );
                        } else {
                          log('AuthScreen: navigating to HomeRoute');
                          await context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                        }
                      }
                    } catch (e) {
                      // Transient error fetching profile — user is
                      // authenticated, don't block them with onboarding.
                      log('AuthScreen: error checking onboarding: $e');
                      if (context.mounted) {
                        await context.router.pushAndPopUntil(
                          const HomeRoute(),
                          predicate: (_) => false,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
