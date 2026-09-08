import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/maidenhead_locator.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/common/widgets/banner/info_banner.dart';
import 'package:hamqrg/common/widgets/error/app_error_widget.dart';
import 'package:hamqrg/common/widgets/error/inline_error_retry.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/common/widgets/label/callsign_text.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/common/widgets/sheet/sheet_drag_handle.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/changelog/data/changelog_data.dart';
import 'package:hamqrg/src/features/changelog/presentation/changelog_sheet.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/dashboard_tablet.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widget/map_section_widget.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widgets/dashboard_offline_content.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:hamqrg/src/features/profile/provider/update_profile/update_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart'
    as sota_mappers;
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_freshness_indicator.dart'
    as sota_fresh;
import 'package:hamqrg/src/features/sota/presentation/widgets/sota_mode_badge.dart';
import 'package:hamqrg/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_dashboard_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum _DashboardTab { repeaters, spots, pota, sota }

@RoutePage()
class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(dashboardControllerProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return controller.when(
      data: (state) => ResponsiveLayout(
        tablet: (_) => Stack(
          children: [
            _ChangelogTrigger(profile: state.profile),
            DashboardTablet(
              statistics: state.statistics,
              initialPosition: state.initialPosition,
              nearbyRepeaters: state.nearbyRepeaters,
            ),
          ],
        ),
        mobile: (_) => Scaffold(
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
                  scrollController: scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => AppErrorWidget(
        label: 'Dashboard',
        error: error,
        stackTrace: stackTrace,
        onRetry: () => ref.read(dashboardControllerProvider.notifier).reload(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

// ---------------------------------------------------------------------------
// Content Sheet
// ---------------------------------------------------------------------------

class _ContentSection extends HookConsumerWidget {
  const _ContentSection({
    required this.statistics,
    required this.nearbyRepeaters,
    required this.scrollController,
  });

  final DashboardStatistics statistics;
  final List<Repeater> nearbyRepeaters;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(_DashboardTab.repeaters);
    final theme = Theme.of(context);
    final isOffline = ref.watch(offlineStatusProvider).value ?? false;
    // Offline senza nulla in cache: statistiche a zero e liste vuote sono
    // solo rumore — al loro posto uno stato dedicato che dice cosa resta
    // disponibile sul campo.
    final showOfflineEmptyState =
        isOffline && nearbyRepeaters.isEmpty && statistics.totalRepeaters == 0;

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
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showOfflineEmptyState)
                      const DashboardOfflineContent()
                    else ...[
                      // Offline con dati in cache: banner informativo sopra
                      // le statistiche, contenuto normale sotto.
                      if (isOffline)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: InfoBanner(
                            icon: const Icon(Icons.cloud_off_outlined),
                            label: context.localization.offlineBannerMessage,
                          ),
                        ),
                      // Compact Stats Row
                      _StatsRow(statistics: statistics),
                      // Segmented Tab Selector
                      _TabSelector(
                        selectedTab: selectedTab.value,
                        onTabChanged: (tab) => selectedTab.value = tab,
                      ),
                      // Tab Content
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: switch (selectedTab.value) {
                          _DashboardTab.repeaters => _RepeatersTabContent(
                              key: const ValueKey('repeaters'),
                              nearbyRepeaters:
                                  nearbyRepeaters.take(10).toList(),
                            ),
                          _DashboardTab.spots => const SpotDashboardTab(
                              key: ValueKey('spots'),
                            ),
                          _DashboardTab.pota => const _PotaTabContent(
                              key: ValueKey('pota'),
                            ),
                          _DashboardTab.sota => const _SotaTabContent(
                              key: ValueKey('sota'),
                            ),
                        },
                      ),
                    ],
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
// Offline empty state
// ---------------------------------------------------------------------------

/// Contenuto dello sheet quando si è offline senza nulla in cache per la
/// zona: al posto di statistiche a zero e liste vuote, dice cosa resta
/// disponibile sul campo e offre un modo per riprovare.
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

/// Raggio condiviso da track e pill: sono complanari, quindi devono avere
/// lo stesso arrotondamento agli angoli.
const double _tabRadius = 12;

class _TabSelector extends ConsumerWidget {
  const _TabSelector({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final _DashboardTab selectedTab;
  final ValueChanged<_DashboardTab> onTabChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Watched here (and not in the dashboard controller) so that a POTA/SOTA
    // outage only blanks the badges, never the home page. Watching from the
    // always-mounted selector also keeps both fetches warm across tab
    // switches.
    final potaSpotsCount =
        ref.watch(getPotaSpotsProvider).asData?.value.length ?? 0;
    final sotaSpotsCount =
        ref.watch(getSotaSpotsProvider).asData?.value.length ?? 0;

    final items = <_TabItem>[
      _TabItem(
        value: _DashboardTab.repeaters,
        icon: Icons.cell_tower,
        label: l10n.dashboardTabRepeaters,
      ),
      _TabItem(
        value: _DashboardTab.spots,
        icon: Icons.podcasts,
        label: l10n.spotListTitle,
      ),
      _TabItem(
        value: _DashboardTab.pota,
        icon: Icons.park,
        label: l10n.dashboardTabPota,
        badgeCount: potaSpotsCount,
      ),
      _TabItem(
        value: _DashboardTab.sota,
        icon: Icons.terrain,
        label: l10n.sotaTabDashboard,
        badgeCount: sotaSpotsCount,
      ),
    ];

    // Nessun padding sul track: le pill devono partire e finire esattamente
    // dove partono e finiscono i chip statistiche sopra. L'aria si prende
    // fuori dal track (margin), non dentro: un'inset verticale farebbe
    // sbordare le pill a filo bordo dagli angoli arrotondati.
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(_tabRadius),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTight = constraints.maxWidth < 360;
          final collapsedWidth = isTight ? 46.0 : 52.0;
          const tabGap = 4.0;
          final totalGaps = (items.length - 1) * tabGap;
          final expandedWidth = constraints.maxWidth -
              (items.length - 1) * collapsedWidth -
              totalGaps;
          final showCollapsedBadges = constraints.maxWidth >= 380;

          return Row(
            spacing: tabGap,
            children: [
              for (final item in items)
                _ExpandableTab(
                  item: item,
                  isSelected: selectedTab == item.value,
                  collapsedWidth: collapsedWidth,
                  expandedWidth:
                      expandedWidth.clamp(collapsedWidth, double.infinity),
                  showCollapsedBadge: showCollapsedBadges,
                  onTap: () => onTabChanged(item.value),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _TabItem {
  const _TabItem({
    required this.value,
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });

  final _DashboardTab value;
  final IconData icon;
  final String label;
  final int badgeCount;
}

class _ExpandableTab extends StatelessWidget {
  const _ExpandableTab({
    required this.item,
    required this.isSelected,
    required this.collapsedWidth,
    required this.expandedWidth,
    required this.showCollapsedBadge,
    required this.onTap,
  });

  final _TabItem item;
  final bool isSelected;
  final double collapsedWidth;
  final double expandedWidth;
  final bool showCollapsedBadge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final foreground =
        isSelected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant;
    final showBadge = item.badgeCount > 0 && (isSelected || showCollapsedBadge);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      width: isSelected ? expandedWidth : collapsedWidth,
      height: 44,
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(_tabRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(_tabRadius),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_tabRadius),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 18, color: foreground),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      item.label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: foreground,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
                if (showBadge) ...[
                  const SizedBox(width: 6),
                  _LiveBadge(
                    count: item.badgeCount,
                    onPrimary: isSelected,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge({required this.count, this.onPrimary = false});

  final int count;
  final bool onPrimary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = onPrimary ? colorScheme.onPrimary : colorScheme.primary;
    final fg = onPrimary ? colorScheme.primary : colorScheme.onPrimary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: fg,
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

class _PotaTabContent extends ConsumerWidget {
  const _PotaTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final asyncSpots = ref.watch(getPotaSpotsProvider);
    final spots = asyncSpots.asData?.value ?? const <PotaSpot>[];

    if (asyncSpots.isLoading && spots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // The POTA API is third-party: its failure is confined to this tab.
    if (asyncSpots.hasError && spots.isEmpty) {
      return InlineErrorRetry(
        message: l10n.potaLoadError,
        retryLabel: l10n.potaRetry,
        onRetry: () => ref.invalidate(getPotaSpotsProvider),
      );
    }

    if (spots.isEmpty) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.potaTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => ref.invalidate(getPotaSpotsProvider),
                  icon: Icon(
                    Icons.refresh,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                TextButton(
                  onPressed: () => context.router.push(const PotaSpotsRoute()),
                  child: Text(l10n.dashboardViewAllPotaSpots),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...spots.take(5).map(
              (spot) => _PotaSpotItem(spot: spot),
            ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// SOTA Tab Content
// ---------------------------------------------------------------------------

class _SotaTabContent extends ConsumerWidget {
  const _SotaTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final asyncSpots = ref.watch(getSotaSpotsProvider);
    final spots = asyncSpots.asData?.value ?? const <SotaSpot>[];

    if (asyncSpots.isLoading && spots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // The SOTA API is third-party: its failure is confined to this tab.
    if (asyncSpots.hasError && spots.isEmpty) {
      return InlineErrorRetry(
        message: l10n.sotaLoadError,
        retryLabel: l10n.sotaRetry,
        onRetry: () => ref.invalidate(getSotaSpotsProvider),
      );
    }

    if (spots.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Icon(
              Icons.terrain,
              size: 40,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.sotaIntroEmpty,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.sotaTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => ref.invalidate(getSotaSpotsProvider),
                  icon: Icon(
                    Icons.refresh,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                TextButton(
                  onPressed: () => context.router.push(const SotaSpotsRoute()),
                  child: Text(l10n.sotaViewAll),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...spots.take(5).map(
              (spot) => _SotaSpotItem(spot: spot),
            ),
      ],
    );
  }
}

class _SotaSpotItem extends StatelessWidget {
  const _SotaSpotItem({required this.spot});

  final SotaSpot spot;

  Color _freshnessColor(Duration age) {
    if (age.inMinutes < 5) return const Color(0xFF16A34A); // green-600
    if (age.inMinutes < 15) return const Color(0xFFD97706); // amber-600
    return const Color(0xFF6B7280); // gray-500
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final band = sota_mappers.bandFromFrequencyMhz(spot.frequencyMhz);
    final age = DateTime.now().difference(spot.timestamp);
    final freshColor = _freshnessColor(age);

    return InkWell(
      onTap: () {
        context.router.push(
          SotaSpotDetailRoute(
            spotId: spot.id,
            summitCode: spot.summitCode,
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
              Container(width: 4, color: freshColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CallsignText(
                            callsign: spot.activator,
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
                              sota_fresh.sotaSpotTimeAgo(spot.timestamp),
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
                            '${spot.frequencyMhz.toStringAsFixed(3)} MHz',
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
                          if (normalizeSotaMode(spot.mode) != null) ...[
                            const SizedBox(width: 6),
                            SotaModeBadge(mode: spot.mode),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Row 3: Summit name + reference
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/sota_logo.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              spot.summitName,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            spot.summitCode,
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
                          CallsignText(
                            callsign: spot.activator,
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
                          repeater.callsign ?? repeater.name ?? '',
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
                          context.units.distance(
                            repeater.distanceMeters!,
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
          if (!context.mounted) return;
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

          // Mark lastSeenVersion as seen BEFORE showing the sheet.
          // The sheet await can outlive this widget (user navigates away),
          // and using `ref` after the widget unmounts throws a StateError.
          if (profile!.lastSeenVersion != appVersion) {
            await ref.read(
              updateProfileProvider(
                profile!.copyWith(lastSeenVersion: appVersion),
              ).future,
            );
          }

          if (unseen.isNotEmpty && context.mounted) {
            await showChangelogSheet(context, entries: unseen);
          }
        });

        return null;
      },
      [profile],
    );

    return const SizedBox.shrink();
  }
}
