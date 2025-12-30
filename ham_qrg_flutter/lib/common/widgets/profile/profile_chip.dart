import 'package:flutter/material.dart';
import 'package:ham_qrg/common/widgets/profile/profile_avatar.dart';

class ProfileChip extends StatelessWidget {
  const ProfileChip({required this.imageProfileUrl, required this.callSign, super.key});
  final String? imageProfileUrl;
  final String? callSign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return // User Profile Button
        Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageProfileUrl: imageProfileUrl, size: 24),
          const SizedBox(width: 8),
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
