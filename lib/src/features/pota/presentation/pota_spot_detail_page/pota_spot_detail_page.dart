import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/pota/domain/pota_park.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/pota_spot_detail_controller.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/controller/state/pota_spot_detail_state.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/pota_spot_detail_tablet.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_location_map.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spot_detail_page/widgets/pota_spot_header.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart'
    show spotTimeAgo;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class PotaSpotDetailPage extends HookConsumerWidget {
  const PotaSpotDetailPage({
    @PathParam('spotId') required this.spotId,
    @PathParam('reference') required this.reference,
    super.key,
  });

  final int spotId;
  final String reference;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      potaSpotDetailControllerProvider(spotId, reference),
    );

    return Scaffold(
      body: asyncState.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) {
          log('POTA spot detail error: $error\n$stackTrace');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context)
                      .colorScheme
                      .error
                      .withValues(alpha: 0.6),
                ),
                const SizedBox(height: 16),
                Text(
                  context.localization.potaLoadError,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    potaSpotDetailControllerProvider(spotId, reference),
                  ),
                  child: Text(context.localization.potaRetry),
                ),
              ],
            ),
          );
        },
        data: (state) => ResponsiveLayout(
          mobile: (_) => _PotaSpotDetailMobile(state: state),
          tablet: (_) => PotaSpotDetailTablet(state: state),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// MOBILE — green header, normal theme body
// ═══════════════════════════════════════════════════════════════════════════

class _PotaSpotDetailMobile extends StatelessWidget {
  const _PotaSpotDetailMobile({required this.state});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    final spot = state.spot;
    final park = state.park;

    return CustomScrollView(
      slivers: [
        // ── Grain-gradient hero header ──
        PotaSpotHeader(spot: spot),

        // ── Content body (theme colors) ──
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 16),
              // ── External actions ──
              _ExternalActions(
                activator: spot.activator,
                parkWebsite: park?.website,
              ),

              const SizedBox(height: 16),

              // ── Park card ──
              if (park != null) ...[
                _ParkCard(park: park, distanceKm: state.distanceKm),
                const SizedBox(height: 16),
              ],

              // ── Map ──
              if (park != null &&
                  park.latitude != null &&
                  park.longitude != null) ...[
                _MapSection(park: park),
                const SizedBox(height: 16),
              ],

              // ── Spot info ──
              _SpotInfoSection(state: state),
            ],
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Console-style section label (reusable)
// ═══════════════════════════════════════════════════════════════════════════

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

// ═══════════════════════════════════════════════════════════════════════════
// External action chips
// ═══════════════════════════════════════════════════════════════════════════

class _ExternalActions extends StatelessWidget {
  const _ExternalActions({
    required this.activator,
    this.parkWebsite,
  });

  final String activator;
  final String? parkWebsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _ActionChip(
          icon: Icons.person_search,
          label: l10n.potaOpenQrz,
          onTap: () => _launchUrl(
            context,
            'https://www.qrz.com/db/$activator',
          ),
        ),
        if (parkWebsite != null)
          _ActionChip(
            icon: Icons.language,
            label: l10n.potaParkWebsite,
            onTap: () => _launchUrl(context, parkWebsite!),
          ),
        _ActionChip(
          icon: Icons.open_in_new,
          label: 'POTA',
          onTap: () => _launchUrl(context, 'https://pota.app'),
        ),
      ],
    );
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else if (context.mounted) {
      showErrorSnackbar(context, context.localization.potaQrzError);
    }
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

// ═══════════════════════════════════════════════════════════════════════════
// Park card — identity + 2-column info grid
// ═══════════════════════════════════════════════════════════════════════════

class _ParkCard extends StatelessWidget {
  const _ParkCard({required this.park, this.distanceKm});

  final PotaPark park;
  final double? distanceKm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final tiles = <_InfoTileData>[];

    if (park.parktypeDesc != null) {
      tiles.add(
        _InfoTileData(
          icon: Icons.category,
          label: l10n.potaParkType,
          value: park.parktypeDesc!,
          color: colorScheme.primary,
        ),
      );
    }
    if (park.locationName != null) {
      tiles.add(
        _InfoTileData(
          icon: Icons.place,
          label: l10n.potaLocation,
          value: park.locationName!,
          color: colorScheme.error,
        ),
      );
    }
    if (park.entityName != null) {
      tiles.add(
        _InfoTileData(
          icon: Icons.flag,
          label: l10n.potaCountry,
          value: park.entityName!,
          color: colorScheme.primary,
        ),
      );
    }
    if (distanceKm != null) {
      tiles.add(
        _InfoTileData(
          icon: Icons.straighten,
          label:
              l10n.potaDistanceAway(context.units.distanceFromKm(distanceKm!)),
          value: '',
          color: colorScheme.tertiary,
        ),
      );
    }
    if (park.grid6 != null || park.grid4 != null) {
      tiles.add(
        _InfoTileData(
          icon: Icons.grid_on,
          label: 'Grid',
          value: park.grid6 ?? park.grid4 ?? '',
          color: colorScheme.tertiary,
        ),
      );
    }
    if (park.firstActivator != null) {
      final dateStr = park.firstActivationDate != null
          ? ' (${park.firstActivationDate!})'
          : '';
      tiles.add(
        _InfoTileData(
          icon: Icons.person,
          label: l10n.potaFirstActivation,
          value: '${park.firstActivator!}$dateStr',
          color: colorScheme.secondary,
        ),
      );
    }

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
          // ── Park identity header ──
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
                      'assets/images/pota_logo.png',
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
                        park.reference,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        park.name,
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

          if (tiles.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 24,
                color: colorScheme.outlineVariant.withValues(alpha: 0.25),
              ),
            ),

            // ── 2-column info grid ──
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
              child: _InfoTileGrid(tiles: tiles),
            ),
          ] else
            const SizedBox(height: 14),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 2-column info tile grid
// ═══════════════════════════════════════════════════════════════════════════

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
    final hasValue = data.value.isNotEmpty;

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
                if (hasValue)
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

// ═══════════════════════════════════════════════════════════════════════════
// Map section
// ═══════════════════════════════════════════════════════════════════════════

class _MapSection extends StatelessWidget {
  const _MapSection({required this.park});

  final PotaPark park;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel(icon: Icons.map_outlined, text: 'LOCATION'),
        const SizedBox(height: 10),
        Stack(
          children: [
            PotaLocationMap(park: park, height: 160),
            if (park.latitude != null && park.longitude != null)
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.shadow.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${park.latitude!.toStringAsFixed(4)}, '
                    '${park.longitude!.toStringAsFixed(4)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Spot info section
// ═══════════════════════════════════════════════════════════════════════════

class _SpotInfoSection extends StatelessWidget {
  const _SpotInfoSection({required this.state});

  final PotaSpotDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final spot = state.spot;
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = freshnessColor(age, colorScheme);

    final rows = <_DetailRowData>[
      _DetailRowData(
        icon: Icons.access_time,
        label: l10n.potaLastSpotted,
        value: spotTimeAgo(spot.spotTime),
        accent: freshColor,
      ),
    ];

    if (spot.spotter != null) {
      rows.add(
        _DetailRowData(
          icon: Icons.hearing,
          label: l10n.potaSpotter,
          value: spot.spotter!,
          accent: colorScheme.primary,
        ),
      );
    }
    if (spot.comments != null && spot.comments!.isNotEmpty) {
      rows.add(
        _DetailRowData(
          icon: Icons.chat_bubble_outline,
          label: l10n.potaComments,
          value: spot.comments!,
          accent: colorScheme.tertiary,
        ),
      );
    }
    if (spot.source != null) {
      rows.add(
        _DetailRowData(
          icon: Icons.source,
          label: 'Source',
          value: spot.source!,
          accent: colorScheme.onSurfaceVariant,
        ),
      );
    }

    if (rows.isEmpty) return const SizedBox.shrink();

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
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                data.value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
