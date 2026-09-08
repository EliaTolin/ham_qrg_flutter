import 'dart:io';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/widgets/units/map_scale_bar.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/repeaters/domain/coverage/repeater_coverage.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_coverage/get_repeater_coverage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' hide Size;

/// PRO feature: shows the predicted RF coverage of a repeater as a colored
/// overlay draped on the map. The heavy computation runs server-side
/// (ham_qrg_coverage); here we just render the returned PNG + bounds.
@RoutePage()
class RepeaterCoveragePage extends HookConsumerWidget {
  const RepeaterCoveragePage({
    required this.repeaterId,
    required this.latitude,
    required this.longitude,
    required this.frequencyHz,
    this.callsign,
    super.key,
  });

  final String repeaterId;
  final double latitude;
  final double longitude;
  final int frequencyHz;
  final String? callsign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final provider = getRepeaterCoverageProvider(
      repeaterId: repeaterId,
      lat: latitude,
      lon: longitude,
      frequencyHz: frequencyHz,
    );
    final coverageAsync = ref.watch(provider);

    // Log the underlying failure (Dio error, timeout, server message, …) so a
    // generic "unable to compute" in the UI is always backed by a real log.
    ref.listen(provider, (_, next) {
      next.whenOrNull(
        error: (error, stackTrace) => ref
            .read(talkerServiceProvider)
            .handle(error, stackTrace, '[Coverage] computation failed'),
      );
    });

    final title = (callsign != null && callsign!.isNotEmpty)
        ? '${l10n.repeaterCoverageTitle} · $callsign'
        : l10n.repeaterCoverageTitle;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: coverageAsync.when(
        loading: () => _LoadingView(message: l10n.repeaterCoverageLoading),
        error: (error, _) => _ErrorView(
          message: l10n.repeaterCoverageError,
          detail: error.toString(),
          retryLabel: l10n.repeaterCoverageRetry,
          onRetry: () => ref.invalidate(provider),
        ),
        data: (coverage) => _CoverageMapView(
          latitude: latitude,
          longitude: longitude,
          coverage: coverage,
        ),
      ),
    );
  }
}

class _CoverageMapView extends HookWidget {
  const _CoverageMapView({
    required this.latitude,
    required this.longitude,
    required this.coverage,
  });

  final double latitude;
  final double longitude;
  final RepeaterCoverage coverage;

  @override
  Widget build(BuildContext context) {
    // La preferenza si legge durante la build: dentro `onMapCreated`
    // il contesto sarebbe attraversato da un await.
    final isImperial = context.units.isImperial;
    return Stack(
      children: [
        MapWidget(
          viewport: CameraViewportState(
            center: Point(coordinates: Position(longitude, latitude)),
            zoom: 8.5,
          ),
          styleUri: MapboxStyles.OUTDOORS,
          onMapCreated: (map) async {
            await applyUnitAwareScaleBar(
              map,
              isImperial: isImperial,
            );
            await _setupMap(map);
          },
        ),
        Positioned(
          left: 12,
          right: 12,
          bottom: 12,
          child: _CoverageLegend(legend: coverage.legend),
        ),
      ],
    );
  }

  Future<void> _setupMap(MapboxMap map) async {
    await map.location.updateSettings(
      LocationComponentSettings(enabled: false),
    );

    final b = coverage.bounds;
    final imageUrl = coverage.imageUrl;
    final isLocalFile = imageUrl.startsWith('file://');

    // Coverage PNG as an image source (row 0 = north -> top-left = west/north).
    // Con la cache offline l'URL può essere un `file://` locale: Mapbox non lo
    // carica come url, quindi la sorgente nasce vuota e i byte vengono
    // spinti con updateStyleImageSourceImage (stesso formato PNG dei marker).
    await map.style.addSource(
      ImageSource(
        id: 'coverage-source',
        coordinates: [
          [b.west, b.north],
          [b.east, b.north],
          [b.east, b.south],
          [b.west, b.south],
        ],
        url: isLocalFile ? null : imageUrl,
      ),
    );
    await map.style.addLayer(
      RasterLayer(
        id: 'coverage-layer',
        sourceId: 'coverage-source',
        rasterOpacity: 0.7,
      ),
    );
    if (isLocalFile) {
      final file = File.fromUri(Uri.parse(imageUrl));
      if (file.existsSync()) {
        final bytes = await file.readAsBytes();
        await map.style.updateStyleImageSourceImage(
          'coverage-source',
          MbxImage(
            width: coverage.width,
            height: coverage.height,
            data: bytes,
          ),
        );
      }
    }

    // Repeater marker.
    final circles = await map.annotations.createCircleAnnotationManager();
    await circles.create(
      CircleAnnotationOptions(
        geometry: Point(coordinates: Position(longitude, latitude)),
        circleRadius: 7,
        circleColor: 0xFFA855F7,
        circleStrokeWidth: 2,
        circleStrokeColor: 0xFFFFFFFF,
      ),
    );

    // Fit the camera to the coverage bounds.
    final camera = await map.cameraForCoordinateBounds(
      CoordinateBounds(
        southwest: Point(coordinates: Position(b.west, b.south)),
        northeast: Point(coordinates: Position(b.east, b.north)),
        infiniteBounds: false,
      ),
      MbxEdgeInsets(top: 60, left: 30, bottom: 140, right: 30),
      null,
      null,
      null,
      null,
    );
    await map.setCamera(camera);
  }
}

class _CoverageLegend extends StatelessWidget {
  const _CoverageLegend({required this.legend});

  final List<CoverageLegendStop> legend;

  @override
  Widget build(BuildContext context) {
    if (legend.isEmpty) return const SizedBox.shrink();
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.15),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.repeaterCoverageLegendTitle,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Row(
                    children: [
                      for (final stop in legend)
                        Expanded(
                          child: Container(
                            height: 10,
                            color: _hexColor(stop.color),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${legend.first.dbm.round()} dBm',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '${legend.last.dbm.round()} dBm',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _hexColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');
    return Color(int.parse('FF$cleaned', radix: 16));
  }
}

class _LoadingView extends HookWidget {
  const _LoadingView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 2200),
    )..repeat();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size.square(160),
                      painter: _SignalWavesPainter(
                        progress: controller.value,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    // Antenna core with a gentle pulse.
                    Transform.scale(
                      scale:
                          1 + 0.08 * math.sin(controller.value * 2 * math.pi),
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary
                                  .withValues(alpha: 0.4),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.settings_input_antenna,
                          color: theme.colorScheme.onPrimary,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Concentric signal rings expanding outward from the antenna — a little
/// nod to RF propagation while the coverage is being computed.
class _SignalWavesPainter extends CustomPainter {
  _SignalWavesPainter({required this.progress, required this.color});

  /// Repeating 0..1 animation value.
  final double progress;
  final Color color;

  static const _waveCount = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.width / 2;

    for (var i = 0; i < _waveCount; i++) {
      final t = (progress + i / _waveCount) % 1.0;
      final radius = t * maxRadius;
      final opacity = (1 - t).clamp(0.0, 1.0) * 0.55;
      if (radius < 26) continue; // start outside the antenna core

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..color = color.withValues(alpha: opacity);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SignalWavesPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
    this.detail,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.signal_wifi_bad,
              size: 48,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            if (detail != null && detail!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                detail!,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
