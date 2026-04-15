import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart';
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart'
    show normalizePotaMode;

class PotaSpotHeader extends StatelessWidget {
  const PotaSpotHeader({required this.spot, super.key});

  final PotaSpot spot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final band = bandFromFrequencyKhz(spot.frequency);
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = freshnessColor(age, theme.colorScheme);

    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: theme.colorScheme.shadow.withValues(alpha: 0.2),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: CustomPaint(
          painter: _PotaHeaderPainter(
            scaffoldColor: theme.scaffoldBackgroundColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // POTA logo + callsign + freshness badge
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pota_logo.png',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          spot.activator,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Freshness badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: freshColor.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: freshColor.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Text(
                          spotTimeAgo(spot.spotTime),
                          style: TextStyle(
                            color: freshColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Park name
                  Text(
                    spot.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Reference
                  Text(
                    spot.reference,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.6),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Badges row: frequency + band + mode
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _HeaderBadge(
                        icon: Icons.radio,
                        label: '${spot.frequency} kHz',
                      ),
                      if (band != null)
                        _HeaderBadge(
                          label: band,
                          filled: true,
                        ),
                      if (normalizePotaMode(spot.mode) case final mode?)
                        _HeaderBadge(
                          label: mode,
                          filled: true,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderBadge extends StatelessWidget {
  const _HeaderBadge({
    required this.label,
    this.icon,
    this.filled = false,
  });

  final String label;
  final IconData? icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: filled
            ? onPrimary.withValues(alpha: 0.2)
            : onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: onPrimary.withValues(alpha: filled ? 0.3 : 0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: onPrimary.withValues(alpha: 0.9),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _PotaHeaderPainter extends CustomPainter {
  _PotaHeaderPainter({required this.scaffoldColor});

  final Color scaffoldColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Main gradient
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF1B7A42),
        const Color(0xFF22924E),
        const Color(0xFF34D468).withValues(alpha: 0.6),
      ],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    // Decorative radial glow
    final glowPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.8, -0.6),
        radius: 0.8,
        colors: [
          const Color(0xFF4ADE80).withValues(alpha: 0.12),
          Colors.transparent,
        ],
      ).createShader(rect);
    canvas.drawRect(rect, glowPaint);

    // Bottom fade to scaffold
    final bottomFade = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.6, 1.0],
      colors: [
        Colors.transparent,
        scaffoldColor.withValues(alpha: 0.4),
      ],
    );
    canvas.drawRect(rect, Paint()..shader = bottomFade.createShader(rect));
  }

  @override
  bool shouldRepaint(covariant _PotaHeaderPainter oldDelegate) =>
      scaffoldColor != oldDelegate.scaffoldColor;
}
