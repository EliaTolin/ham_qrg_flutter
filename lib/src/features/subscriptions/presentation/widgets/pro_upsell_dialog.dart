import 'package:flutter/material.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/analytics/impl/supabase_analytics_client.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/pro/pro_badge.dart';
import 'package:hamqrg/common/widgets/pro/pro_benefits_list.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/widgets/pro_price_line.dart';
import 'package:hamqrg/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Passo di valore da anteporre alla paywall.
///
/// Serve dovunque il tocco dell'utente non sia già una richiesta d'acquisto:
/// presentare la paywall a freddo, senza dire prima cosa si compra, insegna
/// all'utente che i tocchi nell'app possono costare — e deprime i tocchi
/// successivi ovunque, non solo qui.
///
/// Composto sempre nello stesso ordine, che è quello della decisione:
/// immagine → promessa → cosa ottieni → azione → quanto costa → più tardi.
/// Il prezzo sta **sotto** la CTA e non sopra: prima il valore, poi il costo.
Future<bool> showProUpsellDialog(
  BuildContext context,
  WidgetRef ref, {
  required PaywallPlacement placement,
  required AnalyticsSurface surface,
  required String title,
  required String body,
  required List<String> benefits,
  required String ctaLabel,
  Widget? header,
  bool inPlace = false,
}) async {
  // La superficie è stata mostrata: è il denominatore del suo tasso di
  // conversione. Registrata qui, all'apertura, e non nel widget, così vale
  // una volta sola per apertura e non a ogni ricostruzione.
  ref.read(analyticsClientProvider).track(
        AnalyticsEvent.coverageTeaserShown,
        surface: surface,
      );

  final wantsToBuy = await showDialog<bool>(
        context: context,
        builder: (_) => _ProUpsellDialog(
          placement: placement,
          title: title,
          body: body,
          benefits: benefits,
          ctaLabel: ctaLabel,
          header: header,
        ),
      ) ??
      false;
  if (!wantsToBuy) return false;

  // La paywall si apre **dopo** che il dialog è uscito di scena, non sopra di
  // esso: presentarla su un dialog ancora montato lascia due modali
  // sovrapposte, e la ricostruzione dell'albero che segue l'acquisto le
  // troverebbe entrambe da smontare.
  return inPlace
      ? openPaywallInPlace(ref, placement, surface: surface)
      : openPaywall(ref, placement, surface: surface);
}

class _ProUpsellDialog extends StatelessWidget {
  const _ProUpsellDialog({
    required this.placement,
    required this.title,
    required this.body,
    required this.benefits,
    required this.ctaLabel,
    this.header,
  });

  final PaywallPlacement placement;
  final String title;
  final String body;
  final List<String> benefits;
  final String ctaLabel;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                header ?? _FallbackHeader(theme: theme),
                const Positioned(top: 12, left: 12, child: ProBadge()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.75),
                      height: 1.4,
                    ),
                  ),
                  if (benefits.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    ProBenefitsList(
                      items: benefits,
                      alignment: CrossAxisAlignment.center,
                    ),
                  ],
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
                        ctaLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                  ProPriceLine(placement: placement),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      l10n.reachUpsellLater,
                      style: TextStyle(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Testata per le superfici che non hanno un'immagine da mostrare.
class _FallbackHeader extends StatelessWidget {
  const _FallbackHeader({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surfaceContainerHighest,
            theme.colorScheme.surface,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.proGold.withValues(alpha: 0.18),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.proGold.withValues(alpha: 0.6)),
        ),
        child: const Icon(
          Icons.workspace_premium_rounded,
          color: AppColors.proGold,
          size: 40,
        ),
      ),
    );
  }
}
