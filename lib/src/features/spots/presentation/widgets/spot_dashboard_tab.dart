import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/empty_state_widget.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_card.dart';
import 'package:hamqrg/src/features/spots/provider/recent_spots_notifier/recent_spots_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotDashboardTab extends HookConsumerWidget {
  const SpotDashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final recentSpotsAsync = ref.watch(recentSpotsProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with "Vedi tutti"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.spotListTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => context.router.push(const SpotListRoute()),
              child: Text(l10n.spotListViewAll),
            ),
          ],
        ),
        const Gap(4),
        // Spot list
        recentSpotsAsync.when(
          data: (spots) {
            if (spots.isEmpty) {
              return EmptyStateWidget(
                icon: Icons.cell_tower,
                message: l10n.spotListEmpty,
                iconSize: 36,
              );
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: spots.length,
              itemBuilder: (context, index) {
                final spot = spots[index];
                return SpotCard(
                  spot: spot,
                  showRepeaterName: true,
                  onTap: () => context.router.push(
                    RepeaterDetailRoute(repeaterId: spot.repeaterId),
                  ),
                  onExpired: spot.isSelfSpot && spot.isActive
                      ? () {} // UI will re-derive state on next tick
                      : null,
                );
              },
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
          error: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.error_message_retry),
                const Gap(8),
                TextButton(
                  onPressed: () => ref.invalidate(recentSpotsProvider),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
