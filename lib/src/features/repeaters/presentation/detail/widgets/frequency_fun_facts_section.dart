import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:intl/intl.dart';

class FrequencyFunFactsSection extends StatefulWidget {
  const FrequencyFunFactsSection({
    required this.repeater,
    this.distanceKm,
    super.key,
  });

  final Repeater repeater;
  final double? distanceKm;

  @override
  State<FrequencyFunFactsSection> createState() =>
      _FrequencyFunFactsSectionState();
}

class _FrequencyFunFactsSectionState extends State<FrequencyFunFactsSection>
    with SingleTickerProviderStateMixin {
  static const double _speedOfLight = 299792458; // m/s

  bool _isExpanded = false;
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final frequencyHz = widget.repeater.frequencyHz;
    final wavelengthM = _speedOfLight / frequencyHz;
    final distanceM =
        widget.distanceKm != null ? widget.distanceKm! * 1000 : null;

    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Header — always visible
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.repeaterDetailFunFacts,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _rotationAnimation,
                    child: Icon(
                      Icons.expand_more,
                      size: 24,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            // Expandable content
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Wavelength
                        _FunFactRow(
                          icon: Icons.straighten,
                          iconColor: Colors.blue,
                          label: l10n.repeaterDetailWavelength,
                          value: l10n.repeaterDetailWavelengthValue(
                            _formatWavelength(wavelengthM),
                          ),
                        ),
                        _funFactDivider(colorScheme),
                        // Oscillations per second
                        _FunFactRow(
                          icon: Icons.waves,
                          iconColor: Colors.purple,
                          label: l10n.repeaterDetailOscillations,
                          value: l10n.repeaterDetailOscillationsValue(
                            _formatOscillations(frequencyHz),
                          ),
                        ),
                        // Propagation time (only with distance)
                        if (distanceM != null) ...[
                          _funFactDivider(colorScheme),
                          _FunFactRow(
                            icon: Icons.speed,
                            iconColor: Colors.orange,
                            label: l10n.repeaterDetailPropagationTime,
                            value: l10n.repeaterDetailPropagationTimeValue(
                              _formatPropagationTime(distanceM),
                            ),
                          ),
                        ],
                        // Wave cycles in journey (only with distance)
                        if (distanceM != null) ...[
                          _funFactDivider(colorScheme),
                          _FunFactRow(
                            icon: Icons.repeat,
                            iconColor: Colors.teal,
                            label: l10n.repeaterDetailWaveCycles,
                            value: l10n.repeaterDetailWaveCyclesValue(
                              _formatWaveCycles(distanceM, wavelengthM),
                            ),
                          ),
                        ],
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

  Widget _funFactDivider(ColorScheme colorScheme) {
    return Divider(
      height: 24,
      color: colorScheme.outline.withValues(alpha: 0.1),
    );
  }

  String _formatWavelength(double meters) {
    if (meters >= 1) {
      return '${meters.toStringAsFixed(2)} m';
    } else {
      return '${(meters * 100).toStringAsFixed(1)} cm';
    }
  }

  String _formatOscillations(int hz) {
    return NumberFormat('#,###', 'it_IT').format(hz);
  }

  String _formatPropagationTime(double distanceM) {
    final seconds = distanceM / _speedOfLight;
    final microseconds = seconds * 1e6;
    if (microseconds >= 1000) {
      return '${(microseconds / 1000).toStringAsFixed(2)} ms';
    }
    return '${microseconds.toStringAsFixed(1)} \u00B5s';
  }

  String _formatWaveCycles(double distanceM, double wavelengthM) {
    final cycles = distanceM / wavelengthM;
    return NumberFormat('#,###', 'it_IT').format(cycles.round());
  }
}

class _FunFactRow extends StatelessWidget {
  const _FunFactRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 18,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
