import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/callsign_validator.dart';

class SwlCallsignStep extends StatelessWidget {
  const SwlCallsignStep({
    required this.hasCallsign,
    required this.callsign,
    required this.isSubmitting,
    required this.onHasCallsignChanged,
    required this.onCallsignChanged,
    required this.onSubmit,
    required this.onBack,
    super.key,
  });

  final bool? hasCallsign;
  final String callsign;
  final bool isSubmitting;
  final ValueChanged<bool> onHasCallsignChanged;
  final ValueChanged<String> onCallsignChanged;
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  bool get _canSubmit {
    if (hasCallsign == null) return false;
    if (hasCallsign == false) return true;
    return CallsignValidator.isValidSwlCallsign(callsign);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
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
              context.localization.postLoginOnboardingSwlTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: color.onSurface,
                letterSpacing: .2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            // Question
            Text(
              context.localization.postLoginOnboardingSwlQuestion,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: color.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            // Help text
            Text(
              context.localization.postLoginOnboardingSwlHelpText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color.onSurface.withValues(alpha: .7),
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            // Yes option
            _OptionCard(
              isSelected: hasCallsign ?? false,
              onTap: () => onHasCallsignChanged(true),
              icon: Icons.check_circle,
              iconColor: color.primary,
              title: context.localization.postLoginOnboardingSwlYes,
              theme: theme,
              child: (hasCallsign ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.postLoginOnboardingSwlEnterCallsign.toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color.onSurface.withValues(alpha: .6),
                              letterSpacing: 1.2,
                            ),
                          ),
                          const Gap(8),
                          TextField(
                            onChanged: onCallsignChanged,
                            textCapitalization: TextCapitalization.characters,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[A-Za-z0-9]'),
                              ),
                              _UpperCaseTextFormatter(),
                            ],
                            decoration: InputDecoration(
                              hintText: context.localization.postLoginOnboardingSwlCallsignHint,
                              filled: true,
                              fillColor: color.surfaceContainerHighest.withValues(
                                alpha: .5,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
            const Gap(12),
            // No option
            _OptionCard(
              isSelected: hasCallsign == false,
              onTap: () => onHasCallsignChanged(false),
              icon: Icons.cancel,
              iconColor: color.onSurface.withValues(alpha: .5),
              title: context.localization.postLoginOnboardingSwlNo,
              theme: theme,
            ),
            const Gap(32),
            // Submit button
            AnimatedOpacity(
              opacity: _canSubmit ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _canSubmit && !isSubmitting ? onSubmit : null,
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

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.theme,
    this.child,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final String title;
  final ThemeData theme;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final color = theme.colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color.surfaceContainerHighest.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? color.primary : color.onSurface.withValues(alpha: .12),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: iconColor),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? color.primary : color.onSurface.withValues(alpha: .3),
                          width: 2,
                        ),
                        color: isSelected ? color.primary : Colors.transparent,
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.circle,
                              size: 8,
                              color: color.onPrimary,
                            )
                          : null,
                    ),
                  ],
                ),
                if (child != null) child!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpperCaseTextFormatter extends TextInputFormatter {
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
