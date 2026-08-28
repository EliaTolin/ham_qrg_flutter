import 'package:flutter/material.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Normalizes a POTA spot mode string.
/// Returns null if the mode is blank/empty.
String? normalizePotaMode(String? mode) {
  if (mode == null) return null;
  final trimmed = mode.trim();
  return trimmed.isEmpty ? null : trimmed.toUpperCase();
}

/// A badge chip for displaying a POTA spot's radio mode (CW, SSB, FT8, etc).
/// Returns [SizedBox.shrink] if the mode is blank.
class PotaModeBadge extends StatelessWidget {
  const PotaModeBadge({required this.mode, super.key});

  final String mode;

  @override
  Widget build(BuildContext context) {
    final normalized = normalizePotaMode(mode);
    if (normalized == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final tone = SpotModeColors.forMode(normalized);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: tone.withValues(alpha: 0.4)),
      ),
      child: Text(
        normalized,
        style: theme.textTheme.labelSmall?.copyWith(
          color: tone,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
