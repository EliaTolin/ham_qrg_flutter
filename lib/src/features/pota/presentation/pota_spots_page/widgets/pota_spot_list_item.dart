import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/common/widgets/label/callsign_text.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart';
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart';

class PotaSpotListItem extends StatelessWidget {
  const PotaSpotListItem({
    required this.spot,
    this.distanceKm,
    super.key,
  });

  final PotaSpot spot;
  final double? distanceKm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;
    final band = bandFromFrequencyKhz(spot.frequency);
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = freshnessColor(age, colorScheme);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.router.push(
          PotaSpotDetailRoute(
            spotId: spot.spotId,
            reference: spot.reference,
          ),
        ),
        child: Container(
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
                        // Row 3: Park name + reference + distance
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/pota_logo.png',
                              width: 16,
                              height: 16,
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
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        // Row 4: Distance (if available)
                        if (distanceKm != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.near_me,
                                size: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                l10n.potaDistanceAway(
                                  context.units.distanceFromKm(distanceKm!),
                                ),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
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
      ),
    );
  }
}
