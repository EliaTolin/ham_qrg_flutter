import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/presentation/require_pro.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Durata di un ciclo del riflesso. La luce attraversa la card solo nella
/// prima frazione ([_kShineSweep]), il resto è pausa: un luccichio continuo
/// diventa rumore di fondo e smette di richiamare l'occhio.
const _kShinePeriod = Duration(milliseconds: 3400);
const _kShineSweep = 0.34;

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
    return isPro ? const _ActiveCard() : const _UpgradeCard();
  }
}

class _UpgradeCard extends HookConsumerWidget {
  const _UpgradeCard();

  /// Banda di luce diagonale centrata su [t] (0 = fuori a sinistra,
  /// 1 = fuori a destra). Il clamp tiene gli stop ordinati agli estremi.
  static LinearGradient _shine(double t) {
    final center = -0.4 + t * 1.8;
    double at(double offset) => (center + offset).clamp(0.0, 1.0);

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.proShine.withValues(alpha: 0),
        AppColors.proShine.withValues(alpha: 0),
        AppColors.proShine.withValues(alpha: 0.75),
        AppColors.proShine.withValues(alpha: 0),
        AppColors.proShine.withValues(alpha: 0),
      ],
      stops: [0, at(-0.18), at(0), at(0.18), 1],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final theme = Theme.of(context);

    // iOS "Riduci movimento" / Android "Rimuovi animazioni": la card resta
    // dorata, ma ferma.
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final shine = useAnimationController(duration: _kShinePeriod);
    useEffect(
      () {
        if (reduceMotion) return null;
        shine.repeat();
        return shine.stop;
      },
      [reduceMotion, shine],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_kRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.proGold.withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_kRadius),
        clipBehavior: Clip.antiAlias,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.proGoldLight, AppColors.proGold],
            ),
          ),
          child: InkWell(
            onTap: () => openPaywall(ref, PaywallPlacement.proStatusCard),
            splashColor: AppColors.onProGold.withValues(alpha: 0.08),
            highlightColor: AppColors.onProGold.withValues(alpha: 0.05),
            child: Stack(
              children: [
                // Il riflesso sta SOTTO il contenuto: attraversa l'oro mentre
                // testo e icone restano opachi. Sopra, schiarirebbe anche il
                // testo e a ogni passaggio la card diventerebbe illeggibile.
                if (!reduceMotion)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedBuilder(
                        animation: shine,
                        builder: (context, _) {
                          final t = Curves.easeInOut.transform(
                            (shine.value / _kShineSweep).clamp(0.0, 1.0),
                          );
                          return DecoratedBox(
                            decoration: BoxDecoration(gradient: _shine(t)),
                          );
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
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
                                color: AppColors.onProGold.withValues(
                                  alpha: 0.75,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(12),
                      // Marchio impresso sul bordo: pillola scura, lettere
                      // dorate. 'PRO' è l'acronimo di marca — uno dei pochi
                      // literal ammessi fuori dall'ARB, e non si traduce.
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.onProGold,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'PRO',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.proGoldLight,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                            height: 1,
                          ),
                        ),
                      ),
                      const Gap(4),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.onProGold.withValues(alpha: 0.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActiveCard extends StatelessWidget {
  const _ActiveCard();

  @override
  Widget build(BuildContext context) {
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
      child: ListTile(
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
    );
  }
}
