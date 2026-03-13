import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart';

class PotaSpotHeader extends StatelessWidget {
  const PotaSpotHeader({required this.spot, super.key});

  final PotaSpot spot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final band = bandFromFrequencyKhz(spot.frequency);

    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.black.withValues(alpha: 0.15),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                  // Activator callsign
                  Row(
                    children: [
                      PotaSpotFreshnessIndicator(spotTime: spot.spotTime),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          spot.activator,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Chips row: frequency + band + mode + time
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _HeaderChip(
                        icon: Icons.radio,
                        label: '${spot.frequency} kHz',
                      ),
                      if (band != null) _HeaderChip(label: band),
                      _HeaderChip(label: spot.mode),
                      _HeaderChip(
                        icon: Icons.access_time,
                        label: spotTimeAgo(spot.spotTime),
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

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: Colors.white.withValues(alpha: 0.9)),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
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
    // Main gradient background (subtle)
    final rect = Offset.zero & size;
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

    // Decorative radial glow (top-right, subtle)
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

    // Bottom fade to scaffold background (gradual)
    final bottomFade = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.75, 1.0],
      colors: [
        Colors.transparent,
        scaffoldColor,
      ],
    );
    canvas.drawRect(rect, Paint()..shader = bottomFade.createShader(rect));
  }

  @override
  bool shouldRepaint(covariant _PotaHeaderPainter oldDelegate) =>
      scaffoldColor != oldDelegate.scaffoldColor;
}
