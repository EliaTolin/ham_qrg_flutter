import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/extension/unit_system_extension.dart';
import 'package:hamqrg/common/widgets/pro/pro_benefits_list.dart';
import 'package:hamqrg/common/widgets/pro/pro_blur_gate.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_price_line.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Cosa vede un utente non Pro dopo aver scelto un punto.
///
/// Il momento è il più prezioso dell'intero flusso: l'utente ha appena scelto
/// **il suo** posto ed è emotivamente investito. Per questo il titolo porta il
/// nome che ha appena cercato, invece di una frase generica su un lucchetto.
///
/// Nessun calcolo viene eseguito dietro a questo widget (FR-014): i valori
/// sfocati sono segnaposto finti, non un risultato reale offuscato. Non
/// trapela alcun dato e il traffico gratuito non genera costo di servizio.
class CoverageTeaser extends HookConsumerWidget {
  const CoverageTeaser({required this.point, super.key});

  final SearchPoint point;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final analytics = ref.read(analyticsClientProvider);

    // Una sola registrazione per punto scelto: contare le ricostruzioni
    // gonfierebbe il numeratore e renderebbe il tasso di conversione falso.
    useEffect(
      () {
        analytics.track(
          AnalyticsEvent.coverageTeaserShown,
          surface: AnalyticsSurface.mapTeaser,
        );
        return null;
      },
      [point],
    );

    Future<void> unlock() async {
      // Gli eventi del funnel (CTA toccata, paywall mostrata, esito) li
      // registra `openPaywallInPlace`: qui resterebbero da riscrivere a mano
      // a ogni superficie, ed è così che tre punti vendita su sette erano
      // finiti senza misura.
      await openPaywallInPlace(
        ref,
        PaywallPlacement.coverageTeaser,
        surface: AnalyticsSurface.mapTeaser,
      );
      // Nessun `replaceAll` su questo percorso: la mappa resta montata, quindi
      // il pin è ancora al suo posto e `isProProvider`, invalidato
      // dall'acquisto, fa ripartire da solo il calcolo reale sullo stesso
      // punto (FR-031).
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProBlurGate(
          locked: true,
          title: l10n.coverageTeaserTitle(point.label),
          subtitle: l10n.coverageTeaserBody,
          ctaLabel: l10n.reachDiscoverCta,
          onUnlock: unlock,
          teaser: const _MockResultList(),
          footer: const ProPriceLine(
            placement: PaywallPlacement.coverageTeaser,
          ),
          // Mai costruito: `locked` è sempre true in questo widget, che
          // esiste soltanto per gli utenti senza Pro.
          child: const SizedBox.shrink(),
        ),
        const SizedBox(height: 16),
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

/// Righe finte che riproducono la **forma** del risultato reale.
///
/// I valori sono simboli non linguistici, non testo da tradurre e non dati:
/// mostrano com'è fatta la risposta senza rivelarne una.
class _MockResultList extends StatelessWidget {
  const _MockResultList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(
                Icons.cell_tower_rounded,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 120,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurfaceVariant
                            .withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '-•• dBm · •• ${context.units.longSymbol}',
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
