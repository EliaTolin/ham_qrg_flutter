import 'package:flutter/material.dart';

/// Normalizes a SOTA spot mode string.
/// Returns null if the mode is blank/empty.
String? normalizeSotaMode(String? mode) {
  if (mode == null) return null;
  final trimmed = mode.trim();
  return trimmed.isEmpty ? null : trimmed.toUpperCase();
}

/// A badge chip for displaying a SOTA spot's radio mode (CW, SSB, FT8, etc).
/// Returns [SizedBox.shrink] if the mode is blank.
class SotaModeBadge extends StatelessWidget {
  const SotaModeBadge({required this.mode, super.key});

  final String mode;

  @override
  Widget build(BuildContext context) {
    final normalized = normalizeSotaMode(mode);
    if (normalized == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        normalized,
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onTertiaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
