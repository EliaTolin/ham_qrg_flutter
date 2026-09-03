import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_upsell_dialog.dart';

/// Upsell mostrato quando un utente non Pro tocca "cosa raggiungo da qui".
///
/// È il passo di valore che precede la paywall; la struttura (testata,
/// promessa, vantaggi, CTA, prezzo, "più tardi") è quella condivisa da tutte
/// le superfici — vedi [showProUpsellDialog]. Qui restano solo le due cose
/// che sono davvero di questa schermata: l'anteprima della mappa e il testo.
///
/// [surface] dice da quale punto d'ingresso arriva l'utente, così i tassi di
/// conversione delle diverse superfici restano confrontabili fra loro (FR-065).
Future<void> showReachabilityUpsell(
  BuildContext context,
  WidgetRef ref, {
  required AnalyticsSurface surface,
}) {
  final l10n = context.localization;

  return showProUpsellDialog(
    context,
    ref,
    placement: PaywallPlacement.reachabilityUpsell,
    surface: surface,
    title: l10n.reachUpsellTitle,
    body: l10n.reachUpsellBody,
    benefits: [
      l10n.reachUpsellBenefitSignal,
      l10n.reachUpsellBenefitTerrain,
      l10n.coverageTeaserBenefitAnywhere,
    ],
    ctaLabel: l10n.reachDiscoverCta,
    header: Image.asset(
      'assets/images/reachable_map_mock.png',
      width: double.infinity,
      height: 220,
      fit: BoxFit.cover,
    ),
  );
}
