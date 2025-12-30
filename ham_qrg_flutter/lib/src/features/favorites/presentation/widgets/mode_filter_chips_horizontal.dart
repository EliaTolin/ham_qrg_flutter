import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';

class ModeFilterChipsHorizontal extends StatelessWidget {
  const ModeFilterChipsHorizontal({
    required this.selectedModes,
    required this.onModeToggled,
    required this.onAllSelected,
    super.key,
  });

  final Set<RepeaterMode> selectedModes;
  final ValueChanged<RepeaterMode> onModeToggled;
  final VoidCallback onAllSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final isAllSelected = selectedModes.isEmpty;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          _FilterChip(
            label: l10n.favoritesFilterAllSaved,
            isSelected: isAllSelected,
            onTap: onAllSelected,
            isPrimary: true,
          ),
          const SizedBox(width: 8),
          ...RepeaterMode.values.map((mode) {
            final isSelected = selectedModes.contains(mode);
            final modeColor = RepeaterModeHelper.getModeColorObject(mode);

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FilterChip(
                label: RepeaterModeHelper.getModeLabel(mode, l10n),
                isSelected: isSelected,
                onTap: () => onModeToggled(mode),
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

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? (isPrimary
                  ? colorScheme.surfaceContainerHighest
                  : (color ?? colorScheme.primary).withValues(alpha: 0.2))
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (isPrimary
                    ? colorScheme.outline
                    : (color ?? colorScheme.primary))
                : colorScheme.outline.withValues(alpha: 0.1),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: isSelected
                ? (isPrimary
                    ? colorScheme.onSurface
                    : (color ?? colorScheme.primary))
                : colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


