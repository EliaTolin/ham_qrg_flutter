import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/common/widgets/label/callsign_text.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/sota/data/mappers/sota_mappers.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/widgets/sota_location_map.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/widgets/summit_restrictions_banner.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_freshness_indicator.dart';
import 'package:hamqrg/src/features/sota/presentation/widgets/sota_mode_badge.dart';
import 'package:url_launcher/url_launcher.dart';

/// Tablet "Field Station Log" layout for a SOTA spot detail.
///
/// Mirrors the POTA tablet composition: an operator rail on the left and
/// summit/location content on the right.
class SotaSpotDetailTablet extends StatelessWidget {
  const SotaSpotDetailTablet({
    required this.state,
    required this.onRetrySummit,
    super.key,
  });

  final SotaSpotDetailState state;
  final VoidCallback onRetrySummit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final age = DateTime.now().difference(state.spot.timestamp);
    final freshColor = freshnessColor(age, theme.colorScheme);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 400,
              child: ColoredBox(
                color: theme.colorScheme.surfaceContainerLowest,
                child: _OperatorRail(state: state, freshColor: freshColor),
              ),
            ),
            Container(
              width: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    freshColor.withValues(alpha: 0.8),
                    freshColor.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _SummitColumn(state: state, onRetrySummit: onRetrySummit),
            ),
          ],
        ),
      ),
    );
  }
}

class _OperatorRail extends StatelessWidget {
  const _OperatorRail({required this.state, required this.freshColor});

  final SotaSpotDetailState state;
  final Color freshColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final spot = state.spot;
    final band = bandFromFrequencyMhz(spot.frequencyMhz);
    final mode = normalizeSotaMode(spot.mode);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
              style: IconButton.styleFrom(
                backgroundColor: colorScheme.surface,
                shape: const CircleBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _ConsoleLabel(text: 'ACTIVATOR'),
          const SizedBox(height: 10),
          CallsignText(
            callsign: spot.activator,
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _PulsingFreshnessDot(color: freshColor),
              const SizedBox(width: 8),
              Text(
                sotaSpotTimeAgo(spot.timestamp).toUpperCase(),
                style: theme.textTheme.labelMedium?.copyWith(
                  fontFamily: 'monospace',
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                  color: freshColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _InfoChip(
                label: '${spot.frequencyMhz.toStringAsFixed(3)} MHz',
                emphasized: true,
              ),
              if (mode != null) _InfoChip(label: mode),
              if (band != null) _InfoChip(label: band),
            ],
          ),
          const SizedBox(height: 28),
          const _ConsoleLabel(text: 'EXTERNAL'),
          const SizedBox(height: 12),
          _ActionRow(
            icon: Icons.person_search,
            label: l10n.potaOpenQrz,
            onTap: () => _openQrz(context, spot.activator),
          ),
          const SizedBox(height: 6),
          _ActionRow(
            icon: Icons.open_in_new,
            label: 'SOTA',
            onTap: () => _openUrl(
              context,
              'https://summits.sota.org.uk/summit/${spot.summitCode}',
            ),
          ),
          const SizedBox(height: 28),
          const _ConsoleLabel(text: 'SPOT INFO'),
          const SizedBox(height: 12),
          _DetailLine(
            icon: Icons.access_time,
            label: l10n.potaLastSpotted,
            value: sotaSpotTimeAgo(spot.timestamp),
            accent: freshColor,
          ),
          if (spot.spotter != null) ...[
            const SizedBox(height: 10),
            _DetailLine(
              icon: Icons.hearing,
              label: l10n.potaSpotter,
              value: spot.spotter!,
              accent: colorScheme.primary,
            ),
          ],
          if (spot.comments != null && spot.comments!.isNotEmpty) ...[
            const SizedBox(height: 10),
            _DetailLine(
              icon: Icons.chat_bubble_outline,
              label: l10n.potaComments,
              value: spot.comments!,
              accent: colorScheme.tertiary,
            ),
          ],
          if (spot.type == SotaSpotType.qrt) ...[
            const SizedBox(height: 10),
            _DetailLine(
              icon: Icons.do_not_disturb_on,
              label: l10n.sotaSpotInfo,
              value: l10n.sotaSpotQrt,
              accent: colorScheme.error,
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openQrz(BuildContext context, String callsign) async {
    final uri = Uri.parse('https://www.qrz.com/db/$callsign');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.potaQrzError);
    }
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.sotaLoadError);
    }
  }
}

class _SummitColumn extends StatelessWidget {
  const _SummitColumn({required this.state, required this.onRetrySummit});

  final SotaSpotDetailState state;
  final VoidCallback onRetrySummit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _ConsoleLabel(text: 'SUMMIT'),
          const SizedBox(height: 16),
          if (state.summit != null)
            _SummitContent(
              spot: state.spot,
              summit: state.summit!,
              distanceKm: state.distanceKm,
              bearingDegrees: state.bearingDegrees,
            )
          else
            _SummitPlaceholder(
              spot: state.spot,
              isLoading: state.summitLoading,
              hasError: state.summitError,
              onRetry: onRetrySummit,
            ),
        ],
      ),
    );
  }
}

class _SummitContent extends StatelessWidget {
  const _SummitContent({
    required this.spot,
    required this.summit,
    required this.distanceKm,
    required this.bearingDegrees,
  });

  final SotaSpot spot;
  final SotaSummit summit;
  final double? distanceKm;
  final double? bearingDegrees;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SummitHeroCard(
          spot: spot,
          summit: summit,
          distanceKm: distanceKm,
          bearingDegrees: bearingDegrees,
        ),
        if (summit.hasRestrictions || !summit.valid) ...[
          const SizedBox(height: 12),
          SummitRestrictionsBanner(summit: summit),
        ],
        const SizedBox(height: 18),
        const _ConsoleLabel(text: 'LOCATION'),
        const SizedBox(height: 10),
        SotaLocationMap(summit: summit, height: 220),
        const SizedBox(height: 18),
        const _ConsoleLabel(text: 'DETAILS'),
        const SizedBox(height: 10),
        _SummitDetailsGrid(
          summit: summit,
          distanceKm: distanceKm,
          bearingDegrees: bearingDegrees,
        ),
      ],
    );
  }
}

class _SummitHeroCard extends StatelessWidget {
  const _SummitHeroCard({
    required this.spot,
    required this.summit,
    required this.distanceKm,
    required this.bearingDegrees,
  });

  final SotaSpot spot;
  final SotaSummit summit;
  final double? distanceKm;
  final double? bearingDegrees;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final altitude = context.units.summitAltitudeParts(
      metres: summit.altitudeM,
      feet: summit.altitudeFt,
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              gradient: LinearGradient(
                colors: [
                  colorScheme.tertiary.withValues(alpha: 0.65),
                  colorScheme.primary,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/sota_logo.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            spot.summitCode,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        summit.name,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: altitude.value,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: colorScheme.tertiary,
                                fontWeight: FontWeight.w900,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: ' ${altitude.symbol}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: colorScheme.tertiary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '  ·  ${context.units.summitAltitudeSecondary(metres: summit.altitudeM, feet: summit.altitudeFt)}',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                _PointsBadge(points: summit.points),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummitDetailsGrid extends StatelessWidget {
  const _SummitDetailsGrid({
    required this.summit,
    required this.distanceKm,
    required this.bearingDegrees,
  });

  final SotaSummit summit;
  final double? distanceKm;
  final double? bearingDegrees;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final colorScheme = Theme.of(context).colorScheme;
    final tiles = [
      _InfoTileData(
        icon: Icons.terrain,
        label: context.units.summitAltitude(
          metres: summit.altitudeM,
          feet: summit.altitudeFt,
        ),
        value: context.units.summitAltitudeSecondary(
          metres: summit.altitudeM,
          feet: summit.altitudeFt,
        ),
        color: colorScheme.primary,
      ),
      _InfoTileData(
        icon: Icons.emoji_events,
        label: l10n.sotaPointsTitle,
        value: l10n.sotaPointsBadge(summit.points),
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
      _InfoTileData(
        icon: Icons.grid_on,
        label: l10n.sotaLocator,
        value: summit.locator,
        color: colorScheme.primary,
      ),
      _InfoTileData(
        icon: Icons.place,
        label: l10n.sotaRegion,
        value: summit.regionName,
        color: colorScheme.error,
      ),
      _InfoTileData(
        icon: Icons.flag,
        label: l10n.sotaAssociation,
        value: summit.associationName,
        color: colorScheme.primary,
      ),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final tile in tiles)
          SizedBox(width: 220, child: _InfoTile(data: tile)),
      ],
    );
  }
}

class _SummitPlaceholder extends StatelessWidget {
  const _SummitPlaceholder({
    required this.spot,
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
  });

  final SotaSpot spot;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              const CircularProgressIndicator.adaptive()
            else
              Icon(
                Icons.terrain,
                size: 48,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              ),
            const SizedBox(height: 12),
            Text(
              '// ${spot.summitCode}',
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'monospace',
                letterSpacing: 1.4,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              spot.summitName,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (hasError) ...[
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(context.localization.sotaRetry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConsoleLabel extends StatelessWidget {
  const _ConsoleLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          text,
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
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, this.emphasized = false});

  final String label;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: emphasized
            ? colorScheme.primaryContainer
            : colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          fontFamily: 'monospace',
          fontWeight: FontWeight.w700,
          fontFeatures: const [FontFeature.tabularFigures()],
          color: emphasized
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: colorScheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 18,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.icon,
    required this.label,
    required this.value,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accent;

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
            color: accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: accent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  fontFamily: 'monospace',
                  letterSpacing: 1,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PulsingFreshnessDot extends StatefulWidget {
  const _PulsingFreshnessDot({required this.color});

  final Color color;

  @override
  State<_PulsingFreshnessDot> createState() => _PulsingFreshnessDotState();
}

class _PulsingFreshnessDotState extends State<_PulsingFreshnessDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return SizedBox(
          width: 14,
          height: 14,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.2 * (1 - t)),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.5),
                      blurRadius: 3 + 3 * t,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PointsBadge extends StatelessWidget {
  const _PointsBadge({required this.points});

  final int points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 116,
      height: 116,
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.55),
        shape: BoxShape.circle,
        border: Border.all(color: colorScheme.tertiary.withValues(alpha: 0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, color: colorScheme.tertiary, size: 30),
          const SizedBox(height: 8),
          Text(
            '$points pt',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.tertiary,
              fontWeight: FontWeight.w900,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
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

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.data});

  final _InfoTileData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: data.color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(data.icon, size: 15, color: data.color),
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
                    fontSize: 10,
                  ),
                ),
                Text(
                  data.value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
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
