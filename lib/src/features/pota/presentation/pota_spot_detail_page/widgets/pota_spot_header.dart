import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/freshness_color_helper.dart';
import 'package:hamqrg/src/features/pota/data/mappers/pota_mappers.dart';
import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_freshness_indicator.dart';
import 'package:hamqrg/src/features/pota/presentation/widgets/pota_mode_badge.dart'
    show normalizePotaMode;

/// Hero header for the POTA spot detail page.
///
/// Displays the activator callsign, park name, frequency info and freshness
/// over a POTA-branded grain gradient with topographic contour decoration.
class PotaSpotHeader extends StatelessWidget {
  const PotaSpotHeader({required this.spot, super.key});

  final PotaSpot spot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldBg = theme.scaffoldBackgroundColor;
    final age = DateTime.now().difference(spot.spotTime);
    final freshColor = freshnessColor(age, theme.colorScheme);
    final band = bandFromFrequencyKhz(spot.frequency);
    final mode = normalizePotaMode(spot.mode);

    // Adapt header height to screen size
    final screenHeight = MediaQuery.sizeOf(context).height;
    final expandedHeight = screenHeight < 700 ? 220.0 : 280.0;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      leading: IconButton(
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // ── Grain gradient + topo lines ──
            Positioned.fill(
              child: CustomPaint(
                painter: _PotaGrainGradientPainter(scaffoldBg: scaffoldBg),
              ),
            ),

            // ── Dark wash to keep greens deep ──
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ),

            // ── Top darken for status bar ──
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.3],
                    colors: [
                      Colors.black.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // ── Bottom edge: thin fade to scaffold (last 30px only) ──
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      scaffoldBg,
                    ],
                  ),
                ),
              ),
            ),

            // ── Content ──
            SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  screenHeight < 700 ? 8 : 48,
                  20,
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Logo + freshness
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/pota_logo.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        _FreshnessBadge(
                          spotTime: spot.spotTime,
                          color: freshColor,
                        ),
                        const Spacer(),
                        // Reference pill
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.25),
                            ),
                          ),
                          child: Text(
                            spot.reference,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Callsign — scales with screen
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        spot.activator,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Park name
                    Text(
                      spot.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.92),
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: screenHeight < 700 ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),
                    // ── VFO frequency display ──
                    _VfoFrequencyRow(
                      frequency: spot.frequency,
                      band: band,
                      mode: mode,
                    ),
                    const SizedBox(height: 14),
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

// ---------------------------------------------------------------------------
// Freshness badge — pulsing dot + time ago
// ---------------------------------------------------------------------------

class _FreshnessBadge extends StatefulWidget {
  const _FreshnessBadge({required this.spotTime, required this.color});

  final DateTime spotTime;
  final Color color;

  @override
  State<_FreshnessBadge> createState() => _FreshnessBadgeState();
}

class _FreshnessBadgeState extends State<_FreshnessBadge> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, _) {
        final t = _pulse.value;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.15 + 0.05 * t),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.color.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Pulsing dot
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.5 * t),
                      blurRadius: 4 + 3 * t,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                spotTimeAgo(widget.spotTime),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: widget.color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// VFO frequency row — styled like a radio dial readout
// ---------------------------------------------------------------------------

class _VfoFrequencyRow extends StatelessWidget {
  const _VfoFrequencyRow({
    required this.frequency,
    this.band,
    this.mode,
  });

  final String frequency;
  final String? band;
  final String? mode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.radio,
            size: 16,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          const SizedBox(width: 8),
          // Frequency — monospace feel
          Text(
            '$frequency kHz',
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          if (band != null) ...[
            _HeaderChip(label: band!),
            const SizedBox(width: 6),
          ],
          if (mode != null) _HeaderChip(label: mode!),
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 11,
            ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// POTA Grain Gradient + Topographic contour lines
// ---------------------------------------------------------------------------

/// POTA-branded gradient with nature-inspired greens, grain texture,
/// and topographic contour line decoration.
class _PotaGrainGradientPainter extends CustomPainter {
  _PotaGrainGradientPainter({required this.scaffoldBg});

  final Color scaffoldBg;

  // POTA deep greens — kept dark for white-text contrast
  static const _potaColors = [
    (alignment: Alignment(-0.8, -0.7), color: Color(0xFF083D1A)),
    (alignment: Alignment(0.6, -0.4), color: Color(0xFF0F5A2E)),
    (alignment: Alignment(-0.2, 0.1), color: Color(0xFF14693A)),
    (alignment: Alignment(0.9, 0), color: Color(0xFF0C4D24)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Very dark forest base — guarantees contrast
    canvas.drawRect(rect, Paint()..color = const Color(0xFF062B12));

    // Radial color blobs (subdued so they don't wash out text)
    for (final blob in _potaColors) {
      final gradient = RadialGradient(
        center: blob.alignment,
        radius: 0.95,
        colors: [
          blob.color.withValues(alpha: 0.7),
          blob.color.withValues(alpha: 0.30),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      );
      canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
    }

    // ── Topographic contour lines ──
    _paintTopoContours(canvas, size);

    // ── Grain texture ──
    final random = math.Random(42);
    final grainPaint = Paint();
    final grainCount = (size.width * size.height ~/ 28).clamp(0, 4500);

    for (var i = 0; i < grainCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final isLight = random.nextBool();

      grainPaint.color = isLight
          ? Colors.white.withValues(alpha: random.nextDouble() * 0.07)
          : Colors.black.withValues(alpha: random.nextDouble() * 0.06);

      canvas.drawCircle(Offset(x, y), 0.6, grainPaint);
    }
  }

  void _paintTopoContours(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = Colors.white.withValues(alpha: 0.06);

    // Concentric ellipses centered in the upper-right area
    final center = Offset(size.width * 0.75, size.height * 0.3);

    for (var i = 1; i <= 8; i++) {
      final rx = 30.0 + i * 28;
      final ry = 20.0 + i * 20;
      canvas.drawOval(
        Rect.fromCenter(center: center, width: rx * 2, height: ry * 2),
        paint,
      );
    }

    // Second cluster, lower-left
    final center2 = Offset(size.width * 0.15, size.height * 0.75);
    for (var i = 1; i <= 5; i++) {
      final rx = 20.0 + i * 22;
      final ry = 15.0 + i * 16;
      canvas.drawOval(
        Rect.fromCenter(center: center2, width: rx * 2, height: ry * 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PotaGrainGradientPainter oldDelegate) =>
      scaffoldBg != oldDelegate.scaffoldBg;
}
