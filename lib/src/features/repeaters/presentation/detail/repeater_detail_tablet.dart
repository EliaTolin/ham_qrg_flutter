import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/repeater_detail_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/controller/state/repeater_detail_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/access_modes_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/community/community_reports_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/coverage_promo_card.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/frequency_fun_facts_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/location_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/performance_metrics_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_detail_action_buttons.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/repeater_header.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/technical_data_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/widgets/repeater_reach_badge.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_other_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/create_spot_sheet/create_spot_sheet.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/active_spots_section.dart';
import 'package:hamqrg/src/features/spots/provider/active_spots_notifier/active_spots_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Tablet/desktop layout for the repeater detail page.
///
/// Master/detail "radio operator console" composition:
/// - Left rail (380px, sticky): rig specs — actions, technical data, access
///   modes, location.
/// - Right column (flex, scrollable): live activity — cluster, community,
///   frequency facts.
/// - Vertical "spectrum" divider between the two columns colored with the
///   access modes of the repeater.
class RepeaterDetailTablet extends StatelessWidget {
  const RepeaterDetailTablet({
    required this.state,
    required this.controller,
    super.key,
  });

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RepeaterHeader(repeater: state.repeater),
        SliverFillRemaining(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 380,
                child: _LeftRail(
                  state: state,
                  controller: controller,
                ),
              ),
              _AccessSpectrumDivider(repeater: state.repeater),
              Expanded(
                child: _RightColumn(
                  state: state,
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Left rail — sticky "rig specs"
// ---------------------------------------------------------------------------
class _LeftRail extends StatelessWidget {
  const _LeftRail({required this.state, required this.controller});

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surfaceContainerLowest,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RepeaterDetailActionButtons(repeater: state.repeater),
            const SizedBox(height: 24),
            RepeaterReachBadge(repeater: state.repeater),
            const SizedBox(height: 24),
            const _ConsoleLabel(text: 'TECHNICAL DATA'),
            const SizedBox(height: 12),
            TechnicalDataSection(repeater: state.repeater),
            const SizedBox(height: 24),
            const _ConsoleLabel(text: 'ACCESS MODES'),
            const SizedBox(height: 12),
            AccessModesSection(repeater: state.repeater),
            const SizedBox(height: 24),
            CoveragePromoCard(repeater: state.repeater),
            const SizedBox(height: 24),
            const _ConsoleLabel(text: 'LOCATION'),
            const SizedBox(height: 12),
            LocationSection(
              repeater: state.repeater,
              calculatedDistanceKm: controller.getDistanceToRepeater(),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Right column — live activity
// ---------------------------------------------------------------------------
class _RightColumn extends StatelessWidget {
  const _RightColumn({required this.state, required this.controller});

  final RepeaterDetailState state;
  final RepeaterDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ConsoleSectionCard(
            label: 'CLUSTER',
            trailing: _ClusterTrailing(repeaterId: state.repeater.id),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ClusterActions(repeater: state.repeater),
                const SizedBox(height: 16),
                ActiveSpotsSection(repeaterId: state.repeater.id),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _ConsoleSectionCard(
            label: 'COMMUNITY',
            trailing: _LikesBadge(
              count: state.feedbackStats?.likesTotal ?? 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PerformanceMetricsSection(stats: state.feedbackStats),
                const SizedBox(height: 16),
                CommunityReportsSection(
                  state: state,
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _ConsoleSectionCard(
            label: 'FREQUENCY FACTS',
            child: FrequencyFunFactsSection(
              repeater: state.repeater,
              distanceKm: controller.getDistanceToRepeater(),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Vertical "spectrum" divider — gradient of access mode colors.
// ---------------------------------------------------------------------------
class _AccessSpectrumDivider extends StatelessWidget {
  const _AccessSpectrumDivider({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = repeater.accesses
        .map((a) => AccessModeHelper.getAccessModeColorObject(a.mode))
        .toSet()
        .toList();

    final gradientColors = colors.isEmpty
        ? [
            theme.colorScheme.outlineVariant,
            theme.colorScheme.outlineVariant,
          ]
        : colors.length == 1
            ? [colors.first, colors.first]
            : colors;

    return SizedBox(
      width: 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              for (final c in gradientColors) c.withValues(alpha: 0.55),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Console aesthetic primitives
// ---------------------------------------------------------------------------

/// Small uppercase label with an underline — like a label on radio equipment.
class _ConsoleLabel extends StatelessWidget {
  const _ConsoleLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          text,
          style: theme.textTheme.labelSmall?.copyWith(
            fontFamily: 'monospace',
            letterSpacing: 1.4,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}

/// Card container for the right column with a console label header.
class _ConsoleSectionCard extends StatelessWidget {
  const _ConsoleSectionCard({
    required this.label,
    required this.child,
    this.trailing,
  });

  final String label;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: _ConsoleLabel(text: label)),
                if (trailing != null) ...[
                  const SizedBox(width: 12),
                  trailing!,
                ],
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Cluster section helpers (right column)
// ---------------------------------------------------------------------------
class _ClusterActions extends ConsumerWidget {
  const _ClusterActions({required this.repeater});

  final Repeater repeater;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () async {
              final authenticated = await requireAuthentication(context, ref);
              if (!authenticated || !context.mounted) return;
              await showCreateSpotSheet(
                context,
                repeaterId: repeater.id,
                accesses: repeater.accesses,
              );
            },
            icon: const Icon(Icons.cell_tower, size: 18),
            label: Text(l10n.spotCreateTitle),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final authenticated = await requireAuthentication(context, ref);
              if (!authenticated || !context.mounted) return;
              await showCreateOtherSpotSheet(
                context,
                repeaterId: repeater.id,
                accesses: repeater.accesses,
              );
            },
            icon: const Icon(Icons.person_search, size: 18),
            label: Text(l10n.spotCreateOtherTitle),
          ),
        ),
      ],
    );
  }
}

class _ClusterTrailing extends ConsumerWidget {
  const _ClusterTrailing({required this.repeaterId});

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final spotsAsync = ref.watch(activeSpotsProvider(repeaterId));
    final activeCount = spotsAsync.maybeWhen(
      data: (spots) => spots.where((s) => s.isActive).length,
      orElse: () => 0,
    );

    if (activeCount == 0) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _PulsingLiveDot(),
        const SizedBox(width: 8),
        Text(
          activeCount == 1 ? '1 LIVE' : '$activeCount LIVE',
          style: theme.textTheme.labelSmall?.copyWith(
            fontFamily: 'monospace',
            letterSpacing: 1.2,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.error,
          ),
        ),
      ],
    );
  }
}

class _LikesBadge extends StatelessWidget {
  const _LikesBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.thumb_up_rounded,
            size: 13,
            color: theme.colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 5),
          Text(
            '$count',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onTertiaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingLiveDot extends StatefulWidget {
  const _PulsingLiveDot();

  @override
  State<_PulsingLiveDot> createState() => _PulsingLiveDotState();
}

class _PulsingLiveDotState extends State<_PulsingLiveDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.error;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return SizedBox(
          width: 14,
          height: 14,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.25 * (1 - t)),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.6),
                      blurRadius: 4 + 4 * t,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
