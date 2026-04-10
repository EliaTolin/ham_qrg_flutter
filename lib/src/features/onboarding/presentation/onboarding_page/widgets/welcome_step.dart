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
            padding: const EdgeInsets.only(top: 4, right: 16),
            child: TextButton(
              onPressed: onSkip,
              child: Text(
                l10n.onboardingSkip,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ),
          ),
        ),
        // Cards
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              // Card 1: Repeaters
              _WelcomeCard(
                visual: _RepeaterVisual(),
                title: l10n.onboardingWelcomeTitle1,
                subtitle: l10n.onboardingWelcomeSubtitle1,
                footer: _Iz8wnhCredits(context: context),
              ),
              // Card 2: Mode filtering
              _WelcomeCard(
                visual: const _ModeFilterVisual(),
                title: l10n.onboardingWelcomeTitle2,
                subtitle: l10n.onboardingWelcomeSubtitle2,
              ),
              // Card 3: POTA
              _WelcomeCard(
                visual: _PotaVisual(),
                title: l10n.onboardingWelcomeTitle3,
                subtitle: l10n.onboardingWelcomeSubtitle3,
              ),
              // Card 4: Favorites
              _WelcomeCard(
                visual: _FavoritesVisual(),
                title: l10n.onboardingWelcomeTitle4,
                subtitle: l10n.onboardingWelcomeSubtitle4,
              ),
            ],
          ),
        ),
        // Dots + button
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              // Page dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _totalCards,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: currentIndex == index ? 20 : 8,
                    height: 4,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? colorScheme.primary
                          : colorScheme.onSurface.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Next / Get Started button
              SizedBox(
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
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Welcome Card Shell
// ---------------------------------------------------------------------------

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({
    required this.visual,
    required this.title,
    required this.subtitle,
    this.footer,
  });

  final Widget visual;
  final String title;
  final String subtitle;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          visual,
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

// ---------------------------------------------------------------------------
// Card 1: Repeater Visual — stylized tower with frequency text
// ---------------------------------------------------------------------------

class _RepeaterVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer ring
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.1),
                width: 2,
              ),
            ),
          ),
          // Inner filled circle
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colorScheme.primary.withValues(alpha: 0.15),
                  colorScheme.primary.withValues(alpha: 0.05),
                ],
              ),
            ),
          ),
          // Tower icon
          Icon(
            Icons.cell_tower,
            size: 56,
            color: colorScheme.primary,
          ),
          // Signal arcs
          Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.wifi,
              size: 24,
              color: colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Card 2: Mode Filter Visual — colored mode badges in a grid
// ---------------------------------------------------------------------------

class _ModeFilterVisual extends StatelessWidget {
  const _ModeFilterVisual();

  static const _modes = [
    ('Analog', Color(0xFF3B82F6)),
    ('DMR', Color(0xFFA855F7)),
    ('C4FM', Color(0xFF14B8A6)),
    ('D-STAR', Color(0xFFFF6B35)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: _modes.map((mode) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: mode.$2.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: mode.$2.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: mode.$2,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                mode.$1,
                style: TextStyle(
                  color: mode.$2,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ---------------------------------------------------------------------------
// Card 3: POTA Visual — POTA logo with green accent
// ---------------------------------------------------------------------------

class _PotaVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer ring
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF16A34A).withValues(alpha: 0.1),
                width: 2,
              ),
            ),
          ),
          // Inner filled circle
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF16A34A).withValues(alpha: 0.12),
                  const Color(0xFF16A34A).withValues(alpha: 0.04),
                ],
              ),
            ),
          ),
          // POTA logo
          Image.asset(
            'assets/images/pota_logo.png',
            width: 64,
            height: 64,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Card 4: Favorites Visual — heart with radio waves
// ---------------------------------------------------------------------------

class _FavoritesVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer ring
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.redAccent.withValues(alpha: 0.1),
                width: 2,
              ),
            ),
          ),
          // Inner filled circle
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.redAccent.withValues(alpha: 0.12),
                  Colors.redAccent.withValues(alpha: 0.04),
                ],
              ),
            ),
          ),
          // Heart icon
          const Icon(
            Icons.favorite,
            size: 56,
            color: Colors.redAccent,
          ),
          // Star accent
          Positioned(
            top: 20,
            right: 20,
            child: Icon(
              Icons.star,
              size: 20,
              color: Colors.amber.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// IZ8WNH Credits
// ---------------------------------------------------------------------------

class _Iz8wnhCredits extends StatelessWidget {
  const _Iz8wnhCredits({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext outerContext) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => _openIz8wnhSite(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info_outline,
              size: 14,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                l10n.onboardingWelcomeCredits,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openIz8wnhSite(BuildContext context) async {
    try {
      final uri = Uri.parse(AppConfigs.getIz8wnhSite());
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else if (context.mounted) {
        showErrorSnackbar(
          context,
          context.localization.errorOpenDisclaimerSite,
        );
      }
    } catch (_) {
      if (context.mounted) {
        showErrorSnackbar(
          context,
          context.localization.errorOpenDisclaimerSite,
        );
      }
    }
  }
}
