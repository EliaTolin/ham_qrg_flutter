import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/spots/domain/spot_state.dart';
import 'package:hamqrg/src/features/spots/presentation/widgets/spot_countdown.dart';
import 'package:hamqrg/src/features/spots/provider/close_spot/close_spot_provider.dart';
import 'package:hamqrg/src/features/spots/provider/my_active_spot_notifier/my_active_spot_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveSpotBanner extends HookConsumerWidget {
  const ActiveSpotBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySpotAsync = ref.watch(myActiveSpotProvider);
    final spot = mySpotAsync.value;

    if (spot == null || !spot.isActive) return const SizedBox.shrink();

    final l10n = context.localization;
    final theme = Theme.of(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(spot.id),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.cell_tower,
              size: 20,
              color: theme.colorScheme.onPrimaryContainer,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.spotActiveYou,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withValues(alpha: .7),
                    ),
                  ),
                  Text(
                    spot.repeaterCallsign ?? spot.repeaterName ?? '',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            if (spot.expiresAt != null)
              SpotCountdown(
                expiresAt: spot.expiresAt!,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
                onExpired: () {
                  ref.read(myActiveSpotProvider.notifier).clearExpired();
                },
              ),
            const Gap(8),
            SizedBox(
              height: 32,
              child: TextButton(
                onPressed: () async {
                  await ref.read(
                    closeSpotProvider(spotId: spot.id).future,
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                ),
                child: Text(l10n.spotActiveClose),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
