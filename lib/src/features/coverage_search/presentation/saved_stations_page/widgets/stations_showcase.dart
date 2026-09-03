import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/pro/pro_benefits_list.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_price_line.dart';
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
      await openPaywallInPlace(
        ref,
        PaywallPlacement.savedStationsShowcase,
        surface: AnalyticsSurface.stationsList,
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        ProBlurGate(
          locked: true,
          // Copy sua, non l'etichetta della lista: a chi non ha ancora
          // comprato, "Le mie postazioni" descrive una lista vuota, non un
          // motivo per pagare.
          title: l10n.stationsShowcaseTitle,
          subtitle: l10n.stationsShowcaseBody,
          ctaLabel: l10n.reachDiscoverCta,
          onUnlock: unlock,
          teaser: const _MockStations(),
          footer: const ProPriceLine(
            placement: PaywallPlacement.savedStationsShowcase,
          ),
          child: const SizedBox.shrink(),
        ),
        const SizedBox(height: 20),
        ProBenefitsList(
          items: [
            l10n.coverageTeaserBenefitAnywhere,
            l10n.coverageTeaserBenefitOffline,
            l10n.coverageTeaserBenefitSave,
          ],
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
