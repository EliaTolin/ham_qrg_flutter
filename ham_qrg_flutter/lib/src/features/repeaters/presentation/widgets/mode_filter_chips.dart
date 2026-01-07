import 'package:flutter/material.dart';
import 'package:ham_qrg/common/utils/access_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModeFilterChips extends ConsumerWidget {
  const ModeFilterChips({
    required this.selectedModes,
    required this.onModeToggled,
    super.key,
  });

  final Set<AccessMode> selectedModes;
  final ValueChanged<AccessMode> onModeToggled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: AccessMode.values.map((mode) {
            final isSelected = selectedModes.contains(mode);
            final modeColor = AccessModeHelper.getAccessModeColorObject(mode);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                selected: isSelected,
                label: Text(AccessModeHelper.getAccessModeLabel(mode)),
                avatar: CircleAvatar(
                  backgroundColor: modeColor,
                  radius: 8,
                ),
                selectedColor: modeColor.withValues(alpha: 0.2),
                checkmarkColor: modeColor,
                labelStyle: TextStyle(
                  color: isSelected
                      ? modeColor
                      : colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                onSelected: (_) => onModeToggled(mode),
                side: BorderSide(
                  color: isSelected
                      ? modeColor
                      : colorScheme.outline.withValues(alpha: 0.3),
                  width: isSelected ? 1.5 : 1,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
