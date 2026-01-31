import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';

class ModeFilterChipsHorizontal extends StatelessWidget {
  const ModeFilterChipsHorizontal({
    required this.allLabel,
    required this.selectedModes,
    required this.onModeToggled,
    required this.onAllSelected,
    super.key,
  });

  final String allLabel;
  final Set<AccessMode> selectedModes;
  final ValueChanged<AccessMode> onModeToggled;
  final VoidCallback onAllSelected;

  @override
  Widget build(BuildContext context) {
    final isAllSelected = selectedModes.isEmpty;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          _FilterChip(
            label: allLabel,
            isSelected: isAllSelected,
            onTap: onAllSelected,
            isPrimary: true,
          ),
          const SizedBox(width: 8),
          ...AccessMode.values.map((mode) {
            final isSelected = selectedModes.contains(mode);
            final modeColor = AccessModeHelper.getAccessModeColorObject(mode);

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FilterChip(
                label: AccessModeHelper.getAccessModeLabel(mode),
                isSelected: isSelected,
                onTap: () {
                  // If tapping the only selected chip, reset to "all"
                  if (isSelected && selectedModes.length == 1) {
                    onAllSelected();
                  } else {
                    onModeToggled(mode);
                  }
                },
                color: modeColor,
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
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isPrimary;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final chipColor = color ?? colorScheme.primary;

    final backgroundColor = isSelected
        ? (isPrimary ? colorScheme.primary : chipColor)
        : colorScheme.surfaceContainerHighest;
    final textColor = isSelected
        ? (isPrimary ? colorScheme.onPrimary : Colors.white)
        : (isPrimary ? colorScheme.onSurface : chipColor);
    final borderColor = isSelected ? Colors.transparent : chipColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: textColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
