import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/callsign_validator.dart';

class CallsignEntryStep extends StatelessWidget {
  const CallsignEntryStep({
    required this.callsign,
    required this.isSubmitting,
    required this.onCallsignChanged,
    required this.onSubmit,
    required this.onBack,
    super.key,
  });

  final String callsign;
  final bool isSubmitting;
  final ValueChanged<String> onCallsignChanged;
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    final isValid = CallsignValidator.isValidLicensedCallsign(callsign);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
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
                  Icons.badge,
                  size: 60,
                  color: color.primary,
                ),
              ),
            ),
            const Gap(32),
            // Title
            Text(
              context.localization.postLoginOnboardingCallsignTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: color.primary,
                letterSpacing: .2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            // Subtitle
            Text(
              context.localization.postLoginOnboardingCallsignSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color.onSurface.withValues(alpha: .7),
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            // TextField
            TextField(
              onChanged: onCallsignChanged,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
                UpperCaseTextFormatter(),
              ],
              decoration: InputDecoration(
                labelText: context.localization.postLoginOnboardingCallsignLabel,
                hintText: context.localization.postLoginOnboardingCallsignHint,
                prefixIcon: Icon(Icons.radio, color: color.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: color.primary.withValues(alpha: .4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: color.primary, width: 2),
                ),
              ),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            // Helper text
            Text(
              context.localization.postLoginOnboardingChangeInSettings,
              style: theme.textTheme.bodySmall?.copyWith(
                color: color.onSurface.withValues(alpha: .6),
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            // Submit button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isValid && !isSubmitting ? onSubmit : null,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isSubmitting
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: color.onPrimary,
                        ),
                      )
                    : Text(
                        context.localization.postLoginOnboardingComplete,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: color.onPrimary,
                        ),
                      ),
              ),
            ),
            const Gap(16),
            // Back button
            TextButton.icon(
              onPressed: onBack,
              icon: Icon(Icons.arrow_back, color: color.primary),
              label: Text(
                context.localization.postLoginOnboardingBack,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: color.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
