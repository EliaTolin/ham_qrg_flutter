import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/controller/onboarding_controller.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/controller/state/onboarding_state.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/widgets/discovery_step.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/widgets/location_step.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/widgets/telegram_step.dart';
import 'package:hamqrg/src/features/onboarding/presentation/onboarding_page/widgets/welcome_step.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/callsign_entry_step.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/swl_callsign_step.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/user_type_selection_step.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final welcomePageController = usePageController();
    final controllerState = ref.watch(onboardingControllerProvider);
    final controller = ref.read(onboardingControllerProvider.notifier);

    // Track welcome card index changes
    useEffect(
      () {
        void listener() {
          final page = welcomePageController.page?.round() ?? 0;
          controller.setWelcomeCardIndex(page);
        }

        welcomePageController.addListener(listener);
        return () => welcomePageController.removeListener(listener);
      },
      [welcomePageController],
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient (same as post_login_onboarding)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary.withValues(alpha: .12),
                  colorScheme.secondary.withValues(alpha: .08),
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
                      color: colorScheme.surface.withValues(alpha: .75),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: .12),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _buildStep(
                        context,
                        ref,
                        controllerState,
                        controller,
                        welcomePageController,
                      ),
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

  Widget _buildStep(
    BuildContext context,
    WidgetRef ref,
    OnboardingState state,
    OnboardingController controller,
    PageController welcomePageController,
  ) {
    switch (state.currentStep) {
      case 0:
        return WelcomeStep(
          key: const ValueKey('welcome'),
          pageController: welcomePageController,
          currentIndex: state.welcomeCardIndex,
          onFinish: controller.finishWelcome,
          onSkip: () => _completeAndNavigate(context, controller),
        );
      case 1:
        return LocationStep(
          key: const ValueKey('location'),
          onEnable: controller.requestLocation,
          onSkip: controller.skipLocation,
        );
      case 2:
        return UserTypeSelectionStep(
          key: const ValueKey('userType'),
          isSubmitting: state.isSubmitting,
          onLicensedSelected: () {
            controller.selectUserType(UserType.licensed);
          },
          onListenerSelected: () {
            controller.selectUserType(UserType.swl);
          },
        );
      case 3:
        if (state.selectedUserType == UserType.swl) {
          return SwlCallsignStep(
            key: const ValueKey('swlCallsign'),
            hasCallsign: state.hasSwlCallsign,
            callsign: state.callsign,
            isSubmitting: state.isSubmitting,
            onHasCallsignChanged: (hasCallsign) {
              controller.setHasSwlCallsign(hasCallsign: hasCallsign);
            },
            onCallsignChanged: controller.updateCallsign,
            onSubmit: () async {
              await controller.submitProfile();
            },
            onBack: controller.goBackFromCallsign,
          );
        }
        return CallsignEntryStep(
          key: const ValueKey('callsign'),
          callsign: state.callsign,
          isSubmitting: state.isSubmitting,
          onCallsignChanged: controller.updateCallsign,
          onSubmit: () async {
            await controller.submitProfile();
          },
          onBack: controller.goBackFromCallsign,
        );
      case 4:
        return DiscoveryStep(
          key: const ValueKey('discovery'),
          isLoading: state.isLoadingDiscovery,
          nearestRepeater: state.nearestRepeater,
          hasLocation: state.locationGranted,
          onViewRepeater: () {
            final repeater = state.nearestRepeater;
            if (repeater != null) {
              _completeAndNavigateToRepeater(
                context,
                controller,
                repeater.id,
              );
            }
          },
          onExploreMap: () => _completeAndNavigateToMap(context, controller),
          onContinue: controller.finishDiscovery,
        );
      case 5:
        return TelegramStep(
          key: const ValueKey('telegram'),
          onJoin: () async {
            await controller.joinTelegram();
            if (context.mounted) {
              await _completeAndNavigate(context, controller);
            }
          },
          onLater: () async {
            await controller.declineTelegram();
            if (context.mounted) {
              await _completeAndNavigate(context, controller);
            }
          },
          onAlreadyMember: () async {
            await controller.alreadyTelegramMember();
            if (context.mounted) {
              await _completeAndNavigate(context, controller);
            }
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Future<void> _completeAndNavigate(
    BuildContext context,
    OnboardingController controller,
  ) async {
    await controller.completeOnboarding();
    if (context.mounted) {
      await context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );
    }
  }

  Future<void> _completeAndNavigateToRepeater(
    BuildContext context,
    OnboardingController controller,
    String repeaterId,
  ) async {
    await controller.completeOnboarding();
    if (context.mounted) {
      await context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );
      // Navigate to repeater detail after home is loaded
      if (context.mounted) {
        await context.router.push(RepeaterDetailRoute(repeaterId: repeaterId));
      }
    }
  }

  Future<void> _completeAndNavigateToMap(
    BuildContext context,
    OnboardingController controller,
  ) async {
    await controller.completeOnboarding();
    if (context.mounted) {
      await context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );
    }
  }
}
