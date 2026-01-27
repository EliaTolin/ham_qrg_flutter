import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

class MapAccessModeFilterChips extends StatelessWidget {
  const MapAccessModeFilterChips({
    required this.selectedModes,
    required this.onModeToggled,
    this.onClearAll,
    super.key,
  });

  final Set<AccessMode> selectedModes;
  final ValueChanged<AccessMode> onModeToggled;

  /// Optional callback to clear all selected modes at once.
  /// If not provided, the widget will toggle each mode individually.
  final VoidCallback? onClearAll;

  @override
  Widget build(BuildContext context) {
    // Common access modes to show in filters
    const commonModes = AccessMode.values;

    final isAllSelected = selectedModes.isEmpty;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // All button
          _FilterChip(
            label: 'All',
            isSelected: isAllSelected,
            onTap: () {
              if (selectedModes.isEmpty) return;

              // Use onClearAll if provided, otherwise this won't work properly
              // with async state updates
              onClearAll?.call();
            },
            isPrimary: true,
          ),
          const SizedBox(width: 8),
          // Mode buttons
          ...commonModes.map((mode) {
            final isSelected = selectedModes.contains(mode);
            final modeColor = AccessModeHelper.getAccessModeColorObject(mode);
            final icon = AccessModeHelper.getAccessModeIcon(mode);

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FilterChip(
                label: AccessModeHelper.getAccessModeLabel(mode),
                isSelected: isSelected,
                onTap: () => onModeToggled(mode),
                color: modeColor,
                icon: icon,
                showDot: !isSelected,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isPrimary = false,
    this.color,
    this.icon,
    this.showDot = false,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isPrimary;
  final Color? color;
  final IconData? icon;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor = isSelected
        ? (isPrimary ? colorScheme.primary : (color ?? colorScheme.primary))
        : colorScheme.surface;
    final textColor = isSelected
        ? (isPrimary ? colorScheme.onPrimary : Colors.white)
        : (color ?? colorScheme.onSurface);
    final borderColor = isSelected ? Colors.transparent : (color ?? colorScheme.outline);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && isSelected) ...[
              Icon(
                icon,
                size: 18,
                color: textColor,
              ),
              const SizedBox(width: 6),
            ],
            if (showDot && !isSelected && color != null) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
