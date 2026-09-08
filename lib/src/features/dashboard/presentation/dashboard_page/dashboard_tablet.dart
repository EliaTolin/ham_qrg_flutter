import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/maidenhead_locator.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/widgets/banner/info_banner.dart';
import 'package:hamqrg/common/widgets/error/inline_error_retry.dart';
import 'package:hamqrg/common/widgets/label/callsign_text.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/dashboard/domain/dashboard_statistics/dashboard_statistics.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widget/map_section_widget.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widgets/dashboard_offline_content.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart'
    as sota_mappers;
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_altitude_badge.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_points_badge.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_freshness_indicator.dart'
    as sota_fresh;
import 'package:hamqrg/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_dashboard_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Tablet "Mission Control" layout for the dashboard.
///
/// Two-pane composition:
/// - Left: interactive map with overlays (locator chip, open full map button).
/// - Right: console-styled side panel with stats + three stacked sections
///   (Nearby Repeaters / Active Spots / POTA), all visible at once.
class DashboardTablet extends StatelessWidget {
  const DashboardTablet({
    required this.statistics,
    required this.initialPosition,
    required this.nearbyRepeaters,
    super.key,
  });

  final DashboardStatistics statistics;
  final ({double lat, double lon}) initialPosition;
  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: _MapPane(
              initialPosition: initialPosition,
              nearbyRepeaters: nearbyRepeaters,
            ),
          ),
          Container(
            width: 1,
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
          SizedBox(
            width: 460,
            child: ColoredBox(
              color: theme.colorScheme.surfaceContainerLowest,
              child: _SidePanel(
                statistics: statistics,
                nearbyRepeaters: nearbyRepeaters,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// MAP PANE — interactive map + overlays
// ---------------------------------------------------------------------------
class _MapPane extends StatelessWidget {
  const _MapPane({
    required this.initialPosition,
    required this.nearbyRepeaters,
  });

  final ({double lat, double lon}) initialPosition;
  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: MapSectionWidget(
              nearbyRepeaters: nearbyRepeaters,
              initialPosition: (
                lat: initialPosition.lat,
                lon: initialPosition.lon,
                zoom: 8.5,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => AutoTabsRouter.of(context).setActiveIndex(2),
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 16,
          left: 16,
          child: _LocatorChip(
            latitude: initialPosition.lat,
            longitude: initialPosition.lon,
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 16,
          right: 16,
          child: Material(
            color: colorScheme.surface,
            elevation: 2,
            shadowColor: theme.shadowColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () => AutoTabsRouter.of(context).setActiveIndex(2),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.open_in_full,
                      size: 16,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'OPEN FULL MAP',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontFamily: 'monospace',
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LocatorChip extends StatefulWidget {
  const _LocatorChip({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  State<_LocatorChip> createState() => _LocatorChipState();
}

class _LocatorChipState extends State<_LocatorChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
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
    final locator = MaidenheadLocator.fromCoordinates(
      latitude: widget.latitude,
      longitude: widget.longitude,
    );

    return Material(
      color: colorScheme.surface,
      elevation: 2,
      shadowColor: theme.shadowColor.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final t = _controller.value;
                return Icon(
                  Icons.grid_on,
                  size: 16,
                  color: colorScheme.primary.withValues(alpha: 0.55 + 0.45 * t),
                );
              },
            ),
            const SizedBox(width: 8),
            Text(
              locator,
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// SIDE PANEL — stats + 3 console sections
// ---------------------------------------------------------------------------
class _SidePanel extends ConsumerWidget {
  const _SidePanel({
    required this.statistics,
    required this.nearbyRepeaters,
  });

  final DashboardStatistics statistics;
  final List<Repeater> nearbyRepeaters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final isOffline = ref.watch(offlineStatusProvider).value ?? false;
    // Stesso criterio del layout mobile: offline senza nulla in cache lo
    // stato dedicato sostituisce tegole a zero e liste vuote.
    final showOfflineEmptyState =
        isOffline && nearbyRepeaters.isEmpty && statistics.totalRepeaters == 0;
    if (showOfflineEmptyState) {
      return const SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: DashboardOfflineContent(),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isOffline) ...[
            InfoBanner(
              icon: const Icon(Icons.cloud_off_outlined),
              label: l10n.offlineBannerMessage,
            ),
            const SizedBox(height: 16),
          ],
          _StatsTiles(statistics: statistics),
          const SizedBox(height: 24),
          _ConsoleSection(
            label: 'NEARBY REPEATERS',
            actionLabel: l10n.dashboardViewAllRepeaters,
            onAction: () => AutoTabsRouter.of(context).setActiveIndex(1),
            onRefresh: () =>
                ref.read(dashboardControllerProvider.notifier).reload(),
            child: _NearbyRepeatersList(
              repeaters: nearbyRepeaters.take(5).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const SpotDashboardTab(),
          const SizedBox(height: 20),
          _ConsoleSection(
            label: 'POTA SPOTS',
            actionLabel: l10n.dashboardViewAllPotaSpots,
            onAction: () => context.router.push(const PotaSpotsRoute()),
            onRefresh: () => ref.invalidate(getPotaSpotsProvider),
            child: const _PotaList(),
          ),
          const SizedBox(height: 20),
          _ConsoleSection(
            label: 'SOTA SPOTS',
            actionLabel: l10n.sotaViewAll,
            onAction: () => context.router.push(const SotaSpotsRoute()),
            onRefresh: () => ref.invalidate(getSotaSpotsProvider),
            child: const _SotaList(),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Console primitives
// ---------------------------------------------------------------------------
class _ConsoleSection extends StatelessWidget {
  const _ConsoleSection({
    required this.label,
    required this.child,
    this.actionLabel,
    this.onAction,
    this.onRefresh,
  });

  final String label;
  final Widget child;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                fontFamily: 'monospace',
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 1,
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
            if (onRefresh != null) ...[
              const SizedBox(width: 8),
              InkWell(
                onTap: onRefresh,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.refresh,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(width: 10),
              InkWell(
                onTap: onAction,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        actionLabel!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.arrow_forward,
                        size: 12,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Stats tiles
// ---------------------------------------------------------------------------
class _StatsTiles extends ConsumerWidget {
  const _StatsTiles({required this.statistics});

  final DashboardStatistics statistics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Row(
      children: [
        Expanded(
          child: _StatTile(
            icon: Icons.cell_tower,
            iconColor: colorScheme.primary,
            value: '${statistics.totalRepeaters}',
            label: l10n.homeStations(statistics.totalRepeaters),
            onTap: () => AutoTabsRouter.of(context).setActiveIndex(1),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            icon: Icons.favorite,
            iconColor: colorScheme.error,
            value: '${statistics.favoritesCount ?? 0}',
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

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      value,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact nearby repeaters list
// ---------------------------------------------------------------------------
class _NearbyRepeatersList extends StatelessWidget {
  const _NearbyRepeatersList({required this.repeaters});

  final List<Repeater> repeaters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    if (repeaters.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          l10n.dashboardNearbyEmpty,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return Column(
      children: [
        for (final r in repeaters) _CompactRepeaterRow(repeater: r),
      ],
    );
  }
}

class _CompactRepeaterRow extends StatelessWidget {
  const _CompactRepeaterRow({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final firstAccess =
        repeater.accesses.isNotEmpty ? repeater.accesses.first : null;
    final accessColor = firstAccess != null
        ? AccessModeHelper.getAccessModeColorObject(firstAccess.mode)
        : colorScheme.outlineVariant;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.router.push(
          RepeaterDetailRoute(repeaterId: repeater.id),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 32,
                decoration: BoxDecoration(
                  color: accessColor.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      repeater.callsign ?? repeater.name ?? 'Unknown',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (repeater.locality != null)
                      Text(
                        repeater.locality!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                RepeaterFormatHelper.formatFrequency(repeater.frequencyHz),
                style: theme.textTheme.labelMedium?.copyWith(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              if (repeater.distanceMeters != null) ...[
                const SizedBox(width: 8),
                Text(
                  context.units.distance(repeater.distanceMeters!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact POTA list
// ---------------------------------------------------------------------------
class _PotaList extends ConsumerWidget {
  const _PotaList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final asyncSpots = ref.watch(getPotaSpotsProvider);
    final spots = asyncSpots.asData?.value ?? const <PotaSpot>[];

    if (asyncSpots.isLoading && spots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    // The POTA API is third-party: its failure stays inside this section.
    if (asyncSpots.hasError && spots.isEmpty) {
      return InlineErrorRetry(
        compact: true,
        message: l10n.potaLoadError,
        retryLabel: l10n.potaRetry,
        onRetry: () => ref.invalidate(getPotaSpotsProvider),
      );
    }

    if (spots.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          l10n.potaNoSpots,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return Column(
      children: [
        for (final s in spots.take(5)) _CompactPotaRow(spot: s),
      ],
    );
  }
}

class _CompactPotaRow extends StatelessWidget {
  const _CompactPotaRow({required this.spot});

  final PotaSpot spot;

  Color _freshnessColor(BuildContext context, Duration age) {
    final colorScheme = Theme.of(context).colorScheme;
    if (age.inMinutes < 5) return colorScheme.tertiary;
    if (age.inMinutes < 15) return colorScheme.secondary;
    return colorScheme.outlineVariant;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = _freshnessColor(context, age);
    final band = bandFromFrequencyKhz(spot.frequency);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.router.push(
          PotaSpotDetailRoute(
            spotId: spot.spotId,
            reference: spot.reference,
          ),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 32,
                decoration: BoxDecoration(
                  color: freshColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CallsignText(
                      callsign: spot.activator,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${spot.reference} · ${band ?? '?'}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: freshColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
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
        ),
      ),
    );
  }
}

class _SotaList extends ConsumerWidget {
  const _SotaList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final asyncSpots = ref.watch(getSotaSpotsProvider);
    final spots = asyncSpots.asData?.value ?? const <SotaSpot>[];

    if (asyncSpots.isLoading && spots.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    // The SOTA API is third-party: its failure stays inside this section.
    if (asyncSpots.hasError && spots.isEmpty) {
      return InlineErrorRetry(
        compact: true,
        message: l10n.sotaLoadError,
        retryLabel: l10n.sotaRetry,
        onRetry: () => ref.invalidate(getSotaSpotsProvider),
      );
    }

    if (spots.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          l10n.sotaListEmpty,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return Column(
      children: [
        for (final s in spots.take(5)) _CompactSotaRow(spot: s),
      ],
    );
  }
}

class _CompactSotaRow extends StatelessWidget {
  const _CompactSotaRow({required this.spot});

  final SotaSpot spot;

  Color _freshnessColor(BuildContext context, Duration age) {
    final colorScheme = Theme.of(context).colorScheme;
    if (age.inMinutes < 5) return colorScheme.tertiary;
    if (age.inMinutes < 15) return colorScheme.secondary;
    return colorScheme.outlineVariant;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final age = DateTime.now().difference(spot.timestamp);
    final freshColor = _freshnessColor(context, age);
    final band = sota_mappers.bandFromFrequencyMhz(spot.frequencyMhz);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.router.push(
          SotaSpotDetailRoute(
            spotId: spot.id,
            summitCode: spot.summitCode,
          ),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 40,
                decoration: BoxDecoration(
                  color: freshColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CallsignText(
                      callsign: spot.activator,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${spot.summitCode} · ${band ?? '?'}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: [
                        SotaAltitudeBadge(
                          altitudeM: spot.altitudeM,
                          altitudeFt: spot.altitudeFt,
                        ),
                        SotaPointsBadge(points: spot.points),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: freshColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
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
        ),
      ),
    );
  }
}
