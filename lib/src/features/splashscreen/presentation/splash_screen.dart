import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/dialogs/show_update_required_dialog.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/splashscreen/presentation/controller/splash_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen<AsyncValue<SplashAction?>>(
        splashControllerProvider,
        (previous, next) {
          next.whenData((action) {
            if (action == null) return;

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final notifier = ref.read(splashControllerProvider.notifier);
              if (!context.mounted) return;

              switch (action.type) {
                case SplashActionType.navigate:
                  final route = action.route ?? const HomeRoute();
                  await context.router.replaceAll([route]);
                case SplashActionType.updateDialog:
                  final dialogData = action.updateDialogData;
                  if (dialogData == null) {
                    notifier.clearAction();
                    return;
                  }
                  try {
                    await showUpdateRequiredDialog(
                      context,
                      appStoreId: dialogData.appStoreId,
                      playStorePackageName: dialogData.playStorePackageName,
                    );
                  } catch (error, stackTrace) {
                    await Sentry.captureException(
                      error,
                      stackTrace: stackTrace,
                    );
                  }
                  if (!context.mounted) return;
                  await context.router.replace(dialogData.fallbackRoute);
              }

              notifier.clearAction();
            });
          });
        },
      )
      ..watch(splashControllerProvider);

    return const _SplashView();
  }
}

class _SplashView extends ConsumerWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Ambient Glow
          Center(
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primary.withValues(alpha: 0.05),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.05),
                      blurRadius: 120,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                // Logo and Title Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo Container
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween(begin: 0, end: 1),
                      curve: Curves.easeOutCubic,
                      builder: (context, opacity, child) {
                        return Opacity(
                          opacity: opacity,
                          child: Transform.scale(
                            scale: 0.8 + (opacity * 0.2),
                            child: child,
                          ),
                        );
                      },
                      child: const _LogoContainer(),
                    ),
                    const SizedBox(height: 32),
                    // App Title & Tagline
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 1000),
                      tween: Tween(begin: 0, end: 1),
                      curve: Curves.easeOut,
                      builder: (context, opacity, child) {
                        return Opacity(
                          opacity: opacity,
                          child: Transform.translate(
                            offset: Offset(0, (1 - opacity) * 16),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          // App Title
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: l10n.commonAppNamePart1,
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                TextSpan(
                                  text: l10n.commonAppNamePart2,
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          // Tagline
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.public,
                                size: 18,
                                color: colorScheme.primary.withValues(alpha: 0.8),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.commonAppTagline,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                          // Loading Indicator
                          const _LoadingBar(),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    children: [
                      Text(
                        l10n.commonPoweredBy,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ref.watch(packageInfoProvider).when(
                            data: (packageInfo) => Text(
                              'v${packageInfo.version}',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.outline,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            loading: () => const SizedBox.shrink(),
                            error: (_, __) => const SizedBox.shrink(),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoContainer extends StatelessWidget {
  const _LogoContainer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Glow Ring
        Container(
          width: 136,
          height: 136,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary.withValues(alpha: 0.5),
                colorScheme.secondary.withValues(alpha: 0.5),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        // Icon Box
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colorScheme.outline,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background Pattern (simulated with gradient)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withValues(alpha: 0.05),
                      colorScheme.primary.withValues(alpha: 0.02),
                    ],
                  ),
                ),
              ),
              // Main Icon
              Center(
                child: Icon(
                  Icons.cell_tower,
                  size: 64,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadingBar extends StatefulWidget {
  const _LoadingBar();

  @override
  State<_LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<_LoadingBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 192,
      height: 4,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999),
              color: colorScheme.outlineVariant,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
