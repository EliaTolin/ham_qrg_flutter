import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';

class UserTypeSelectionStep extends StatelessWidget {
  const UserTypeSelectionStep({
    required this.onLicensedSelected,
    required this.onListenerSelected,
    this.isSubmitting = false,
    super.key,
  });

  final VoidCallback onLicensedSelected;
  final VoidCallback onListenerSelected;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with animation effect
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    color.primary.withValues(alpha: .15),
                    color.primary.withValues(alpha: .05),
                    Colors.transparent,
                  ],
                  radius: .9,
                ),
                border: Border.all(color: color.primary.withValues(alpha: .2)),
              ),
              child: Center(
                child: Icon(
                  Icons.sensors,
                  size: 60,
                  color: color.primary,
                ),
              ),
            ),
            const Gap(32),
            // Title
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: color.onSurface,
                  letterSpacing: .2,
                ),
                children: [
                  TextSpan(
                    text: context.localization.postLoginOnboardingWelcome,
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Ham',
                    style: TextStyle(color: color.primary),
                  ),
                  const TextSpan(
                    text: 'QRG',
                  ),
                ],
              ),
            ),
            const Gap(32),
            // Question
            Text(
              context.localization.postLoginOnboardingQuestion,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: color.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            // Help text
            Text(
              context.localization.postLoginOnboardingHelpText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color.onSurface.withValues(alpha: .7),
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(40),
            // Licensed button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: isSubmitting ? null : onLicensedSelected,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.badge),
                label: Text(
                  context.localization.postLoginOnboardingYesLicensed,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: color.onPrimary,
                  ),
                ),
              ),
            ),
            const Gap(16),
            // Listener button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: isSubmitting ? null : onListenerSelected,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: color.primary.withValues(alpha: .6)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: isSubmitting
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: color.primary,
                        ),
                      )
                    : Icon(Icons.headphones, color: color.primary),
                label: Text(
                  context.localization.postLoginOnboardingNoListener,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: color.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
