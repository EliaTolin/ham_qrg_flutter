import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/state/pota_spot_detail_state.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_park_info_section.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:url_launcher/url_launcher.dart';

/// Tablet "Field Station Log" layout for a POTA spot detail.
///
/// Two-pane composition:
/// - Left rail (380px): operator card — activator callsign, live freshness
///   dot, spot info (time, spotter, comments, source), external action
///   buttons (QRZ, POTA, park website).
/// - Right column: park hero + mini map + description + location data.
class PotaSpotDetailTablet extends StatelessWidget {
  const PotaSpotDetailTablet({required this.state, super.key});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final age = DateTime.now().difference(state.spot.spotTime);
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
                child: _OperatorRail(
                  state: state,
                  freshColor: freshColor,
                ),
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
              child: _ParkColumn(state: state),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Left rail — operator card
// ---------------------------------------------------------------------------
class _OperatorRail extends StatelessWidget {
  const _OperatorRail({required this.state, required this.freshColor});

  final PotaSpotDetailState state;
  final Color freshColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final spot = state.spot;
    final band = bandFromFrequencyKhz(spot.frequency);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: colorScheme.onSurface,
              ),
              style: IconButton.styleFrom(
                backgroundColor: colorScheme.surface,
                shape: const CircleBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _ConsoleLabel(text: 'ACTIVATOR'),
          const SizedBox(height: 10),
          Text(
            spot.activator,
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
                spotTimeAgo(spot.spotTime).toUpperCase(),
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
          // Frequency + mode + band chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _InfoChip(
                label: '${spot.frequency} kHz',
                emphasized: true,
              ),
              _InfoChip(label: spot.mode),
              if (band != null) _InfoChip(label: band),
            ],
          ),
          const SizedBox(height: 28),

          // External actions
          const _ConsoleLabel(text: 'EXTERNAL'),
          const SizedBox(height: 12),
          _ActionRow(
            icon: Icons.person_search,
            label: l10n.potaOpenQrz,
            onTap: () => _openQrz(context, spot.activator),
          ),
          if (state.park?.website != null) ...[
            const SizedBox(height: 6),
            _ActionRow(
              icon: Icons.language,
              label: l10n.potaParkWebsite,
              onTap: () => _openUrl(context, state.park!.website!),
            ),
          ],
          const SizedBox(height: 6),
          _ActionRow(
            icon: Icons.open_in_new,
            label: 'POTA.app',
            onTap: () => _openUrl(context, 'https://pota.app'),
          ),

          const SizedBox(height: 28),
          const _ConsoleLabel(text: 'SPOT INFO'),
          const SizedBox(height: 12),
          _DetailLine(
            icon: Icons.access_time,
            label: l10n.potaLastSpotted,
            value: spotTimeAgo(spot.spotTime),
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
          if (spot.source != null) ...[
            const SizedBox(height: 10),
            _DetailLine(
              icon: Icons.source,
              label: 'Source',
              value: spot.source!,
              accent: colorScheme.onSurfaceVariant,
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
      showErrorSnackbar(context, context.localization.potaQrzError);
    }
  }
}

// ---------------------------------------------------------------------------
// Right column — park info
// ---------------------------------------------------------------------------
class _ParkColumn extends StatelessWidget {
  const _ParkColumn({required this.state});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _ConsoleLabel(text: 'PARK'),
          const SizedBox(height: 16),
          if (state.park != null)
            PotaParkInfoSection(
              park: state.park!,
              distanceKm: state.distanceKm,
            )
          else
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color:
                      theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.park_outlined,
                      size: 48,
                      color: theme.colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.4),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '// ${state.spot.reference}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontFamily: 'monospace',
                        letterSpacing: 1.4,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.spot.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.potaLoadError,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}


// ---------------------------------------------------------------------------
// Console primitives
// ---------------------------------------------------------------------------
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
