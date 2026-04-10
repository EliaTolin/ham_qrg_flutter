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
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/widgets/user_type_selection_step.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Total number of onboarding steps.
const _totalSteps = 5;

@RoutePage()
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            _StepProgress(currentStep: controllerState.currentStep),
            // Content
            Expanded(
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
          ],
        ),
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
      case 4:
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
      if (context.mounted) {
        await context.router
            .push(RepeaterDetailRoute(repeaterId: repeaterId));
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

// ---------------------------------------------------------------------------
// Step Progress Indicator
// ---------------------------------------------------------------------------

class _StepProgress extends StatelessWidget {
  const _StepProgress({required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        children: List.generate(_totalSteps, (index) {
          final isCompleted = index < currentStep;
          final isCurrent = index == currentStep;

          return Expanded(
            child: Container(
              height: 3,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: isCompleted || isCurrent
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
