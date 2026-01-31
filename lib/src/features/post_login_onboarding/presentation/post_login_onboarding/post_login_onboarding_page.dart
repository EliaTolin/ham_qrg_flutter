import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/controller/post_login_onboarding_controller.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/callsign_entry_step.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/swl_callsign_step.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/user_type_selection_step.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PostLoginOnboardingPage extends HookConsumerWidget {
  const PostLoginOnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    final controllerState = ref.watch(postLoginOnboardingControllerProvider);
    final controller = ref.read(postLoginOnboardingControllerProvider.notifier);

    ref.listen(postLoginOnboardingControllerProvider, (previous, next) {
      if (previous?.currentStep != next.currentStep) {
        pageController.animateToPage(
          next.currentStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.primary.withValues(alpha: .12),
                  color.secondary.withValues(alpha: .08),
                  theme.scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: .75),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: color.primary.withValues(alpha: .12),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Progress indicator
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              2,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: controllerState.currentStep == index ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: controllerState.currentStep == index
                                      ? color.primary
                                      : color.onSurface.withValues(alpha: .20),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // PageView
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              UserTypeSelectionStep(
                                isSubmitting: controllerState.isSubmitting,
                                onLicensedSelected: () {
                                  controller.selectUserType(UserType.licensed);
                                },
                                onListenerSelected: () {
                                  controller.selectUserType(UserType.swl);
                                },
                              ),
                              // Step 1: depends on user type
                              if (controllerState.selectedUserType == UserType.swl)
                                SwlCallsignStep(
                                  hasCallsign: controllerState.hasSwlCallsign,
                                  callsign: controllerState.callsign,
                                  isSubmitting: controllerState.isSubmitting,
                                  onHasCallsignChanged: (hasCallsign) {
                                    controller.setHasSwlCallsign(
                                      hasCallsign: hasCallsign,
                                    );
                                  },
                                  onCallsignChanged: controller.updateCallsign,
                                  onSubmit: () async {
                                    final success = await controller.submitOnboarding();
                                    if (success && context.mounted) {
                                      _navigateToHome(context);
                                    }
                                  },
                                  onBack: controller.goBack,
                                )
                              else
                                CallsignEntryStep(
                                  callsign: controllerState.callsign,
                                  isSubmitting: controllerState.isSubmitting,
                                  onCallsignChanged: controller.updateCallsign,
                                  onSubmit: () async {
                                    final success = await controller.submitOnboarding();
                                    if (success && context.mounted) {
                                      _navigateToHome(context);
                                    }
                                  },
                                  onBack: controller.goBack,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    context.router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (_) => false,
    );
  }
}
