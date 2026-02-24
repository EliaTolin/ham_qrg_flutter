import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

class RepeaterHeader extends StatelessWidget {
  const RepeaterHeader({
    required this.repeater,
    super.key,
  });

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    final accessColors = repeater.accesses
        .map((a) => AccessModeHelper.getAccessModeColorObject(a.mode))
        .toSet()
        .toList();

    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      leading: IconButton(
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.onSurface,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: scaffoldBg),
          child: Stack(
            children: [
              // Granular gradient with access mode colors
              Positioned.fill(
                child: CustomPaint(
                  painter: _GrainGradientPainter(
                    colors: accessColors,
                    scaffoldBg: scaffoldBg,
                  ),
                ),
              ),
              // Bottom fade to scaffold background
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        scaffoldBg.withValues(alpha: 0),
                        scaffoldBg,
                      ],
                    ),
                  ),
                ),
              ),
              // Content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (repeater.callsign != null)
                        Text(
                          repeater.callsign!,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (repeater.name != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          repeater.name!,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              [
                                repeater.locality,
                                repeater.region,
                              ].whereType<String>().join(', '),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (repeater.locator != null) ...[
                        Text(
                          '(${repeater.locator})',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Paints a multi-color radial gradient with a subtle grain/noise overlay.
///
/// Each access mode color is placed as a separate radial gradient blob at a
/// different position in the header, then a fine grain texture is drawn on
/// top to give the "granular gradient" effect popular in modern UI design.
class _GrainGradientPainter extends CustomPainter {
  _GrainGradientPainter({
    required this.colors,
    required this.scaffoldBg,
  });

  final List<Color> colors;
  final Color scaffoldBg;

  // Predefined positions for color blobs (up to 4)
  static const _blobPositions = [
    Alignment(-0.7, -0.9),
    Alignment(0.8, -0.5),
    Alignment(-0.3, 0),
    Alignment(0.5, -0.2),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    if (colors.isEmpty) return;

    // Draw each color as a radial gradient blob
    for (var i = 0; i < colors.length && i < _blobPositions.length; i++) {
      final color = colors[i];
      final alignment = _blobPositions[i];
      final gradient = RadialGradient(
        center: alignment,
        radius: colors.length == 1 ? 1.2 : 0.9,
        colors: [
          color.withValues(alpha: 0.9),
          color.withValues(alpha: 0.50),
          Colors.white.withValues(alpha: 0),
        ],
        stops: const [0.0, 0.5, 1.0],
      );

      canvas.drawRect(
        rect,
        Paint()..shader = gradient.createShader(rect),
      );
    }

    // Grain/noise overlay
    final random = math.Random(42);
    final grainPaint = Paint();
    final grainCount = (size.width * size.height ~/ 25).clamp(0, 5000);

    for (var i = 0; i < grainCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final isLight = random.nextBool();

      grainPaint.color = isLight
          ? Colors.white.withValues(alpha: random.nextDouble() * 0.10)
          : Colors.black.withValues(alpha: random.nextDouble() * 0.08);

      canvas.drawCircle(Offset(x, y), 0.6, grainPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GrainGradientPainter oldDelegate) => colors != oldDelegate.colors;
}
