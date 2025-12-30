import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/common/utils/repeater_mode_helper.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';

@RoutePage()
class RepeaterDetailPage extends StatelessWidget {
  const RepeaterDetailPage({
    required this.repeaterId,
    required this.repeater,
    super.key,
  });

  final String repeaterId;
  final Repeater repeater;

  static String formatFrequency(int frequencyHz) {
    if (frequencyHz >= 1000000) {
      return '${(frequencyHz / 1000000).toStringAsFixed(3)} MHz';
    } else if (frequencyHz >= 1000) {
      return '${(frequencyHz / 1000).toStringAsFixed(1)} kHz';
    }
    return '$frequencyHz Hz';
  }

  static String formatShift(int? shiftHz, String? shiftRaw) {
    if (shiftRaw != null && shiftRaw.isNotEmpty) {
      return shiftRaw;
    }
    if (shiftHz != null) {
      if (shiftHz >= 1000) {
        return '${(shiftHz / 1000).toStringAsFixed(1)} kHz';
      }
      return '$shiftHz Hz';
    }
    return '-';
  }

  static String formatCtcss(double? ctcssHz) {
    if (ctcssHz != null) {
      return '${ctcssHz.toStringAsFixed(1)} Hz';
    }
    return '-';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colorMode = RepeaterModeHelper.getModeColorObject(repeater.mode);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with gradient
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorMode.withValues(alpha: 0.8),
                      colorMode.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            RepeaterModeHelper.getModeLabel(repeater.mode, l10n),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (repeater.callsign != null)
                          Text(
                            repeater.callsign!,
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (repeater.name != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            repeater.name!,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Frequency Card
                _InfoCard(
                  icon: Icons.waves,
                  iconColor: colorScheme.primary,
                  title: l10n.repeaterFrequency,
                  value: formatFrequency(repeater.frequencyHz),
                  subtitle: 'Frequenza operativa',
                ),
                const SizedBox(height: 12),
                // Shift & CTCSS Row
                Row(
                  children: [
                    if (repeater.shiftHz != null || repeater.shiftRaw != null) ...[
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.swap_horiz,
                          iconColor: colorScheme.secondary,
                          title: l10n.repeaterShift,
                          value: formatShift(repeater.shiftHz, repeater.shiftRaw),
                          subtitle: 'Offset',
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    if (repeater.ctcssHz != null) ...[
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.tune,
                          iconColor: colorScheme.tertiary,
                          title: l10n.repeaterCtcss,
                          value: formatCtcss(repeater.ctcssHz),
                          subtitle: 'Tone',
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
                // Location Card
                if (repeater.locality != null || repeater.region != null) ...[
                  _InfoCard(
                    icon: Icons.location_on,
                    iconColor: Colors.green,
                    title: l10n.repeaterLocation,
                    value: [
                      repeater.locality,
                      repeater.region,
                    ].whereType<String>().join(', '),
                    subtitle: 'Posizione',
                  ),
                  const SizedBox(height: 12),
                ],
                // Distance Card
                if (repeater.distanceMeters != null) ...[
                  _InfoCard(
                    icon: Icons.straighten,
                    iconColor: Colors.orange,
                    title: l10n.repeaterDistance,
                    value: repeater.distanceMeters! < 1000
                        ? '${repeater.distanceMeters!.toStringAsFixed(0)} m'
                        : '${(repeater.distanceMeters! / 1000).toStringAsFixed(1)} km',
                    subtitle: 'Distanza da te',
                  ),
                  const SizedBox(height: 12),
                ],
                // Additional Info Section
                if (repeater.managerCallsign != null ||
                    repeater.network != null ||
                    repeater.locator != null) ...[
                  const _SectionHeader(title: 'Informazioni aggiuntive'),
                  const SizedBox(height: 12),
                  if (repeater.managerCallsign != null)
                    _DetailTile(
                      icon: Icons.person,
                      label: 'Manager',
                      value: repeater.managerCallsign!,
                    ),
                  if (repeater.network != null)
                    _DetailTile(
                      icon: Icons.network_check,
                      label: 'Network',
                      value: repeater.network!,
                    ),
                  if (repeater.locator != null)
                    _DetailTile(
                      icon: Icons.grid_on,
                      label: 'Locator',
                      value: repeater.locator!,
                    ),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
