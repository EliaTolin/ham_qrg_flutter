import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';

/// Small colored dot indicating how fresh a SOTA spot is.
/// Identical UX to the POTA freshness indicator (green / amber / muted).
class SotaSpotFreshnessIndicator extends StatelessWidget {
  const SotaSpotFreshnessIndicator({
    required this.spotTime,
    super.key,
  });

  final DateTime spotTime;

  @override
  Widget build(BuildContext context) {
    final age = DateTime.now().difference(spotTime);
    final color = freshnessColor(age, Theme.of(context).colorScheme);

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Human-readable "time ago" formatter for a SOTA spot timestamp.
String sotaSpotTimeAgo(DateTime spotTime) {
  final age = DateTime.now().difference(spotTime);
  if (age.inSeconds < 60) return '${age.inSeconds}s fa';
  if (age.inMinutes < 60) return '${age.inMinutes}m fa';
  if (age.inHours < 24) return '${age.inHours}h fa';
  return '${age.inDays}d fa';
}
