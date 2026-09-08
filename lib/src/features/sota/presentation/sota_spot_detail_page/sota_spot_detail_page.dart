import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/common/widgets/label/callsign_text.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/controller/sota_spot_detail_controller.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_tablet.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/widgets/sota_location_map.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/widgets/summit_restrictions_banner.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_freshness_indicator.dart';
import 'package:hamqrg/src/features/sota/presentation/widgets/sota_mode_badge.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SotaSpotDetailPage extends ConsumerWidget {
  const SotaSpotDetailPage({
    @PathParam('spotId') required this.spotId,
    @PathParam('summitCode') required this.summitCode,
    super.key,
  });

  final int spotId;
  final String summitCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      sotaSpotDetailControllerProvider(spotId, summitCode),
    );
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Scaffold(
      body: asyncState.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) {
          log('SOTA detail error: $error\n$stackTrace');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: colorScheme.error.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.sotaLoadError,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    sotaSpotDetailControllerProvider(spotId, summitCode),
                  ),
                  child: Text(l10n.sotaRetry),
                ),
              ],
            ),
          );
        },
        data: (state) {
          final notifier = ref.read(
            sotaSpotDetailControllerProvider(spotId, summitCode).notifier,
          );
          return ResponsiveLayout(
            mobile: (_) => SotaSpotDetailMobile(
              state: state,
              onRetrySummit: notifier.retrySummit,
            ),
            tablet: (_) => SotaSpotDetailTablet(
              state: state,
              onRetrySummit: notifier.retrySummit,
            ),
          );
        },
      ),
    );
  }
}

class SotaSpotDetailMobile extends StatelessWidget {
  const SotaSpotDetailMobile({
    required this.state,
    required this.onRetrySummit,
    super.key,
  });

  final SotaSpotDetailState state;
  final VoidCallback onRetrySummit;

  @override
  Widget build(BuildContext context) {
    final spot = state.spot;
    final summit = state.summit;

    return CustomScrollView(
      slivers: [
        _SotaSpotHeader(spot: spot),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 16),
              _ExternalActions(spot: spot),
              const SizedBox(height: 16),
              _SummitInfoCard(
                spot: spot,
                summit: summit,
                distanceKm: state.distanceKm,
                bearingDegrees: state.bearingDegrees,
              ),
              const SizedBox(height: 16),
              _MapSection(
                summit: summit,
                isLoading: state.summitLoading,
                hasError: state.summitError,
                onRetry: onRetrySummit,
              ),
              if (summit != null &&
                  (summit.hasRestrictions || !summit.valid)) ...[
                const SizedBox(height: 16),
                SummitRestrictionsBanner(summit: summit),
              ],
              const SizedBox(height: 16),
              _SpotInfoSection(spot: spot),
            ],
          ),
        ),
      ],
    );
  }
}

class _SotaSpotHeader extends StatelessWidget {
  const _SotaSpotHeader({required this.spot});

  final SotaSpot spot;

  void _copyFrequency(BuildContext context, SotaSpot spot) {
    Clipboard.setData(
      ClipboardData(text: spot.frequencyMhz.toStringAsFixed(3)),
    );
    final l10n = context.localization;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.sotaCopiedToClipboard),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldBg = theme.scaffoldBackgroundColor;
    final age = DateTime.now().difference(spot.timestamp);
    final freshColor = freshnessColor(age, theme.colorScheme);
    final band = bandFromFrequencyMhz(spot.frequencyMhz);
    final mode = normalizeSotaMode(spot.mode);

    final screenHeight = MediaQuery.sizeOf(context).height;
    final expandedHeight = screenHeight < 700 ? 220.0 : 280.0;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      leading: IconButton(
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          tooltip: context.localization.sotaCopyFrequency,
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.copy, color: Colors.white),
          ),
          onPressed: () => _copyFrequency(context, spot),
        ),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _SotaGrainGradientPainter(scaffoldBg: scaffoldBg),
              ),
            ),
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.3],
                    colors: [
                      Colors.black.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: 30,
              child: Opacity(
                opacity: 0.08,
                child: Image.asset(
                  'assets/images/sota_logo.png',
                  width: 220,
                  height: 220,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, scaffoldBg],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  screenHeight < 700 ? 8 : 48,
                  20,
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/sota_logo.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        _FreshnessBadge(
                          spotTime: spot.timestamp,
                          color: freshColor,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            spot.summitCode,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: CallsignText(
                        callsign: spot.activator,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      spot.summitName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.92),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: screenHeight < 700 ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    _VfoFrequencyRow(
                      frequencyMhz: spot.frequencyMhz,
                      band: band,
                      mode: mode,
                    ),
                    const SizedBox(height: 14),
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

class _ExternalActions extends StatelessWidget {
  const _ExternalActions({required this.spot});

  final SotaSpot spot;

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.sotaLoadError);
    }
  }

  void _copyFrequency(BuildContext context) {
    Clipboard.setData(
      ClipboardData(text: spot.frequencyMhz.toStringAsFixed(3)),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.localization.sotaCopiedToClipboard),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _ActionChip(
          icon: Icons.person_search,
          label: context.localization.potaOpenQrz,
          onTap: () => _launchUrl(
            context,
            'https://www.qrz.com/db/${spot.activator}',
          ),
        ),
        _ActionChip(
          icon: Icons.open_in_new,
          label: 'SOTA',
          onTap: () => _launchUrl(
            context,
            'https://summits.sota.org.uk/summit/${spot.summitCode}',
          ),
        ),
        _ActionChip(
          icon: Icons.copy,
          label: context.localization.sotaCopyFrequency,
          onTap: () => _copyFrequency(context),
        ),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: colorScheme.primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                size: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummitInfoCard extends StatelessWidget {
  const _SummitInfoCard({
    required this.spot,
    this.summit,
    this.distanceKm,
    this.bearingDegrees,
  });

  final SotaSpot spot;
  final SotaSummit? summit;
  final double? distanceKm;
  final double? bearingDegrees;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final summitName = summit?.name ?? spot.summitName;
    final altitudeM = summit?.altitudeM ?? spot.altitudeM;
    final altitudeFt = summit?.altitudeFt ?? spot.altitudeFt;
    final points = summit?.points ?? spot.points;
    final locator = summit?.locator;
    final region = summit?.regionName;
    final association = summit?.associationName;

    final tiles = <_InfoTileData>[
      _InfoTileData(
        icon: Icons.terrain,
        label:
            context.units.summitAltitude(metres: altitudeM, feet: altitudeFt),
        value: context.units
            .summitAltitudeSecondary(metres: altitudeM, feet: altitudeFt),
        color: colorScheme.primary,
      ),
      _InfoTileData(
        icon: Icons.emoji_events,
        label: l10n.sotaPointsTitle,
        value: l10n.sotaPointsBadge(points),
        color: colorScheme.tertiary,
      ),
      if (distanceKm != null)
        _InfoTileData(
          icon: Icons.straighten,
          label: l10n.sotaDistance,
          value: context.units.distanceFromKm(distanceKm!),
          color: colorScheme.tertiary,
        ),
      if (bearingDegrees != null)
        _InfoTileData(
          icon: Icons.explore,
          label: l10n.sotaBearing,
          value: '${bearingDegrees!.round()}°',
          color: colorScheme.secondary,
        ),
      if (locator != null && locator.isNotEmpty)
        _InfoTileData(
          icon: Icons.grid_on,
          label: l10n.sotaLocator,
          value: locator,
          color: colorScheme.primary,
        ),
      if (region != null && region.isNotEmpty)
        _InfoTileData(
          icon: Icons.place,
          label: l10n.sotaRegion,
          value: region,
          color: colorScheme.error,
        ),
      if (association != null && association.isNotEmpty)
        _InfoTileData(
          icon: Icons.flag,
          label: l10n.sotaAssociation,
          value: association,
          color: colorScheme.primary,
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/sota_logo.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spot.summitCode,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        summitName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 24,
              color: colorScheme.outlineVariant.withValues(alpha: 0.25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
            child: _InfoTileGrid(tiles: tiles),
          ),
        ],
      ),
    );
  }
}

class _MapSection extends StatelessWidget {
  const _MapSection({
    required this.summit,
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
  });

  final SotaSummit? summit;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final loadedSummit = summit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel(icon: Icons.map_outlined, text: 'LOCATION'),
        const SizedBox(height: 12),
        if (loadedSummit == null)
          _MapPlaceholder(
            isLoading: isLoading,
            hasError: hasError,
            onRetry: onRetry,
          )
        else
          SotaLocationMap(summit: loadedSummit, height: 168),
      ],
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder({
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
  });

  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 168,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 32,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hasError
                        ? 'Posizione monte non caricata'
                        : 'Posizione monte non disponibile',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (hasError) ...[
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh, size: 16),
                      label: Text(context.localization.retry),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

class _SpotInfoSection extends StatelessWidget {
  const _SpotInfoSection({required this.spot});

  final SotaSpot spot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final age = DateTime.now().difference(spot.timestamp);
    final freshColor = freshnessColor(age, colorScheme);

    final rows = <_DetailRowData>[
      _DetailRowData(
        icon: Icons.access_time,
        label: l10n.potaLastSpotted,
        value: sotaSpotTimeAgo(spot.timestamp),
        accent: freshColor,
      ),
      if (spot.spotter != null)
        _DetailRowData(
          icon: Icons.hearing,
          label: l10n.potaSpotter,
          value: spot.spotter!,
          accent: colorScheme.primary,
        ),
      if (spot.comments != null && spot.comments!.isNotEmpty)
        _DetailRowData(
          icon: Icons.chat_bubble_outline,
          label: l10n.potaComments,
          value: spot.comments!,
          accent: colorScheme.tertiary,
        ),
      if (spot.type == SotaSpotType.qrt)
        _DetailRowData(
          icon: Icons.do_not_disturb_on,
          label: l10n.sotaSpotInfo,
          value: l10n.sotaSpotQrt,
          accent: colorScheme.error,
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel(icon: Icons.info_outline, text: 'SPOT INFO'),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              for (var i = 0; i < rows.length; i++) ...[
                if (i > 0)
                  Divider(
                    height: 18,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                  ),
                _DetailRow(data: rows[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 6),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}

class _InfoTileData {
  const _InfoTileData({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
}

class _InfoTileGrid extends StatelessWidget {
  const _InfoTileGrid({required this.tiles});

  final List<_InfoTileData> tiles;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < tiles.length; i += 2) {
      final hasSecond = i + 1 < tiles.length;
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _InfoTile(data: tiles[i])),
            if (hasSecond) ...[
              const SizedBox(width: 8),
              Expanded(child: _InfoTile(data: tiles[i + 1])),
            ] else
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          rows[i],
        ],
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.data});

  final _InfoTileData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: data.color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(data.icon, size: 14, color: data.color),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
                Text(
                  data.value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRowData {
  const _DetailRowData({
    required this.icon,
    required this.label,
    required this.value,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accent;
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.data});

  final _DetailRowData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: data.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(data.icon, size: 15, color: data.accent),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                data.value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FreshnessBadge extends StatefulWidget {
  const _FreshnessBadge({required this.spotTime, required this.color});

  final DateTime spotTime;
  final Color color;

  @override
  State<_FreshnessBadge> createState() => _FreshnessBadgeState();
}

class _FreshnessBadgeState extends State<_FreshnessBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, _) {
        final t = _pulse.value;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.15 + 0.05 * t),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.color.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.5 * t),
                      blurRadius: 4 + 3 * t,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                sotaSpotTimeAgo(widget.spotTime),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: widget.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VfoFrequencyRow extends StatelessWidget {
  const _VfoFrequencyRow({
    required this.frequencyMhz,
    this.band,
    this.mode,
  });

  final double frequencyMhz;
  final String? band;
  final String? mode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.radio,
            size: 16,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          const SizedBox(width: 8),
          Text(
            '${frequencyMhz.toStringAsFixed(3)} MHz',
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          if (band != null) ...[
            _HeaderChip(label: band!),
            const SizedBox(width: 6),
          ],
          if (mode != null) _HeaderChip(label: mode!),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
      ),
    );
  }
}

class _SotaGrainGradientPainter extends CustomPainter {
  _SotaGrainGradientPainter({required this.scaffoldBg});

  final Color scaffoldBg;

  static const _colors = [
    (alignment: Alignment(-0.8, -0.7), color: Color(0xFF083D1A)),
    (alignment: Alignment(0.6, -0.4), color: Color(0xFF0F5A2E)),
    (alignment: Alignment(-0.2, 0.1), color: Color(0xFF14693A)),
    (alignment: Alignment(0.9, 0), color: Color(0xFF0C4D24)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..color = const Color(0xFF062B12));

    for (final blob in _colors) {
      final gradient = RadialGradient(
        center: blob.alignment,
        radius: 0.95,
        colors: [
          blob.color.withValues(alpha: 0.7),
          blob.color.withValues(alpha: 0.30),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      );
      canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
    }

    _paintTopoContours(canvas, size);

    final random = math.Random(42);
    final grainPaint = Paint();
    final grainCount = (size.width * size.height ~/ 28).clamp(0, 4500);

    for (var i = 0; i < grainCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final isLight = random.nextBool();

      grainPaint.color = isLight
          ? Colors.white.withValues(alpha: random.nextDouble() * 0.07)
          : Colors.black.withValues(alpha: random.nextDouble() * 0.06);

      canvas.drawCircle(Offset(x, y), 0.6, grainPaint);
    }
  }

  void _paintTopoContours(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = Colors.white.withValues(alpha: 0.06);

    final center = Offset(size.width * 0.75, size.height * 0.3);
    for (var i = 1; i <= 8; i++) {
      final rx = 30.0 + i * 28;
      final ry = 20.0 + i * 20;
      canvas.drawOval(
        Rect.fromCenter(center: center, width: rx * 2, height: ry * 2),
        paint,
      );
    }

    final center2 = Offset(size.width * 0.15, size.height * 0.75);
    for (var i = 1; i <= 5; i++) {
      final rx = 20.0 + i * 22;
      final ry = 15.0 + i * 16;
      canvas.drawOval(
        Rect.fromCenter(center: center2, width: rx * 2, height: ry * 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SotaGrainGradientPainter oldDelegate) =>
      scaffoldBg != oldDelegate.scaffoldBg;
}
