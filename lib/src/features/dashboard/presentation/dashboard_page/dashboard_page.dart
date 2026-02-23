import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/maidenhead_locator.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widget/map_section_widget.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(dashboardControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return controller.when(
      data: (state) => Scaffold(
        body: Stack(
          children: [
            // Map Section (full screen, non-interactive preview)
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: IgnorePointer(
                child: MapSectionWidget(
                  nearbyRepeaters: state.nearbyRepeaters,
                  initialPosition: (
                    lat: state.initialPosition.lat,
                    lon: state.initialPosition.lon,
                    zoom: 8.5
                  ),
                ),
              ),
            ),
            // Locator Chip
            Positioned(
              top: MediaQuery.paddingOf(context).top + 16,
              right: 16,
              child: Chip(
                avatar: Icon(
                  Icons.grid_on,
                  size: 16,
                  color: colorScheme.primary,
                ),
                label: Text(
                  MaidenheadLocator.fromCoordinates(
                    latitude: state.initialPosition.lat,
                    longitude: state.initialPosition.lon,
                  ),
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                backgroundColor: colorScheme.surface,
                side: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            // Draggable Content Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.42,
              minChildSize: 0.42,
              maxChildSize:
                  1.0 - (MediaQuery.paddingOf(context).top / MediaQuery.sizeOf(context).height),
              builder: (context, scrollController) => _ContentSection(
                statistics: state.statistics,
                nearbyRepeaters: state.nearbyRepeaters,
                scrollController: scrollController,
              ),
            ),
            // Map tap target — above the sheet, on top of the stack
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.sizeOf(context).height * 0.42,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  AutoTabsRouter.of(context).setActiveIndex(2);
                },
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: colorScheme.error),
            const SizedBox(height: 16),
            Text(
              l10n.error_message,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => ref.read(dashboardControllerProvider.notifier).reload(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ContentSection extends StatelessWidget {
  const _ContentSection({
    required this.statistics,
    required this.nearbyRepeaters,
    required this.scrollController,
  });

  final DashboardStatistics statistics;
  final List<Repeater> nearbyRepeaters;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 30,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 48,
              height: 6,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick Access Section
                    _QuickAccessSection(statistics: statistics),
                    const SizedBox(height: 24),
                    // Nearby Section
                    _NearbySection(
                      nearbyRepeaters: nearbyRepeaters.take(10).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAccessSection extends ConsumerWidget {
  const _QuickAccessSection({required this.statistics});

  final DashboardStatistics statistics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.grid_view, color: colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              l10n.homeQuickAccess,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: _QuickAccessCard(
                  icon: Icons.list_alt,
                  iconColor: colorScheme.primary,
                  title: l10n.homeRepeaterList,
                  subtitle: l10n.homeStations(statistics.totalRepeaters),
                  onTap: () {
                    AutoTabsRouter.of(context).setActiveIndex(1);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickAccessCard(
                  icon: Icons.favorite,
                  iconColor: Colors.amber,
                  title: l10n.homeMyFavorites,
                  subtitle: l10n.homeSaved(statistics.favoritesCount ?? 0),
                  onTap: () async {
                    final isAuthenticated = await requireAuthentication(context, ref);
                    if (!isAuthenticated || !context.mounted) return;
                    await context.router.push(const FavoritesRoute());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  const _QuickAccessCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NearbySection extends StatelessWidget {
  const _NearbySection({required this.nearbyRepeaters});

  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.near_me, color: colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  l10n.homeNearby,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                AutoTabsRouter.of(context).setActiveIndex(1);
              },
              child: Text(
                l10n.homeViewAll,
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...nearbyRepeaters.map(
          (repeater) => _NearbyRepeaterItem(
            repeater: repeater,
          ),
        ),
      ],
    );
  }
}

class _NearbyRepeaterItem extends StatelessWidget {
  const _NearbyRepeaterItem({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: () {
        context.router.push(
          RepeaterDetailRoute(
            repeaterId: repeater.id,
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            RepeaterAccessIcon(accesses: repeater.accesses),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          repeater.name ?? repeater.callsign ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        RepeaterFormatHelper.formatFrequency(
                          repeater.frequencyHz,
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                      if (repeater.distanceMeters != null) ...[
                        Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: colorScheme.outlineVariant,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          RepeaterFormatHelper.formatDistance(
                            repeater.distanceMeters,
                          ),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (repeater.accesses.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: repeater.accesses.map((access) {
                        final color =
                            AccessModeHelper.getAccessModeColorObject(
                          access.mode,
                        );
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: color.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Text(
                            AccessModeHelper.getAccessModeLabel(access.mode),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: color,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
