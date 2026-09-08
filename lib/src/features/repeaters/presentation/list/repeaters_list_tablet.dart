import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/access_modes_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/location_section.dart';
import 'package:hamqrg/src/features/repeaters/presentation/detail/widgets/technical_data_section.dart';

/// Tablet master/preview layout for the repeaters list.
///
/// Left: dense "operator catalog" — single-line callsign rows with a vertical
/// access-mode color band as visual anchor.
/// Right: live preview of the selected repeater using the same console
/// language as the detail tablet page, plus an action to open the full detail.
class RepeatersListTablet extends StatefulWidget {
  const RepeatersListTablet({
    required this.repeaters,
    required this.feedbackStats,
    super.key,
  });

  final List<Repeater> repeaters;
  final Map<String, RepeaterFeedbackStats> feedbackStats;

  @override
  State<RepeatersListTablet> createState() => _RepeatersListTabletState();
}

class _RepeatersListTabletState extends State<RepeatersListTablet> {
  String? _selectedId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selected =
        widget.repeaters.where((r) => r.id == _selectedId).firstOrNull;

    return Row(
      children: [
        SizedBox(
          width: 420,
          child: ColoredBox(
            color: theme.colorScheme.surfaceContainerLowest,
            child: _CatalogList(
              repeaters: widget.repeaters,
              feedbackStats: widget.feedbackStats,
              selectedId: _selectedId,
              onSelected: (id) => setState(() => _selectedId = id),
            ),
          ),
        ),
        Container(
          width: 1,
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            switchInCurve: Curves.easeOutCubic,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: selected == null
                ? const _PreviewEmptyState(key: ValueKey('empty'))
                : _PreviewPane(
                    key: ValueKey(selected.id),
                    repeater: selected,
                    feedbackStats: widget.feedbackStats[selected.id],
                  ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Catalog list (left pane)
// ---------------------------------------------------------------------------
class _CatalogList extends StatelessWidget {
  const _CatalogList({
    required this.repeaters,
    required this.feedbackStats,
    required this.selectedId,
    required this.onSelected,
  });

  final List<Repeater> repeaters;
  final Map<String, RepeaterFeedbackStats> feedbackStats;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: repeaters.length,
      separatorBuilder: (_, __) => const SizedBox(height: 2),
      itemBuilder: (context, index) {
        final repeater = repeaters[index];
        return _CatalogRow(
          repeater: repeater,
          feedbackStats: feedbackStats[repeater.id],
          selected: repeater.id == selectedId,
          onTap: () => onSelected(repeater.id),
        );
      },
    );
  }
}

class _CatalogRow extends StatelessWidget {
  const _CatalogRow({
    required this.repeater,
    required this.feedbackStats,
    required this.selected,
    required this.onTap,
  });

  final Repeater repeater;
  final RepeaterFeedbackStats? feedbackStats;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final distinctModes = repeater.accesses.map((a) => a.mode).toSet().toList();
    final accessColors =
        distinctModes.map(AccessModeHelper.getAccessModeColorObject).toList();
    final bandColors = accessColors.isEmpty
        ? [colorScheme.outlineVariant, colorScheme.outlineVariant]
        : accessColors.length == 1
            ? [accessColors.first, accessColors.first]
            : accessColors;

    final likes = feedbackStats?.likesTotal ?? 0;

    return Material(
      color: selected ? colorScheme.surfaceContainerHigh : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 4,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      for (final c in bandColors)
                        c.withValues(alpha: selected ? 1.0 : 0.55),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            repeater.callsign ?? repeater.name ?? 'Unknown',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          RepeaterFormatHelper.formatFrequency(
                            repeater.frequencyHz,
                          ),
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                            fontFeatures: const [
                              FontFeature.tabularFigures(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        for (final mode in distinctModes) ...[
                          _ModeChip(
                            color:
                                AccessModeHelper.getAccessModeColorObject(mode),
                            label: AccessModeHelper.getAccessModeLabel(mode),
                          ),
                          const SizedBox(width: 4),
                        ],
                        if (distinctModes.isNotEmpty) const SizedBox(width: 4),
                        if (repeater.locality != null) ...[
                          Flexible(
                            child: Text(
                              repeater.locality!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (repeater.distanceMeters != null) ...[
                          Icon(
                            Icons.near_me_outlined,
                            size: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            context.units.distance(repeater.distanceMeters!),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (likes > 0) ...[
                          Icon(
                            Icons.thumb_up_rounded,
                            size: 12,
                            color: colorScheme.tertiary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '$likes',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Preview pane (right) — empty state + populated state
// ---------------------------------------------------------------------------
class _ModeChip extends StatelessWidget {
  const _ModeChip({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 10,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}

class _PreviewEmptyState extends StatelessWidget {
  const _PreviewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cell_tower,
            size: 56,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            '// SELECT FROM CATALOG',
            style: theme.textTheme.labelMedium?.copyWith(
              fontFamily: 'monospace',
              letterSpacing: 1.6,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewPane extends StatelessWidget {
  const _PreviewPane({
    required this.repeater,
    required this.feedbackStats,
    super.key,
  });

  final Repeater repeater;
  final RepeaterFeedbackStats? feedbackStats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PreviewHeader(repeater: repeater, feedbackStats: feedbackStats),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => context.router.push(
              RepeaterDetailRoute(repeaterId: repeater.id),
            ),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(l10n.repeaterViewFullDetails),
          ),
          const SizedBox(height: 28),
          const _ConsoleLabel(text: 'TECHNICAL DATA'),
          const SizedBox(height: 12),
          TechnicalDataSection(repeater: repeater),
          const SizedBox(height: 24),
          const _ConsoleLabel(text: 'ACCESS MODES'),
          const SizedBox(height: 12),
          AccessModesSection(repeater: repeater),
          const SizedBox(height: 24),
          const _ConsoleLabel(text: 'LOCATION'),
          const SizedBox(height: 12),
          LocationSection(repeater: repeater),
        ],
      ),
    );
  }
}

class _PreviewHeader extends StatelessWidget {
  const _PreviewHeader({required this.repeater, required this.feedbackStats});

  final Repeater repeater;
  final RepeaterFeedbackStats? feedbackStats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final accessColors = repeater.accesses
        .map((a) => AccessModeHelper.getAccessModeColorObject(a.mode))
        .toSet()
        .toList();
    final gradientColors = accessColors.isEmpty
        ? [colorScheme.outlineVariant, colorScheme.outlineVariant]
        : accessColors.length == 1
            ? [accessColors.first, accessColors.first]
            : accessColors;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  for (final c in gradientColors) c.withValues(alpha: 0.85),
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (repeater.callsign != null)
                  Text(
                    repeater.callsign!,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                    ),
                  ),
                if (repeater.name != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    repeater.name!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (repeater.locality != null ||
                        repeater.region != null) ...[
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          [repeater.locality, repeater.region]
                              .whereType<String>()
                              .join(', '),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                    if ((feedbackStats?.likesTotal ?? 0) > 0) ...[
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.thumb_up_rounded,
                              size: 12,
                              color: colorScheme.onTertiaryContainer,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${feedbackStats!.likesTotal}',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.onTertiaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Console label (matches the detail tablet aesthetic)
// ---------------------------------------------------------------------------
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
