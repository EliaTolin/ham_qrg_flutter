import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/utils/access_mode_helper.dart';
import 'package:hamqrg/common/utils/repeater_format_helper.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/widgets/icons/repeater_access_icon.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/show_registration_prompt.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/repeater_access.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/controller/repeater_details_sheet_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/sheet/repeater_details_sheet/controller/state/repeater_details_sheet_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Shows a modal bottom sheet with repeater details.
///
/// This is the main entry point for showing the repeater details sheet.
/// It takes only the [repeaterId] and fetches all necessary data internally.
Future<void> showRepeaterDetailsSheet(
  BuildContext context,
  String repeaterId,
) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: RepeaterDetailsSheetContent(
          repeaterId: repeaterId,
          scrollController: scrollController,
        ),
      ),
    ),
  );
}

/// The content widget for the repeater details sheet.
///
/// Uses [RepeaterDetailsSheetController] to manage state and data fetching.
class RepeaterDetailsSheetContent extends ConsumerWidget {
  const RepeaterDetailsSheetContent({
    required this.repeaterId,
    this.scrollController,
    super.key,
  });

  final String repeaterId;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(
      repeaterDetailsSheetControllerProvider(repeaterId),
    );

    return asyncState.when(
      data: (state) => _RepeaterDetailsContent(
        state: state,
        scrollController: scrollController,
        onToggleFavorite: () async {
          final isAuthenticated = await requireAuthentication(context, ref);
          if (!isAuthenticated) return;

          await ref
              .read(repeaterDetailsSheetControllerProvider(repeaterId).notifier)
              .toggleFavorite();
        },
      ),
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(48),
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                context.localization.error,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.invalidate(
                  repeaterDetailsSheetControllerProvider(repeaterId),
                ),
                child: Text(context.localization.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RepeaterDetailsContent extends StatelessWidget {
  const _RepeaterDetailsContent({
    required this.state,
    required this.onToggleFavorite,
    this.scrollController,
  });

  final RepeaterDetailsSheetState state;
  final ScrollController? scrollController;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final repeater = state.repeater;
    final colorMode = RepeaterAccessIcon.getPrimaryColor(repeater.accesses);
    final likesTotal = state.feedbackStats?.likesTotal ?? 0;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Callsign with badge
              Row(
                children: [
                  Expanded(
                    child: Text(
                      repeater.callsign ?? repeater.name ?? 'Unknown',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorMode.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: colorMode.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      RepeaterModeHelper.getModeLabel(repeater.mode, l10n).toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorMode,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Location
              Row(
                children: [
                  Icon(
                    Icons.terrain,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      [
                        repeater.locality,
                        repeater.region,
                      ].whereType<String>().join(', '),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Action row: Likes display + Favorite button (2 columns)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // Likes display (left column)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: colorScheme.primary,
                      size: 20,
                      fill: 1,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$likesTotal Likes',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Favorite button (right column)
              Expanded(
                child: _FavoriteButton(
                  isFavorite: state.isFavorite,
                  isLoading: state.isTogglingFavorite,
                  label: l10n.favorite,
                  onTap: onToggleFavorite,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Access Configuration section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 12),
                child: Text(
                  l10n.accessConfiguration.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 10,
                  ),
                ),
              ),
              ...repeater.accesses.map((access) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _AccessCard(
                    access: access,
                    repeater: repeater,
                  ),
                );
              }),
              if (repeater.accesses.isEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outline,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.noAccessConfiguration,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Additional info (altitude, locator, distance)
        if (repeater.locator != null || state.distanceInMeters != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                if (repeater.locator != null) ...[
                  _InfoChip(
                    icon: Icons.grid_on,
                    label: repeater.locator!,
                  ),
                  const SizedBox(width: 16),
                ],
                if (state.distanceInMeters != null)
                  _InfoChip(
                    icon: Icons.straighten,
                    label: RepeaterFormatHelper.formatDistance(
                      state.distanceInMeters,
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 24),
        // Details button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: () {
                context.router.push(
                  RepeaterDetailRoute(
                    repeaterId: repeater.id,
                  ),
                );
              },
              icon: const Icon(Icons.info_outline, size: 20),
              label: Text(l10n.details),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).viewPadding.bottom + 24,
        ),
      ],
    );

    if (scrollController != null) {
      return SingleChildScrollView(
        controller: scrollController,
        child: content,
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: content,
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.isFavorite,
    required this.isLoading,
    required this.label,
    required this.onTap,
  });

  final bool isFavorite;
  final bool isLoading;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const favoriteColor = Colors.pink;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: favoriteColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: favoriteColor.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: favoriteColor,
                  ),
                )
              else
                Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: favoriteColor,
                  size: 20,
                  fill: isFavorite ? 1 : 0,
                ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: favoriteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccessCard extends StatelessWidget {
  const _AccessCard({
    required this.access,
    required this.repeater,
  });

  final RepeaterAccess access;
  final Repeater repeater;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accessColor = AccessModeHelper.getAccessModeColorObject(access.mode);
    final accessIcon = AccessModeHelper.getAccessModeIcon(access.mode);
    final accessLabel = AccessModeHelper.getAccessModeLabel(access.mode);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline,
        ),
      ),
      child: Row(
        children: [
          // Mode icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accessColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(accessIcon, color: accessColor, size: 18),
          ),
          const SizedBox(width: 12),
          // Mode details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      accessLabel,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: colorScheme.outline,
                        ),
                      ),
                      child: Text(
                        RepeaterFormatHelper.formatFrequency(
                          repeater.frequencyHz,
                        ),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontFeatures: const [FontFeature.tabularFigures()],
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Access details row
                Wrap(
                  spacing: 12,
                  runSpacing: 4,
                  children: [
                    if (repeater.shiftHz != null || repeater.shiftRaw != null)
                      _AccessDetailItem(
                        label: 'SHIFT',
                        value: RepeaterFormatHelper.formatShift(
                          repeater.shiftHz,
                          repeater.shiftRaw,
                        ),
                      ),
                    if (access.ctcssTxHz != null || access.ctcssRxHz != null)
                      _AccessDetailItem(
                        label: 'TONE',
                        value: access.ctcssTxHz != null
                            ? '${access.ctcssTxHz!.toStringAsFixed(1)} Hz'
                            : '${access.ctcssRxHz!.toStringAsFixed(1)} Hz',
                      ),
                    if (access.colorCode != null)
                      _AccessDetailItem(
                        label: 'CC',
                        value: access.colorCode.toString(),
                      ),
                    if (access.dmrId != null)
                      _AccessDetailItem(
                        label: 'ID',
                        value: access.dmrId.toString(),
                      ),
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

class _AccessDetailItem extends StatelessWidget {
  const _AccessDetailItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.outlineVariant,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
