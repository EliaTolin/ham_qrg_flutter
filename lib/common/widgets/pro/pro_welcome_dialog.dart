import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Celebratory "Welcome to Pro" dialog shown right after a successful purchase.
/// A blue gradient sweeps in radially to flood the card, signal waves pulse,
/// and the Pro badge springs in — a deliberate WOW moment.
Future<void> showProWelcome(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black54,
    builder: (_) => const ProWelcomeDialog(),
  );
}

class ProWelcomeDialog extends StatefulWidget {
  const ProWelcomeDialog({super.key});

  @override
  State<ProWelcomeDialog> createState() => _ProWelcomeDialogState();
}

class _ProWelcomeDialogState extends State<ProWelcomeDialog>
    with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..forward();
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2600),
  )..repeat();

  @override
  void dispose() {
    _intro.dispose();
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final cs = theme.colorScheme;
    final onAccent = cs.onPrimary;
    final reveal = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0, 0.55, curve: Curves.easeOutCubic),
    );
    final badge = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.45, 0.85, curve: Curves.elasticOut),
    );
    final content = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.55, 1, curve: Curves.easeOut),
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: SizedBox(
        width: 320,
        height: 420,
        child: Stack(
          children: [
            // Base (pre-reveal) surface.
            Positioned.fill(
              child: ColoredBox(color: theme.colorScheme.surface),
            ),
            // Blue gradient flooding in radially.
            AnimatedBuilder(
              animation: reveal,
              builder: (context, _) => Positioned.fill(
                child: ClipPath(
                  clipper: _RadialReveal(reveal.value),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          cs.primary,
                          Color.lerp(cs.primary, cs.tertiary, 0.5) ??
                              cs.primary,
                          cs.tertiary,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Looping signal waves behind the badge.
            Positioned.fill(
              child: AnimatedBuilder(
                animation: Listenable.merge([_loop, reveal]),
                builder: (context, _) => CustomPaint(
                  painter: _WavesPainter(
                    t: _loop.value,
                    opacity: reveal.value,
                    color: onAccent,
                  ),
                ),
              ),
            ),
            // Foreground content.
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: badge,
                      child: Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: onAccent.withValues(alpha: 0.16),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.proGold, width: 2.5),
                        ),
                        child: const Icon(
                          Icons.workspace_premium_rounded,
                          color: AppColors.proGold,
                          size: 52,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    FadeTransition(
                      opacity: content,
                      child: Column(
                        children: [
                          Text(
                            l10n.proWelcomeTitle,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: onAccent,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.proWelcomeBody,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: onAccent.withValues(alpha: 0.92),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    FadeTransition(
                      opacity: content,
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: onAccent,
                            foregroundColor: cs.primary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            l10n.proWelcomeCta,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
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

/// Circle that grows from the badge to flood the whole card.
class _RadialReveal extends CustomClipper<Path> {
  _RadialReveal(this.progress);

  final double progress;

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height * 0.4);
    final maxRadius =
        math.sqrt(size.width * size.width + size.height * size.height);
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: maxRadius * progress));
  }

  @override
  bool shouldReclip(_RadialReveal oldClipper) =>
      oldClipper.progress != progress;
}

/// Expanding concentric "signal" rings, looping.
class _WavesPainter extends CustomPainter {
  _WavesPainter({required this.t, required this.opacity, required this.color});

  final double t;
  final double opacity;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0) return;
    final center = Offset(size.width / 2, size.height * 0.4);
    final maxRadius = size.width * 0.55;
    for (var i = 0; i < 3; i++) {
      final phase = (t + i / 3) % 1.0;
      final radius = 20 + (maxRadius - 20) * phase;
      final alpha = (1 - phase) * 0.45 * opacity;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color.withValues(alpha: alpha);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_WavesPainter oldDelegate) =>
      oldDelegate.t != t ||
      oldDelegate.opacity != opacity ||
      oldDelegate.color != color;
}
