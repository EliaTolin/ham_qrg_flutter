import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/reachable_repeaters_sheet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/reachable/widgets/reachability_upsell_dialog.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';

/// Compact map control: "what do I reach from here?". Pro users open the
/// reachable list; non-Pro users get the catchy upsell dialog → paywall.
class ReachableMapButton extends ConsumerWidget {
  const ReachableMapButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Watch here so the provider stays warm and resolved while the button is
    // visible; the tap handler then reads the settled value synchronously.
    ref.watch(isProProvider);

    return Material(
      color: theme.colorScheme.primary,
      elevation: 4,
      borderRadius: BorderRadius.circular(24),
      shadowColor: theme.shadowColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => _onTap(context, ref),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cell_tower_rounded, color: theme.colorScheme.onPrimary, size: 20),
              const SizedBox(width: 8),
              Text(
                context.localization.reachMapButton,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    // The provider is kept warm by the watch in build(), so the settled value
    // is available synchronously here (no fragile `.future` await).
    final isPro = ref.read(isProProvider).value ?? false;
    if (!isPro) {
      await showReachabilityUpsell(context, ref);
      return;
    }
    final pos = await ref.read(cachedUserPositionProvider.future);
    if (!context.mounted) return;
    await ReachableRepeatersSheet.show(
      context,
      latitude: pos.latitude,
      longitude: pos.longitude,
    );
  }
}
