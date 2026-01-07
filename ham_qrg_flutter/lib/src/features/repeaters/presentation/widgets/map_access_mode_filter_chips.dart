import 'package:flutter/material.dart';
import 'package:ham_qrg/common/utils/access_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';

class MapAccessModeFilterChips extends StatelessWidget {
  const MapAccessModeFilterChips({
    required this.selectedModes,
    required this.onModeToggled,
    super.key,
  });

  final Set<AccessMode> selectedModes;
  final ValueChanged<AccessMode> onModeToggled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              // Clear all selections
              for (final mode in selectedModes.toList()) {
                onModeToggled(mode);
              }
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

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (isPrimary
                  ? colorScheme.primary
                  : (color ?? colorScheme.primary).withValues(alpha: 0.2))
              : colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (isPrimary ? Colors.transparent : (color ?? colorScheme.primary))
                : (color ?? colorScheme.outline).withValues(alpha: 0.3),
            width: isSelected ? 0 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: (color ?? colorScheme.primary).withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && isSelected) ...[
              Icon(
                icon,
                size: 18,
                color: isPrimary ? colorScheme.onPrimary : (color ?? colorScheme.primary),
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
                color: isSelected
                    ? (isPrimary ? colorScheme.onPrimary : (color ?? colorScheme.primary))
                    : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
