import 'package:flutter/material.dart';
import 'package:hamqrg/common/widgets/profile/profile_avatar.dart';

class ProfileChip extends StatelessWidget {
  const ProfileChip({required this.imageProfilePath, required this.callSign, super.key});
  final String? imageProfilePath;
  final String? callSign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return // User Profile Button
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageProfilePath: imageProfilePath, size: 24),
          if (callSign != null)
            Text(
              callSign!,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
        ],
      ),
    );
  }
}
