import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/empty_state_widget.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_card.dart';
import 'package:hamqrg/src/features/spots/provider/active_spots_notifier/active_spots_notifier.dart';
import 'package:hamqrg/src/features/spots/provider/close_spot/close_spot_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveSpotsSection extends HookConsumerWidget {
  const ActiveSpotsSection({required this.repeaterId, super.key});

  final String repeaterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final spotsAsync = ref.watch(activeSpotsProvider(repeaterId));
    final currentUserId = Supabase.instance.client.auth.currentUser?.id;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.spotHistorySection,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(8),
        spotsAsync.when(
          data: (spots) {
            if (spots.isEmpty) {
              return EmptyStateWidget(
                icon: Icons.cell_tower,
                message: l10n.spotActiveNone,
                cta: l10n.spotActiveCta,
              );
            }
            final notifier = ref.read(activeSpotsProvider(repeaterId).notifier);
            return Column(
              children: [
                ...spots.map(
                  (spot) => SpotCard(
                    spot: spot,
                    currentUserId: currentUserId,
                    onClose: spot.isSelfSpot &&
                            spot.isActive &&
                            currentUserId != null &&
                            spot.userId == currentUserId
                        ? () async {
                            await ref.read(
                              closeSpotProvider(spotId: spot.id).future,
                            );
                          }
                        : null,
                  ),
                ),
                if (notifier.hasMore)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: notifier.isLoadingMore
                        ? const Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : Center(
                            child: TextButton(
                              onPressed: notifier.loadMore,
                              child: Text(l10n.spotListViewAll),
                            ),
                          ),
                  ),
              ],
            );
          },
          loading: () => const _LoadingSkeleton(),
          error: (_, __) => _ErrorState(
            onRetry: () => ref.invalidate(
              activeSpotsProvider(repeaterId),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(l10n.error_message_retry),
          const Gap(8),
          TextButton(
            onPressed: onRetry,
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}
