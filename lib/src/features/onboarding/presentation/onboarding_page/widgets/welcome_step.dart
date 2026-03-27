import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeStep extends StatelessWidget {
  const WelcomeStep({
    required this.pageController,
    required this.currentIndex,
    required this.onFinish,
    required this.onSkip,
    super.key,
  });

  final PageController pageController;
  final int currentIndex;
  final VoidCallback onFinish;
  final VoidCallback onSkip;

  static const _totalCards = 4;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        // Skip button
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: TextButton(
              onPressed: onSkip,
              child: Text(l10n.onboardingSkip),
            ),
          ),
        ),
        // Cards
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              _WelcomeCard(
                icon: Icons.cell_tower,
                iconColor: colorScheme.primary,
                title: l10n.onboardingWelcomeTitle1,
                subtitle: l10n.onboardingWelcomeSubtitle1,
                footer: _Iz8wnhCredits(context: context),
              ),
              _WelcomeCard(
                icon: Icons.tune,
                iconColor: colorScheme.tertiary,
                title: l10n.onboardingWelcomeTitle2,
                subtitle: l10n.onboardingWelcomeSubtitle2,
                footer: const _ModeChips(),
              ),
              _WelcomeCard(
                icon: Icons.park,
                iconColor: Colors.green,
                title: l10n.onboardingWelcomeTitle3,
                subtitle: l10n.onboardingWelcomeSubtitle3,
              ),
              _WelcomeCard(
                icon: Icons.favorite,
                iconColor: Colors.redAccent,
                title: l10n.onboardingWelcomeTitle4,
                subtitle: l10n.onboardingWelcomeSubtitle4,
              ),
            ],
          ),
        ),
        // Dots + button
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              // Page dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _totalCards,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? colorScheme.primary
                          : colorScheme.onSurface.withValues(alpha: .20),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Next / Get Started button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (currentIndex < _totalCards - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        onFinish();
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      currentIndex < _totalCards - 1
                          ? l10n.onboardingNext
                          : l10n.onboardingGetStarted,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.footer,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
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
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 64, color: iconColor),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          if (footer != null) ...[
            const SizedBox(height: 16),
            footer!,
          ],
        ],
      ),
    );
  }
}

class _Iz8wnhCredits extends StatelessWidget {
  const _Iz8wnhCredits({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext outerContext) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _openIz8wnhSite(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.info_outline,
            size: 14,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              l10n.onboardingWelcomeCredits,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openIz8wnhSite(BuildContext context) async {
    try {
      final uri = Uri.parse(AppConfigs.getIz8wnhSite());
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else if (context.mounted) {
        showErrorSnackbar(context, context.localization.errorOpenDisclaimerSite);
      }
    } catch (_) {
      if (context.mounted) {
        showErrorSnackbar(context, context.localization.errorOpenDisclaimerSite);
      }
    }
  }
}

class _ModeChips extends StatelessWidget {
  const _ModeChips();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _modeChip('Analog', const Color(0xFF3B82F6)),
        _modeChip('DMR', const Color(0xFFA855F7)),
        _modeChip('C4FM', const Color(0xFF14B8A6)),
        _modeChip('D-STAR', const Color(0xFFFF6B35)),
      ],
    );
  }

  Widget _modeChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
      backgroundColor: color.withValues(alpha: 0.1),
      side: BorderSide(color: color.withValues(alpha: 0.3)),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
