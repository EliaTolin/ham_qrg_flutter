import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Cosa vede un utente non Pro al posto della lista.
///
/// Non una schermata vuota con un lucchetto (FR-056): postazioni di esempio
/// realistiche, sfocate, che mostrano **la forma** di ciò che otterrebbe.
/// Nessun dato reale è coinvolto — sono nomi di luogo generici e conteggi
/// finti, quindi non c'è nulla da tradurre né da proteggere.
class StationsShowcase extends HookConsumerWidget {
  const StationsShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final analytics = ref.read(analyticsClientProvider);

    useEffect(
      () {
        analytics.track(
          AnalyticsEvent.coverageTeaserShown,
          surface: AnalyticsSurface.stationsList,
        );
        return null;
      },
      const [],
    );

    Future<void> unlock() async {
      analytics
        ..track(
          AnalyticsEvent.coverageCtaTapped,
          surface: AnalyticsSurface.stationsList,
        )
        ..track(
          AnalyticsEvent.coveragePaywallShown,
          surface: AnalyticsSurface.stationsList,
        );
      final purchased = await openReachabilityPaywallInPlace(ref);
      analytics.track(
        purchased
            ? AnalyticsEvent.coveragePurchaseCompleted
            : AnalyticsEvent.coveragePaywallDismissed,
        surface: AnalyticsSurface.stationsList,
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        ProBlurGate(
          locked: true,
          title: l10n.stationsTitle,
          subtitle: l10n.coverageTeaserBenefitOffline,
          ctaLabel: l10n.reachDiscoverCta,
          onUnlock: unlock,
          teaser: const _MockStations(),
          child: const SizedBox.shrink(),
        ),
        const SizedBox(height: 20),
        for (final benefit in [
          l10n.coverageTeaserBenefitAnywhere,
          l10n.coverageTeaserBenefitOffline,
          l10n.coverageTeaserBenefitSave,
        ])
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(benefit, style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        Align(
          child: TextButton(
            onPressed: unlock,
            child: Text(l10n.coverageTeaserRestore),
          ),
        ),
      ],
    );
  }
}

class _MockStations extends StatelessWidget {
  const _MockStations();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Icons.place_rounded,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 13,
                      width: 140 - index * 20,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurfaceVariant
                            .withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '•• · ⬇ ••/••/••',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
