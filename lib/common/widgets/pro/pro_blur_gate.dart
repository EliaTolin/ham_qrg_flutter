import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Gates a Pro-only block behind a tantalising blurred teaser.
///
/// When [locked] is false the real [child] is shown as-is. When locked, the
/// real [child] is NOT built (so no network/compute happens for free users) —
/// instead a cheap [teaser] mock is rendered blurred, under a lock + value
/// proposition + call to action. Tapping anywhere triggers [onUnlock].
class ProBlurGate extends StatelessWidget {
  const ProBlurGate({
    required this.locked,
    required this.child,
    required this.teaser,
    required this.title,
    required this.onUnlock,
    this.subtitle,
    this.ctaLabel,
    this.footer,
    this.dense = false,
    this.blurSigma = 4,
    super.key,
  });

  /// When true, show the blurred teaser instead of [child].
  final bool locked;

  /// The real, Pro-only content. Only built when not [locked].
  final Widget child;

  /// A cheap mock shown blurred behind the lock (no network/compute).
  final Widget teaser;

  final String title;
  final String? subtitle;

  /// Call-to-action label. Defaults to the localized "unlock with Pro" text.
  final String? ctaLabel;
  final VoidCallback onUnlock;

  /// Riga sotto la CTA: prezzo d'ingresso e ripristino acquisti.
  ///
  /// È uno slot e non un contenuto fisso perché `common/` non deve sapere
  /// nulla di abbonamenti né di placement; chi monta il gate passa la sua
  /// `ProPriceLine`.
  final Widget? footer;

  /// Disposizione compatta: lucchetto, testo e CTA su una riga sola.
  ///
  /// La forma verticale è giusta dove il gate **è** la schermata (il teaser
  /// della copertura, la vetrina delle postazioni): lì può prendersi lo
  /// spazio di una proposta di vendita. Su una pagina che sta già dicendo
  /// altro — il dettaglio di un ripetitore — la stessa colonna diventa un
  /// blocco che spinge sotto la piega tutto ciò che l'utente era venuto a
  /// leggere, e un'inserzione pubblicitaria si guadagna il rifiuto proprio
  /// così.
  final bool dense;

  /// Intensità della sfocatura sul [teaser].
  ///
  /// Volutamente leggera. Nel mock **non c'è nulla da proteggere** — sono
  /// segnaposto inventati, nessun dato reale gira dietro a un gate chiuso —
  /// quindi la sfocatura non fa un lavoro di sicurezza, fa solo il lavoro
  /// estetico di dire "bloccato". Spinta troppo in alto cancella l'unica
  /// ragione per cui il mock esiste: mostrare **la forma** della risposta.
  /// Chi non vede cosa otterrebbe non desidera niente di preciso.
  ///
  /// I valori restano mascherati nel mock stesso (`-•• dBm`), non dalla
  /// sfocatura: così l'esempio si legge come un formato con i numeri coperti,
  /// e non può essere scambiato per una risposta vera.
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    if (!locked) return child;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onUnlock,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ColoredBox(
          color: theme.colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // L'esempio **sopra e da solo**, non dietro al testo.
              //
              // Prima le due cose si sovrapponevano nello stesso spazio, e
              // finché si sovrappongono nessuna sfocatura più leggera rende
              // l'esempio visibile: al massimo lo trasforma in disturbo
              // dietro alle parole. Separarli è l'unico modo per far vedere
              // davvero com'è fatta la risposta — che è tutto ciò per cui il
              // mock esiste.
              _TeaserStrip(
                teaser: teaser,
                blurSigma: blurSigma,
                fade: theme.colorScheme.surface,
                height: dense ? 58 : 132,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    dense ? 12 : 16,
                    dense ? 10 : 12,
                    dense ? 12 : 16,
                    dense ? 10 : 16,
                  ),
                  child: dense
                      ? _DenseContent(gate: this)
                      : _StackedContent(gate: this),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// La striscia d'esempio: il mock sfocato, con il bordo inferiore che sfuma
/// nella superficie del pannello sotto.
///
/// La sfumatura non è decorazione: senza, il taglio netto fa sembrare
/// l'esempio un elemento troncato per errore invece che un assaggio.
class _TeaserStrip extends StatelessWidget {
  const _TeaserStrip({
    required this.teaser,
    required this.blurSigma,
    required this.fade,
    required this.height,
  });

  final Widget teaser;
  final double blurSigma;
  final Color fade;

  /// Quanto esempio mostrare.
  ///
  /// Tagliato di proposito: mostrare il mock per intero costava 450 px al
  /// teaser a piena pagina e 192 al badge, cioè far vedere l'esempio a prezzo
  /// di ricacciare sotto la piega tutto il resto. Due righe (una nella
  /// variante compatta) bastano a dire com'è fatta la risposta; la terza non
  /// aggiunge informazione, aggiunge scroll.
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: double.infinity,
          child: _content(context),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: IgnorePointer(child: teaser),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: height,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    fade.withValues(alpha: 0),
                    fade.withValues(alpha: 0),
                    fade.withValues(alpha: 0.9),
                  ],
                  stops: const [0, 0.5, 1],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Lucchetto sopra, testo al centro, CTA sotto: la forma da proposta di
/// vendita, per quando il gate occupa la schermata.
class _StackedContent extends StatelessWidget {
  const _StackedContent({required this.gate});

  final ProBlurGate gate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _LockIcon(),
        const SizedBox(height: 10),
        Text(
          gate.title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (gate.subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            gate.subtitle!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
        const SizedBox(height: 14),
        _UnlockButton(gate: gate),
        if (gate.footer != null) gate.footer!,
      ],
    );
  }
}

/// La stessa forma impilata, stretta: lucchetto accanto al titolo invece che
/// sopra, spaziature e CTA ridotte.
///
/// La prima versione compatta metteva tutto su una riga sola e scendeva a 64
/// px, ma per starci doveva troncare il sottotitolo a una riga — cioè buttare
/// via la proposta di valore per guadagnare spazio. Un gate che non dice più
/// cosa si compra è compatto e inutile: la misura giusta non è la più bassa,
/// è la più bassa che conserva titolo, promessa, CTA e prezzo.
class _DenseContent extends StatelessWidget {
  const _DenseContent({required this.gate});

  final ProBlurGate gate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Il lucchetto perde il cerchio e si affianca al titolo: da solo, in
        // una riga sua, costava 44 px di altezza per un segnale che il
        // contenuto sfocato dà già.
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_rounded, color: AppColors.proGold, size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                gate.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        if (gate.subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            gate.subtitle!,
            textAlign: TextAlign.center,
            // Una riga: con l'esempio visibile sopra, il sottotitolo non è
            // più l'unico a dire cosa si ottiene, e può stringersi.
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
        const SizedBox(height: 10),
        _UnlockButton(gate: gate, dense: true),
        if (gate.footer != null) gate.footer!,
      ],
    );
  }
}

class _LockIcon extends StatelessWidget {
  const _LockIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.proGold.withValues(alpha: 0.18),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.proGold.withValues(alpha: 0.6)),
      ),
      child: const Icon(Icons.lock_rounded, color: AppColors.proGold),
    );
  }
}

class _UnlockButton extends StatelessWidget {
  const _UnlockButton({required this.gate, this.dense = false});

  final ProBlurGate gate;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final label = gate.ctaLabel ?? context.localization.proUnlockCta;

    return FilledButton.icon(
      onPressed: gate.onUnlock,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.proGold,
        foregroundColor: AppColors.onProGold,
        padding: dense
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
            : null,
        visualDensity: dense ? VisualDensity.compact : null,
      ),
      icon: Icon(Icons.bolt_rounded, size: dense ? 16 : 18),
      label: Text(
        label,
        style: dense ? Theme.of(context).textTheme.labelMedium : null,
      ),
    );
  }
}
