import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/auth_screen.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/change_password/change_password_screen.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/dashboard_page.dart';
import 'package:hamqrg/src/features/favorites/presentation/favorites_page/favorites_page.dart';
import 'package:hamqrg/src/features/home/presentation/home_page/home_page.dart';
import 'package:hamqrg/src/features/post_login_onboarding/presentation/post_login_onboarding/post_login_onboarding_page.dart';
import 'package:hamqrg/src/features/profile/presentation/profile/profile_screen.dart';
import 'package:hamqrg/src/features/profile/presentation/user_settings/user_settings_screen.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/repeater_detail_page.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/repeaters_list_page.dart';
import 'package:hamqrg/src/features/repeaters/presentation/map/repeaters_map_page.dart';
import 'package:hamqrg/src/features/repeaters/presentation/report_issue/report_issue_page.dart';
import 'package:hamqrg/src/features/splashscreen/presentation/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter implements AutoRouteGuard {
  AppRouter(this.ref);
  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: PostLoginOnboardingRoute.page),
        AutoRoute(path: '/change-password', page: ChangePasswordRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          guards: [this],
          children: [
            AutoRoute(
              page: const EmptyShellRoute('MainRouter'),
              children: [
                AutoRoute(path: 'dashboard', page: DashboardRoute.page),
                AutoRoute(path: 'map', page: RepeatersMapRoute.page),
                AutoRoute(path: 'list', page: RepeatersListRoute.page),
                AutoRoute(path: 'favorites', page: FavoritesRoute.page),
                AutoRoute(path: 'repeater/:repeaterId', page: RepeaterDetailRoute.page),
                AutoRoute(path: 'repeater/:repeaterId/report', page: ReportIssueRoute.page),
              ],
            ),
            AutoRoute(
              page: const EmptyShellRoute('ProfileRouter'),
              children: [
                AutoRoute(page: ProfileRoute.page),
                AutoRoute(page: UserSettingsRoute.page),
              ],
            ),
          ],
        ),
        // Quiz route as a separate full-screen route
      ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    resolver.next();
    // // Check if the route is splash or login page
    // final isRequiredIsNotAnonymous = switch (resolver.route.name) {
    //   SplashRoute.name => false,
    //   AuthRoute.name => false,
    //   ChangePasswordRoute.name => false,
    //   QuizDashboardRoute.name => false,
    //   _ => true,
    // };

    // // If the route is not required auth, go to next route
    // if (!isRequiredIsNotAnonymous) {
    //   return resolver.next();
    // }

    // // Check permission
    // var isAnynoumous = true;
    // try {
    //   isAnynoumous = await ref.read(isAnonymousProvider.future);
    //   log('isAnonymous: $isAnynoumous, go to next route: ${resolver.route.name}');
    // } catch (e) {
    //   log(e.toString());
    //   isAnynoumous = true;
    // }
    // if (isRequiredIsNotAnonymous && !isAnynoumous) {
    //   await resolver.redirectUntil(const AuthRoute(), replace: true);
    // } else {
    //   resolver.next();
    // }
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter appRouter(Ref ref) {
  return AppRouter(ref);
}
