// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddRepeaterPage]
class AddRepeaterRoute extends PageRouteInfo<void> {
  const AddRepeaterRoute({List<PageRouteInfo>? children})
      : super(AddRepeaterRoute.name, initialChildren: children);

  static const String name = 'AddRepeaterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddRepeaterPage();
    },
  );
}

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
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesPage();
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
/// [PostLoginOnboardingPage]
class PostLoginOnboardingRoute extends PageRouteInfo<void> {
  const PostLoginOnboardingRoute({List<PageRouteInfo>? children})
      : super(PostLoginOnboardingRoute.name, initialChildren: children);

  static const String name = 'PostLoginOnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostLoginOnboardingPage();
    },
  );
}

/// generated route for
/// [PotaSpotDetailPage]
class PotaSpotDetailRoute extends PageRouteInfo<PotaSpotDetailRouteArgs> {
  PotaSpotDetailRoute({
    required int spotId,
    required String reference,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PotaSpotDetailRoute.name,
          args: PotaSpotDetailRouteArgs(
            spotId: spotId,
            reference: reference,
            key: key,
          ),
          rawPathParams: {'spotId': spotId, 'reference': reference},
          initialChildren: children,
        );

  static const String name = 'PotaSpotDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PotaSpotDetailRouteArgs>(
        orElse: () => PotaSpotDetailRouteArgs(
          spotId: pathParams.getInt('spotId'),
          reference: pathParams.getString('reference'),
        ),
      );
      return PotaSpotDetailPage(
        spotId: args.spotId,
        reference: args.reference,
        key: args.key,
      );
    },
  );
}

class PotaSpotDetailRouteArgs {
  const PotaSpotDetailRouteArgs({
    required this.spotId,
    required this.reference,
    this.key,
  });

  final int spotId;

  final String reference;

  final Key? key;

  @override
  String toString() {
    return 'PotaSpotDetailRouteArgs{spotId: $spotId, reference: $reference, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PotaSpotDetailRouteArgs) return false;
    return spotId == other.spotId &&
        reference == other.reference &&
        key == other.key;
  }

  @override
  int get hashCode => spotId.hashCode ^ reference.hashCode ^ key.hashCode;
}

/// generated route for
/// [PotaSpotsMapPage]
class PotaSpotsMapRoute extends PageRouteInfo<void> {
  const PotaSpotsMapRoute({List<PageRouteInfo>? children})
      : super(PotaSpotsMapRoute.name, initialChildren: children);

  static const String name = 'PotaSpotsMapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PotaSpotsMapPage();
    },
  );
}

/// generated route for
/// [PotaSpotsPage]
class PotaSpotsRoute extends PageRouteInfo<void> {
  const PotaSpotsRoute({List<PageRouteInfo>? children})
      : super(PotaSpotsRoute.name, initialChildren: children);

  static const String name = 'PotaSpotsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PotaSpotsPage();
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
/// [RepeaterDetailMapPage]
class RepeaterDetailMapRoute extends PageRouteInfo<RepeaterDetailMapRouteArgs> {
  RepeaterDetailMapRoute({
    required String repeaterId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RepeaterDetailMapRoute.name,
          args: RepeaterDetailMapRouteArgs(repeaterId: repeaterId, key: key),
          rawPathParams: {'repeaterId': repeaterId},
          initialChildren: children,
        );

  static const String name = 'RepeaterDetailMapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RepeaterDetailMapRouteArgs>(
        orElse: () => RepeaterDetailMapRouteArgs(
          repeaterId: pathParams.getString('repeaterId'),
        ),
      );
      return RepeaterDetailMapPage(repeaterId: args.repeaterId, key: args.key);
    },
  );
}

class RepeaterDetailMapRouteArgs {
  const RepeaterDetailMapRouteArgs({required this.repeaterId, this.key});

  final String repeaterId;

  final Key? key;

  @override
  String toString() {
    return 'RepeaterDetailMapRouteArgs{repeaterId: $repeaterId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RepeaterDetailMapRouteArgs) return false;
    return repeaterId == other.repeaterId && key == other.key;
  }

  @override
  int get hashCode => repeaterId.hashCode ^ key.hashCode;
}

/// generated route for
/// [RepeaterDetailPage]
class RepeaterDetailRoute extends PageRouteInfo<RepeaterDetailRouteArgs> {
  RepeaterDetailRoute({
    required String repeaterId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RepeaterDetailRoute.name,
          args: RepeaterDetailRouteArgs(repeaterId: repeaterId, key: key),
          initialChildren: children,
        );

  static const String name = 'RepeaterDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RepeaterDetailRouteArgs>();
      return RepeaterDetailPage(repeaterId: args.repeaterId, key: args.key);
    },
  );
}

class RepeaterDetailRouteArgs {
  const RepeaterDetailRouteArgs({required this.repeaterId, this.key});

  final String repeaterId;

  final Key? key;

  @override
  String toString() {
    return 'RepeaterDetailRouteArgs{repeaterId: $repeaterId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RepeaterDetailRouteArgs) return false;
    return repeaterId == other.repeaterId && key == other.key;
  }

  @override
  int get hashCode => repeaterId.hashCode ^ key.hashCode;
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
/// [ReportIssuePage]
class ReportIssueRoute extends PageRouteInfo<ReportIssueRouteArgs> {
  ReportIssueRoute({
    required String repeaterId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ReportIssueRoute.name,
          args: ReportIssueRouteArgs(repeaterId: repeaterId, key: key),
          initialChildren: children,
        );

  static const String name = 'ReportIssueRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportIssueRouteArgs>();
      return ReportIssuePage(repeaterId: args.repeaterId, key: args.key);
    },
  );
}

class ReportIssueRouteArgs {
  const ReportIssueRouteArgs({required this.repeaterId, this.key});

  final String repeaterId;

  final Key? key;

  @override
  String toString() {
    return 'ReportIssueRouteArgs{repeaterId: $repeaterId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportIssueRouteArgs) return false;
    return repeaterId == other.repeaterId && key == other.key;
  }

  @override
  int get hashCode => repeaterId.hashCode ^ key.hashCode;
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
/// [SpotListPage]
class SpotListRoute extends PageRouteInfo<void> {
  const SpotListRoute({List<PageRouteInfo>? children})
      : super(SpotListRoute.name, initialChildren: children);

  static const String name = 'SpotListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SpotListPage();
    },
  );
}

/// generated route for
/// [UserReportsPage]
class UserReportsRoute extends PageRouteInfo<void> {
  const UserReportsRoute({List<PageRouteInfo>? children})
      : super(UserReportsRoute.name, initialChildren: children);

  static const String name = 'UserReportsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserReportsPage();
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
