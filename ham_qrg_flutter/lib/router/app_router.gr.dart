// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RepeaterDetailPage]
class RepeaterDetailRoute extends PageRouteInfo<RepeaterDetailRouteArgs> {
  RepeaterDetailRoute({
    required String repeaterId,
    required Repeater repeater,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RepeaterDetailRoute.name,
          args: RepeaterDetailRouteArgs(
            repeaterId: repeaterId,
            repeater: repeater,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RepeaterDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RepeaterDetailRouteArgs>();
      return RepeaterDetailPage(
        repeaterId: args.repeaterId,
        repeater: args.repeater,
        key: args.key,
      );
    },
  );
}

class RepeaterDetailRouteArgs {
  const RepeaterDetailRouteArgs({
    required this.repeaterId,
    required this.repeater,
    this.key,
  });

  final String repeaterId;

  final Repeater repeater;

  final Key? key;

  @override
  String toString() {
    return 'RepeaterDetailRouteArgs{repeaterId: $repeaterId, repeater: $repeater, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RepeaterDetailRouteArgs) return false;
    return repeaterId == other.repeaterId &&
        repeater == other.repeater &&
        key == other.key;
  }

  @override
  int get hashCode => repeaterId.hashCode ^ repeater.hashCode ^ key.hashCode;
}

/// generated route for
/// [RepeatersListPage]
class RepeatersListRoute extends PageRouteInfo<void> {
  const RepeatersListRoute({List<PageRouteInfo>? children})
      : super(RepeatersListRoute.name, initialChildren: children);

  static const String name = 'RepeatersListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RepeatersListPage();
    },
  );
}

/// generated route for
/// [RepeatersMapPage]
class RepeatersMapRoute extends PageRouteInfo<void> {
  const RepeatersMapRoute({List<PageRouteInfo>? children})
      : super(RepeatersMapRoute.name, initialChildren: children);

  static const String name = 'RepeatersMapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RepeatersMapPage();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UserSettingsScreen]
class UserSettingsRoute extends PageRouteInfo<void> {
  const UserSettingsRoute({List<PageRouteInfo>? children})
      : super(UserSettingsRoute.name, initialChildren: children);

  static const String name = 'UserSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserSettingsScreen();
    },
  );
}
