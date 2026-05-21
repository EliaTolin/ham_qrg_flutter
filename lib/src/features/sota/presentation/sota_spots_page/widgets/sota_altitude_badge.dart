import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// SOTA summit altitude badge. Color depends on altitude band
/// (<1000 m green, 1000–2000 m amber, ≥2000 m blue).
class SotaAltitudeBadge extends StatelessWidget {
  const SotaAltitudeBadge({required this.altitudeM, super.key});

  final int altitudeM;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tone = SotaAltitudeColors.forAltitudeM(altitudeM);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: tone.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.terrain, size: 12, color: tone),
          const SizedBox(width: 4),
          Text(
            context.localization.sotaAltitudeMeters(altitudeM),
            style: theme.textTheme.labelSmall?.copyWith(
              color: tone,
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
