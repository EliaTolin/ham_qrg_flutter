import 'package:flutter/material.dart';

/// Compact filter chip used by the POTA/SOTA spot lists and maps.
class SpotFilterChip extends StatelessWidget {
  const SpotFilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
        ),
      ),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
      selectedColor: colorScheme.primary,
      backgroundColor: colorScheme.surfaceContainerHighest,
      side: BorderSide(
        color: selected
            ? colorScheme.primary
            : colorScheme.outline.withValues(alpha: 0.3),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
