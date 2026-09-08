import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/src/features/sota/domain/sota_spot.dart';
import 'package:hamqrg/src/features/sota/domain/sota_summit.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Hero card at the top of the SOTA spot detail. Designed to feel like a
/// "summit trophy" — altitude is the visual anchor, points tier colors
/// the surrounding accent, and the chase stats (distance, bearing) sit
/// in a compact row below when the user's QTH is known.
///
/// Composition:
///   • Header row: association + region + locator + summit code
///   • Hero: summit name + altitude (large) + points trophy
///   • Chase row: distance + bearing (only if user GPS is granted)
class SummitCard extends StatelessWidget {
  const SummitCard({
    required this.spot,
    required this.summit,
    required this.distanceKm,
    required this.bearingDegrees,
    super.key,
  });

  final SotaSpot spot;
  final SotaSummit? summit;
  final double? distanceKm;
  final double? bearingDegrees;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final altitudeM = summit?.altitudeM ?? spot.altitudeM;
    final altitudeFt = summit?.altitudeFt ?? spot.altitudeFt;
    final points = summit?.points ?? spot.points;
    final summitName = summit?.name ?? spot.summitName;

    final altTone = SotaAltitudeColors.forAltitudeM(altitudeM);
    final pointsTone = SotaPointsColors.forPoints(points);

    final hasChase = distanceKm != null && bearingDegrees != null;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: altTone.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  altTone.withValues(alpha: 0.6),
                  altTone,
                  pointsTone.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AssociationHeader(spot: spot, summit: summit),
                const SizedBox(height: 16),
                _SummitHero(
                  name: summitName,
                  altitudeM: altitudeM,
                  altitudeFt: altitudeFt,
                  altTone: altTone,
                  points: points,
                  pointsTone: pointsTone,
                ),
                if (hasChase) ...[
                  const SizedBox(height: 20),
                  Divider(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    height: 1,
                  ),
                  const SizedBox(height: 16),
                  _ChaseStatsRow(
                    distanceKm: distanceKm!,
                    bearingDegrees: bearingDegrees!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AssociationHeader extends StatelessWidget {
  const _AssociationHeader({required this.spot, this.summit});

  final SotaSpot spot;
  final SotaSummit? summit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final assocName = summit?.associationName ?? '';
    final region = summit?.regionName ?? '';
    final code = spot.summitCode;
    final locator = summit?.locator;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.public, size: 14, color: colorScheme.primary),
              const SizedBox(width: 6),
              Text(
                assocName.isEmpty
                    ? code.split('/').first
                    : '$assocName${region.isNotEmpty ? ' · $region' : ''}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (locator != null && locator.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              locator,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        Text(
          code,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

class _SummitHero extends StatelessWidget {
  const _SummitHero({
    required this.name,
    required this.altitudeM,
    required this.altitudeFt,
    required this.altTone,
    required this.points,
    required this.pointsTone,
  });

  final String name;
  final int altitudeM;
  final int altitudeFt;
  final Color altTone;
  final int points;
  final Color pointsTone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final altitude =
        context.units.summitAltitudeParts(metres: altitudeM, feet: altitudeFt);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.terrain, size: 18, color: altTone),
                  const SizedBox(width: 6),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: altitude.value,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: altTone,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                        TextSpan(
                          text: ' ${altitude.symbol}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: altTone,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              '  ·  ${context.units.summitAltitudeSecondary(metres: altitudeM, feet: altitudeFt)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _PointsTrophy(points: points, tone: pointsTone),
      ],
    );
  }
}

class _PointsTrophy extends StatelessWidget {
  const _PointsTrophy({required this.points, required this.tone});

  final int points;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            tone.withValues(alpha: 0.22),
            tone.withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(color: tone.withValues(alpha: 0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, color: tone, size: 22),
          const SizedBox(height: 2),
          Text(
            l10n.sotaPointsBadge(points),
            style: theme.textTheme.labelMedium?.copyWith(
              color: tone,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChaseStatsRow extends StatelessWidget {
  const _ChaseStatsRow({
    required this.distanceKm,
    required this.bearingDegrees,
  });

  final double distanceKm;
  final double bearingDegrees;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Row(
      children: [
        Expanded(
          child: _ChaseStat(
            icon: Icons.near_me,
            label: l10n.sotaDistance,
            value: context.units.distanceFromKm(distanceKm),
          ),
        ),
        _ChaseDivider(),
        Expanded(
          child: _ChaseStat(
            icon: Icons.explore,
            label: l10n.sotaBearing,
            value: _formatBearing(bearingDegrees),
            iconRotation: bearingDegrees * 3.1415926535 / 180,
          ),
        ),
      ],
    );
  }

  String _formatBearing(double degrees) {
    final intDeg = degrees.round() % 360;
    final compass = _compassFor(intDeg);
    return '$intDeg° $compass';
  }

  String _compassFor(int deg) {
    if (deg < 22 || deg >= 338) return 'N';
    if (deg < 67) return 'NE';
    if (deg < 112) return 'E';
    if (deg < 157) return 'SE';
    if (deg < 202) return 'S';
    if (deg < 247) return 'SW';
    if (deg < 292) return 'W';
    return 'NW';
  }
}

class _ChaseStat extends StatelessWidget {
  const _ChaseStat({
    required this.icon,
    required this.label,
    required this.value,
    this.iconRotation,
  });

  final IconData icon;
  final String label;
  final String value;
  final double? iconRotation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      children: [
        if (iconRotation != null)
          Transform.rotate(
            angle: iconRotation!,
            child: Icon(icon, size: 18, color: colorScheme.primary),
          )
        else
          Icon(icon, size: 18, color: colorScheme.primary),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            letterSpacing: 0.8,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _ChaseDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color:
          Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.4),
    );
  }
}
