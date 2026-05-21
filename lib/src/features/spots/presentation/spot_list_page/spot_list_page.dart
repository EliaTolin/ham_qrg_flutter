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

@RoutePage()
class SpotListPage extends HookConsumerWidget {
  const SpotListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final recentSpotsAsync = ref.watch(recentSpotsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.spotListTitle)),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(recentSpotsProvider),
        child: recentSpotsAsync.when(
          data: (spots) {
            if (spots.isEmpty) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: EmptyStateWidget(
                      icon: Icons.cell_tower,
                      message: l10n.spotListEmpty,
                    ),
                  ),
                ],
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      ? () {} // UI re-derives state on next countdown tick
                      : null,
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (_, __) => ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ),
    );
  }
}
