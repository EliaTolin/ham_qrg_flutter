import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Catchy upsell shown when a non-Pro user taps the map's "what do I reach"
/// button: a punchy value proposition that drives the Pro paywall.
///
/// [surface] dice da quale punto d'ingresso arriva l'utente, così i tassi di
/// conversione delle diverse superfici restano confrontabili fra loro (FR-065).
Future<void> showReachabilityUpsell(
  BuildContext context,
  WidgetRef ref, {
  required AnalyticsSurface surface,
}) {
  ref.read(analyticsClientProvider).track(
        AnalyticsEvent.coverageTeaserShown,
        surface: surface,
      );
  return showDialog<void>(
    context: context,
    builder: (ctx) => _ReachabilityUpsellDialog(surface: surface),
  );
}

class _ReachabilityUpsellDialog extends ConsumerWidget {
  const _ReachabilityUpsellDialog({required this.surface});

  final AnalyticsSurface surface;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Map preview header (the reachability mock).
          Stack(
            children: [
              Image.asset(
                'assets/images/reachable_map_mock.png',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.proGold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'PRO',
                    style: TextStyle(
                      color: AppColors.onProGold,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.reachUpsellTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.reachUpsellBody,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.proGold,
                      foregroundColor: AppColors.onProGold,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    icon: const Icon(Icons.bolt_rounded),
                    label: Text(
                      l10n.reachDiscoverCta,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      final analytics = ref.read(analyticsClientProvider)
                        ..track(
                          AnalyticsEvent.coverageCtaTapped,
                          surface: surface,
                        )
                        ..track(
                          AnalyticsEvent.coveragePaywallShown,
                          surface: surface,
                        );
                      Navigator.of(context).pop();
                      final purchased = await openPaywall(
                        ref,
                        PaywallPlacement.reachabilityUpsell,
                      );
                      analytics.track(
                        purchased
                            ? AnalyticsEvent.coveragePurchaseCompleted
                            : AnalyticsEvent.coveragePaywallDismissed,
                        surface: surface,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    l10n.reachUpsellLater,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
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
