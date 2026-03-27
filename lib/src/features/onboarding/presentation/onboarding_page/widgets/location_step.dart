import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';

class LocationStep extends StatelessWidget {
  const LocationStep({
    required this.onEnable,
    required this.onSkip,
    super.key,
  });

  final VoidCallback onEnable;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on,
              size: 64,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            l10n.onboardingLocationTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingLocationSubtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onEnable,
              icon: const Icon(Icons.my_location),
              label: Text(l10n.onboardingLocationEnable),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onSkip,
            child: Text(l10n.onboardingLocationSkip),
          ),
        ],
      ),
    );
  }
}
