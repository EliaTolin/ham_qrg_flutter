import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Gates a Pro-only block behind a tantalising blurred teaser.
///
/// When [locked] is false the real [child] is shown as-is. When locked, the
/// real [child] is NOT built (so no network/compute happens for free users) —
/// instead a cheap [teaser] mock is rendered blurred, under a lock + value
/// proposition + call to action. Tapping anywhere triggers [onUnlock].
class ProBlurGate extends StatelessWidget {
  const ProBlurGate({
    required this.locked,
    required this.child,
    required this.teaser,
    required this.title,
    required this.onUnlock,
    this.subtitle,
    this.ctaLabel = 'Sblocca con PRO',
    this.blurSigma = 9,
    super.key,
  });

  /// When true, show the blurred teaser instead of [child].
  final bool locked;

  /// The real, Pro-only content. Only built when not [locked].
  final Widget child;

  /// A cheap mock shown blurred behind the lock (no network/compute).
  final Widget teaser;

  final String title;
  final String? subtitle;
  final String ctaLabel;
  final VoidCallback onUnlock;
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    if (!locked) return child;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onUnlock,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Blurred teaser fills behind — decorative, never interactive.
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: IgnorePointer(child: teaser),
              ),
            ),
            // Darkening scrim so the lock + text read on any teaser.
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.surface.withValues(alpha: 0.35),
                      theme.colorScheme.surface.withValues(alpha: 0.78),
                    ],
                  ),
                ),
              ),
            ),
            // Lock + CTA — the sizing child (full width) so the gate is always
            // tall enough for it (no overflow when the teaser is short).
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.proGold.withValues(alpha: 0.18),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.proGold.withValues(alpha: 0.6),
                        ),
                      ),
                      child: const Icon(Icons.lock_rounded, color: AppColors.proGold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                    const SizedBox(height: 14),
                    FilledButton.icon(
                      onPressed: onUnlock,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.proGold,
                        foregroundColor: AppColors.onProGold,
                      ),
                      icon: const Icon(Icons.bolt_rounded, size: 18),
                      label: Text(ctaLabel),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
