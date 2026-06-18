import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Hero card that promotes the coverage-map feature on the repeater detail.
/// Designed to "sell" it: a stylized coverage teaser, a clear value prop and
/// a call to action. Tapping it opens the real coverage map.
class CoveragePromoCard extends ConsumerWidget {
  const CoveragePromoCard({required this.repeater, super.key});

  final Repeater repeater;

  bool get _hasCoordinates =>
      repeater.latitude != null && repeater.longitude != null;

  Future<void> _open(BuildContext context, WidgetRef ref) async {
    // Pro-gated: opening the coverage map presents the paywall to non-Pro.
    if (AppConfigs.coverageRequiresPro && !await requirePro(ref)) return;
    if (!context.mounted) return;
    await context.router.push(
      RepeaterCoverageRoute(
        repeaterId: repeater.id,
        latitude: repeater.latitude!,
        longitude: repeater.longitude!,
        frequencyHz: repeater.frequencyHz,
        callsign: repeater.callsign ?? repeater.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!_hasCoordinates) return const SizedBox.shrink();
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => _open(context, ref),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.proGold.withValues(alpha: 0.45)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surfaceContainerHighest,
              colorScheme.surface,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.12),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Coverage teaser (stylized heatmap blob) on the right.
            Positioned.fill(
              child: CustomPaint(painter: _MockCoveragePainter()),
            ),
            // Scrim so the left-side text stays legible over the teaser.
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.surface,
                      colorScheme.surface.withValues(alpha: 0.85),
                      colorScheme.surface.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wifi_tethering,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          l10n.repeaterCoverageCardTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const _ProBadge(),
                    ],
                  ),
                  SizedBox(
                    width: 220,
                    child: Text(
                      l10n.repeaterCoverageCardSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  // Call to action.
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.repeaterCoverageCta,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProBadge extends StatelessWidget {
  const _ProBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.proGold, AppColors.proGoldLight],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'PRO',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Paints a stylized, organic coverage heatmap (turbo palette) as a teaser.
class _MockCoveragePainter extends CustomPainter {
  // Turbo colormap stops, center (hot) -> edge (cold).
  static const _layers = <(int, double, double)>[
    (0xFF7A0402, 0.16, 0.85),
    (0xFFEF5A11, 0.30, 0.65),
    (0xFFE1DC37, 0.46, 0.5),
    (0xFF46F783, 0.64, 0.4),
    (0xFF3E9BFE, 0.82, 0.3),
    (0xFF30123B, 1.0, 0.2),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.74, size.height * 0.5);
    final maxRadius = size.height * 0.95;

    // Outer -> inner so hot colors sit on top.
    for (final (argb, factor, alpha) in _layers.reversed) {
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(argb).withValues(alpha: alpha);
      canvas.drawPath(_blob(center, maxRadius * factor), paint);
    }

    // Antenna marker at the source.
    canvas
      ..drawCircle(center, 5, Paint()..color = Colors.white)
      ..drawCircle(center, 3.5, Paint()..color = const Color(0xFF7A0402));
  }

  /// An organic, slightly irregular disc — never a perfect circle.
  Path _blob(Offset center, double radius) {
    const steps = 48;
    final path = Path();
    for (var i = 0; i <= steps; i++) {
      final a = (i / steps) * 2 * math.pi;
      final wobble =
          1 + 0.10 * math.sin(a * 3) + 0.06 * math.sin(a * 7 + 1.3);
      final r = radius * wobble;
      final p = Offset(
        center.dx + r * math.cos(a),
        center.dy + r * math.sin(a),
      );
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    return path..close();
  }

  @override
  bool shouldRepaint(covariant _MockCoveragePainter oldDelegate) => false;
}
