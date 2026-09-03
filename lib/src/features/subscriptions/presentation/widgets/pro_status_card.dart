import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/pro/pro_badge.dart';
import 'package:hamqrg/common/widgets/pro/pro_shine_surface.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_price_line.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _kRadius = 16.0;

/// Profile entry point for HamQRG Pro.
///
/// Shows an active-Pro badge when the user owns the entitlement, otherwise an
/// upgrade CTA that opens the RevenueCat paywall.
///
/// I due stati hanno peso visivo diverso di proposito: la CTA è una superficie
/// d'oro percorsa da un riflesso animato, perché deve chiamare l'attenzione;
/// lo stato "attivo" resta la card tranquilla del tema, perché a chi ha già
/// pagato non si vende nulla.
class ProStatusCard extends ConsumerWidget {
  const ProStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPro = ref.watch(isProProvider).value ?? false;

    // Widget distinti e non un `if` nel build: così il ticker del riflesso
    // esiste solo per chi vede la CTA.
    if (isPro) return const _ActiveCard();

    // Prezzo e ripristino stanno **sotto** la card, non dentro: la card
    // dorata deve restare due righe (un sottotitolo che va a capo la fa
    // crescere e le toglie la forma di pulsante), e il profilo è il posto
    // dove un abbonato che ha reinstallato va a cercare "Ripristina
    // acquisti".
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _UpgradeCard(),
        ProPriceLine(placement: PaywallPlacement.proStatusCard),
      ],
    );
  }
}

class _UpgradeCard extends HookConsumerWidget {
  const _UpgradeCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final analytics = ref.read(analyticsClientProvider);

    // Questa card è la superficie con più impression dell'app — la vede
    // chiunque apra il profilo — ed è rimasta a lungo l'unica senza misura:
    // se ne conoscevano gli acquisti solo come differenza fra il totale e le
    // altre superfici.
    useEffect(
      () {
        analytics.track(
          AnalyticsEvent.coverageTeaserShown,
          surface: AnalyticsSurface.profileCard,
        );
        return null;
      },
      const [],
    );

    return ProShineSurface(
      borderRadius: _kRadius,
      glow: true,
      onTap: () => openPaywall(
        ref,
        PaywallPlacement.proStatusCard,
        surface: AnalyticsSurface.profileCard,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.onProGold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.onProGold,
                size: 20,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.proCardUpgradeTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.onProGold,
                    ),
                  ),
                  Text(
                    l10n.proCardUpgradeSubtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onProGold.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            // Marchio impresso sul bordo: pillola scura, perché qui il fondo
            // è già oro.
            const ProBadge.onGold(),
            const Gap(4),
            Icon(
              Icons.chevron_right,
              color: AppColors.onProGold.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
    );
  }
}

/// Chi ha già pagato non va venduto — ma non va nemmeno lasciato senza
/// uscite. Senza una strada in-app per vedere il piano, cambiarlo o disdire,
/// l'unica alternativa è cercarla nelle impostazioni dello store: chi non la
/// trova lascia una recensione negativa invece di uscire in silenzio, e chi
/// ha una carta scaduta se ne accorge quando l'abbonamento è già decaduto.
class _ActiveCard extends ConsumerWidget {
  const _ActiveCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_kRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.workspace_premium,
                color: colorScheme.onPrimary,
                size: 20,
              ),
            ),
            title: Text(
              l10n.proCardActiveTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            subtitle: Text(
              l10n.proCardActiveSubtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onPrimaryContainer.withValues(alpha: .7),
              ),
            ),
            trailing: Icon(Icons.verified, color: colorScheme.primary),
          ),
          // Bottone a sé e non tocco sulla riga: l'unica azione della card
          // deve essere leggibile prima di toccarla, non dopo.
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: TextButton.icon(
                onPressed: () =>
                    ref.read(revenueCatClientProvider).presentCustomerCenter(),
                icon: const Icon(Icons.settings_outlined, size: 18),
                label: Text(l10n.proManageSubscription),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
