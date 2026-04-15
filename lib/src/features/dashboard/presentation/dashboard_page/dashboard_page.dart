import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/maidenhead_locator.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_drag_handle.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/changelog/data/changelog_data.dart';
import 'package:hamqrg/src/features/changelog/presentation/changelog_sheet.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widget/map_section_widget.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_dashboard_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum _DashboardTab { repeaters, spots, pota }

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
            // Changelog trigger (invisible, fires once)
            _ChangelogTrigger(profile: state.profile),

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
            // Map tap target — below the sheet so sheet items take priority
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
            // Draggable Content Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.42,
              minChildSize: 0.42,
              maxChildSize: 1.0 -
                  (MediaQuery.paddingOf(context).top /
                      MediaQuery.sizeOf(context).height),
              builder: (context, scrollController) => _ContentSection(
                statistics: state.statistics,
                nearbyRepeaters: state.nearbyRepeaters,
                potaSpots: state.potaSpots,
                scrollController: scrollController,
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
              onPressed: () =>
                  ref.read(dashboardControllerProvider.notifier).reload(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

// ---------------------------------------------------------------------------
// Content Sheet
// ---------------------------------------------------------------------------

class _ContentSection extends HookWidget {
  const _ContentSection({
    required this.statistics,
    required this.nearbyRepeaters,
    required this.potaSpots,
    required this.scrollController,
  });

  final DashboardStatistics statistics;
  final List<Repeater> nearbyRepeaters;
  final List<PotaSpot> potaSpots;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(_DashboardTab.repeaters);
    final theme = Theme.of(context);

    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.2),
              blurRadius: 30,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Handle
            const SheetDragHandle(),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Compact Stats Row
                    _StatsRow(statistics: statistics),
                    const SizedBox(height: 16),
                    // Segmented Tab Selector
                    _TabSelector(
                      selectedTab: selectedTab.value,
                      potaSpotsCount: potaSpots.length,
                      onTabChanged: (tab) => selectedTab.value = tab,
                    ),
                    const SizedBox(height: 16),
                    // Tab Content
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: switch (selectedTab.value) {
                        _DashboardTab.repeaters => _RepeatersTabContent(
                            key: const ValueKey('repeaters'),
                            nearbyRepeaters: nearbyRepeaters.take(10).toList(),
                          ),
                        _DashboardTab.spots => const SpotDashboardTab(
                            key: ValueKey('spots'),
                          ),
                        _DashboardTab.pota => _PotaTabContent(
                            key: const ValueKey('pota'),
                            potaSpots: potaSpots.take(5).toList(),
                          ),
                      },
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

// ---------------------------------------------------------------------------
// Compact Stats Row
// ---------------------------------------------------------------------------

class _StatsRow extends ConsumerWidget {
  const _StatsRow({required this.statistics});

  final DashboardStatistics statistics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Row(
      children: [
        Expanded(
          child: _StatChip(
            icon: Icons.cell_tower,
            iconColor: colorScheme.primary,
            label: l10n.homeStations(statistics.totalRepeaters),
            onTap: () => AutoTabsRouter.of(context).setActiveIndex(1),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatChip(
            icon: Icons.favorite,
            iconColor: colorScheme.error,
            label: l10n.homeSaved(statistics.favoritesCount ?? 0),
            onTap: () async {
              final isAuthenticated = await requireAuthentication(context, ref);
              if (!isAuthenticated || !context.mounted) return;
              await context.router.push(const FavoritesRoute());
            },
          ),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab Selector (SegmentedButton)
// ---------------------------------------------------------------------------

class _TabSelector extends StatelessWidget {
  const _TabSelector({
    required this.selectedTab,
    required this.potaSpotsCount,
    required this.onTabChanged,
  });

  final _DashboardTab selectedTab;
  final int potaSpotsCount;
  final ValueChanged<_DashboardTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;

    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<_DashboardTab>(
        segments: [
          ButtonSegment(
            value: _DashboardTab.repeaters,
            label: Text(l10n.dashboardTabRepeaters),
          ),
          ButtonSegment(
            value: _DashboardTab.spots,
            label: Text(l10n.spotListTitle),
          ),
          ButtonSegment(
            value: _DashboardTab.pota,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.dashboardTabPota),
                if (potaSpotsCount > 0) ...[
                  const SizedBox(width: 6),
                  _LiveBadge(count: potaSpotsCount),
                ],
              ],
            ),
          ),
        ],
        selected: {selectedTab},
        onSelectionChanged: (selected) => onTabChanged(selected.first),
        showSelectedIcon: false,
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Repeaters Tab Content
// ---------------------------------------------------------------------------

class _RepeatersTabContent extends StatelessWidget {
  const _RepeatersTabContent({required this.nearbyRepeaters, super.key});

  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    if (nearbyRepeaters.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            l10n.dashboardNearbyEmpty,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        ...nearbyRepeaters.map(
          (repeater) => _NearbyRepeaterItem(repeater: repeater),
        ),
        const SizedBox(height: 4),
        _ViewAllButton(
          label: l10n.dashboardViewAllRepeaters,
          onTap: () => AutoTabsRouter.of(context).setActiveIndex(1),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// POTA Tab Content
// ---------------------------------------------------------------------------

class _PotaTabContent extends StatelessWidget {
  const _PotaTabContent({required this.potaSpots, super.key});

  final List<PotaSpot> potaSpots;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    if (potaSpots.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            l10n.potaNoSpots,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      children: [
        _ViewAllButton(
          label: l10n.dashboardViewAllPotaSpots,
          onTap: () => context.router.push(const PotaSpotsRoute()),
        ),
        const SizedBox(height: 12),
        ...potaSpots.map(
          (spot) => _PotaSpotItem(spot: spot),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// View All Button
// ---------------------------------------------------------------------------

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Text(label),
        label: const Icon(Icons.arrow_forward, size: 16),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// POTA Spot Item
// ---------------------------------------------------------------------------

class _PotaSpotItem extends StatelessWidget {
  const _PotaSpotItem({required this.spot});

  final PotaSpot spot;

  Color _freshnessColor(Duration age) {
    if (age.inMinutes < 5) return const Color(0xFF16A34A); // green-600
    if (age.inMinutes < 15) return const Color(0xFFD97706); // amber-600
    return const Color(0xFF6B7280); // gray-500
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final band = bandFromFrequencyKhz(spot.frequency);
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = _freshnessColor(age);

    return InkWell(
      onTap: () {
        context.router.push(
          PotaSpotDetailRoute(
            spotId: spot.spotId,
            reference: spot.reference,
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Freshness accent bar
              Container(width: 4, color: freshColor),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row 1: Activator + time badge
                      Row(
                        children: [
                          Text(
                            spot.activator,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: freshColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              spotTimeAgo(spot.spotTime),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: freshColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Row 2: Frequency + band + mode badges
                      Row(
                        children: [
                          Text(
                            '${spot.frequency} kHz',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                          if (band != null) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                band,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                          if (normalizePotaMode(spot.mode) != null) ...[
                            const SizedBox(width: 6),
                            PotaModeBadge(mode: spot.mode),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Row 3: Park name + reference
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/pota_logo.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              spot.name,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            spot.reference,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color:
                                  colorScheme.onSurface.withValues(alpha: 0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Chevron
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Nearby Repeater Item
// ---------------------------------------------------------------------------

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
                        final color = AccessModeHelper.getAccessModeColorObject(
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

class _ChangelogTrigger extends HookConsumerWidget {
  const _ChangelogTrigger({required this.profile});
  final Profile? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasShown = useRef(false);
    final l10n = context.localization;

    useEffect(
      () {
        if (hasShown.value || profile == null) return null;
        hasShown.value = true;

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!context.mounted) return;

          final packageInfo = await ref.read(packageInfoProvider.future);
          final appVersion = packageInfo.version;

          // Only show entries for versions <= current app version
          final allEntries = getChangelogEntries(l10n)
              .where((e) => compareVersions(e.version, appVersion) <= 0)
              .toList();

          // If lastSeenVersion is null (existing user, column just added),
          // show all entries for the current version
          final unseen = profile!.lastSeenVersion == null
              ? allEntries
              : getUnseenChangelogEntries(
                  allEntries: allEntries,
                  lastSeenVersion: profile!.lastSeenVersion,
                );

          if (unseen.isNotEmpty && context.mounted) {
            await showChangelogSheet(context, entries: unseen);
          }

          // Update lastSeenVersion to current app version
          if (profile!.lastSeenVersion != appVersion) {
            await ref.read(
              updateProfileProvider(
                profile!.copyWith(lastSeenVersion: appVersion),
              ).future,
            );
          }
        });

        return null;
      },
      [profile],
    );

    return const SizedBox.shrink();
  }
}
