import 'package:flutter/material.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/model/pro_price_hint.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_success_snackbar.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/subscriptions/domain/paywall_placement.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/src/features/subscriptions/provider/pro_price_hint/pro_price_hint_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Prezzo d'ingresso + "Ripristina acquisti", sotto una call to action Pro.
///
/// Due informazioni che mancavano ovunque, e per due obiezioni diverse:
///
/// - **"quanto mi costa?"** — finché il prezzo compare solo dentro la paywall,
///   il tocco è alla cieca, e chi teme un impegno di costo ignoto non lo fa.
/// - **"ho già pagato"** — chi reinstalla deve poter riavere il suo
///   abbonamento senza passare da una schermata che gli mostra un prezzo che
///   ha già pagato; è anche il modo più veloce per fargli credere di essere
///   stato addebitato due volte.
///
/// Sta in un widget solo perché ogni superficie di vendita le deve avere
/// entrambe: replicarle a mano è già costato una `onPressed` sbagliata, con il
/// bottone "Ripristina acquisti" che apriva la paywall d'acquisto.
class ProPriceLine extends ConsumerWidget {
  const ProPriceLine({
    required this.placement,
    this.foregroundColor,
    this.dense = false,
    super.key,
  });

  final PaywallPlacement placement;

  /// Colore del testo, per le superfici che non stanno su `surface` (la card
  /// dorata del profilo). Se assente vale `onSurfaceVariant`.
  final Color? foregroundColor;

  /// Solo il prezzo, su una riga, senza il bottone di ripristino.
  ///
  /// Il ripristino resta obbligatorio **nell'app**, non su ogni superficie:
  /// vive nel profilo (dove chi ha reinstallato va davvero a cercarlo), nei
  /// due gate a piena pagina, in ogni dialog di upsell e dentro la paywall
  /// stessa. Su un badge incastonato in una pagina di contenuto costerebbe
  /// una riga intera di area toccabile per un'azione che lì nessuno compie.
  final bool dense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.localization;
    final color = foregroundColor ?? theme.colorScheme.onSurfaceVariant;
    final hint = ref.watch(proPriceHintProvider(placement)).value;

    Future<void> restore() async {
      final restored =
          await ref.read(revenueCatClientProvider).restorePurchases();
      if (restored) ref.invalidate(isProProvider);
      if (!context.mounted) return;
      showSuccessSnackbar(
        context,
        restored ? l10n.proRestoreSuccess : l10n.proRestoreNone,
      );
    }

    final priceText = hint == null
        ? null
        : Text(
            _label(l10n, hint),
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: color),
          );

    final restoreButton = TextButton(
      onPressed: restore,
      style: TextButton.styleFrom(
        foregroundColor: color,
        visualDensity: VisualDensity.compact,
        padding: dense ? const EdgeInsets.symmetric(horizontal: 8) : null,
        minimumSize: dense ? const Size(0, 32) : null,
        tapTargetSize: dense ? MaterialTapTargetSize.shrinkWrap : null,
      ),
      child: Text(
        l10n.proRestoreCta,
        style: theme.textTheme.bodySmall?.copyWith(color: color),
      ),
    );

    if (dense) {
      if (priceText == null) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(top: 6),
        child: priceText,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Stacco dalla call to action che sta sopra: attaccata al bottone la
        // riga di prezzo sembra parte del bottone, e il prezzo va letto come
        // una precisazione, non come un'altra etichetta da toccare.
        const SizedBox(height: 12),
        if (priceText != null) priceText,
        restoreButton,
      ],
    );
  }

  String _label(AppLocalizations l10n, ProPriceHint hint) {
    // Con un addebito non mensile il mensile equivalente da solo mostrerebbe
    // una cifra che l'utente non troverà mai sull'estratto conto: accanto va
    // sempre quella vera.
    final total = hint.billedTotal;

    switch (hint.kind) {
      case ProPriceKind.perMonth:
        return total == null
            ? l10n.proPriceFromMonth(hint.price)
            : l10n.proPriceFromMonthUpfront(hint.price, total);
      case ProPriceKind.trialThenPerMonth:
        return total == null
            ? l10n.proPriceTrialThenMonth(hint.price)
            : l10n.proPriceTrialThenMonthUpfront(hint.price, total);
      case ProPriceKind.lifetime:
        return l10n.proPriceLifetime(hint.price);
    }
  }
}
