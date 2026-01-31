import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/dialogs/show_telegram_invite_dialog.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/home/presentation/home_page/controller/home_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);

    return controller.when(
      data: (state) {
        useMemoized(
          () async {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) async {
                await Future.delayed(const Duration(seconds: 2));
                if (state.showTelegram && context.mounted) {
                  final controller = ref.read(homeControllerProvider.notifier);
                  await showTelegramInviteDialog(
                    context,
                    onAlreadyTelegramMember: () async {
                      await controller.setTelegramGroupMember();
                    },
                  );
                  await controller.setTelegramInviteLastShownDate();
                }
              },
            );
          },
        );

        return AutoTabsScaffold(
          routes: const [
            DashboardRoute(),
            RepeatersListRoute(),
            RepeatersMapRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list),
                  label: 'Lista',
                ),
                NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profilo',
                ),
              ],
            );
          },
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
