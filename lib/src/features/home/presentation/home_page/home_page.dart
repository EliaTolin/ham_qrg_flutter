import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/dialogs/show_telegram_invite_dialog.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/error/error_with_retry_widget.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/home/presentation/home_page/controller/home_controller.dart';
import 'package:hamqrg/src/features/home/presentation/home_page/controller/state/home_state.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Side-effect hook lives at the top level so the rules of hooks are
    // respected regardless of the AsyncValue state below.
    final hasHandledTelegramPrompt = useRef(false);

    // React to controller state changes from a single place.
    ref.listen<AsyncValue<HomeState>>(
      homeControllerProvider,
      (previous, next) {
        next.when(
          data: (state) {
            if (hasHandledTelegramPrompt.value) return;
            if (!state.showTelegramRePrompt) return;
            hasHandledTelegramPrompt.value = true;

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await Future<void>.delayed(const Duration(seconds: 2));
              if (!context.mounted) return;
              final notifier = ref.read(homeControllerProvider.notifier);
              await showTelegramInviteDialog(
                context,
                onAlreadyTelegramMember: () async {
                  await notifier.setTelegramGroupMember();
                },
              );
              if (!context.mounted) return;
              await notifier.setTelegramInviteLastShownDate();
            });
          },
          loading: () {},
          error: (error, stackTrace) {
            // Errors must NEVER be silent — always report to Sentry.
            unawaited(
              Sentry.captureException(error, stackTrace: stackTrace),
            );
          },
        );
      },
    );

    final controller = ref.watch(homeControllerProvider);

    return controller.when(
      data: (state) => _HomeScaffold(),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: ErrorWidgetWithRetry(
          onRetry: () => ref.invalidate(homeControllerProvider),
        ),
      ),
    );
  }
}

class _HomeScaffold extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        DashboardRoute(),
        RepeatersListRoute(),
        RepeatersMapRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        final isAnonymous = ref.watch(isAnonymousProvider).value ?? true;
        final profile =
            isAnonymous ? null : ref.watch(getProfileProvider).value;

        final String profileLabel;
        final Widget profileIcon;

        if (isAnonymous) {
          profileLabel = context.localization.authSignIn;
          profileIcon = const Icon(Icons.person);
        } else {
          profileLabel = profile?.callsign ?? profile?.name ?? '';
          profileIcon = ProfileAvatar(
            imageProfilePath: profile?.propic,
            size: 24,
          );
        }

        final l10n = context.localization;
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home),
              label: l10n.homeNavHome,
            ),
            NavigationDestination(
              icon: const Icon(Icons.list),
              label: l10n.homeNavList,
            ),
            NavigationDestination(
              icon: const Icon(Icons.map),
              label: l10n.homeNavMap,
            ),
            NavigationDestination(
              icon: profileIcon,
              label: profileLabel,
            ),
          ],
        );
      },
    );
  }
}
