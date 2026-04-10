import 'package:flutter/material.dart';

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

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        normalized,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.onTertiaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
      ),
    );
  }
}
