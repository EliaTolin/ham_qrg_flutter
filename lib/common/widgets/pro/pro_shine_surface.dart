import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Durata di un ciclo del riflesso. La luce attraversa la superficie solo
/// nella prima frazione ([_kSweep]), il resto è pausa: un luccichio continuo
/// diventa rumore di fondo e smette di richiamare l'occhio.
const _kPeriod = Duration(milliseconds: 3400);
const _kSweep = 0.34;

/// Superficie dorata percorsa da un riflesso animato.
///
/// **Va usata con parsimonia, ed è il punto di questo commento.** Il riflesso
/// funziona perché è raro: serve dove la call to action deve vincere
/// l'attenzione contro altro contenuto — la card nel profilo, in mezzo a una
/// lista di righe tutte uguali; la card copertura, in mezzo ai dati tecnici
/// del ripetitore. Non serve dove la CTA è già l'unico elemento dorato di una
/// superficie scurita (i `ProBlurGate`) o l'unica azione di una modale (i
/// dialog di upsell): lì aggiungerebbe movimento senza aggiungere attenzione.
///
/// Il giorno che luccicano cinque superfici, l'effetto è speso e resta solo il
/// consumo: ogni istanza è un ticker che ridipinge di continuo.
class ProShineSurface extends HookWidget {
  const ProShineSurface({
    required this.child,
    required this.borderRadius,
    this.onTap,
    this.glow = false,
    super.key,
  });

  final Widget child;

  /// Raggio degli angoli. Obbligatorio e senza default: la superficie va da
  /// una card larga a una pillola, e un valore ereditato per distrazione si
  /// nota subito.
  final double borderRadius;

  /// Se presente, la superficie diventa toccabile con il ripple di Material.
  final VoidCallback? onTap;

  /// Alone dorato esterno. Per le superfici grandi che devono staccare dalla
  /// pagina; su una pillola piccola diventa una macchia.
  final bool glow;

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
  Widget build(BuildContext context) {
    // iOS "Riduci movimento" / Android "Rimuovi animazioni": la superficie
    // resta dorata, ma ferma.
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final shine = useAnimationController(duration: _kPeriod);
    useEffect(
      () {
        if (reduceMotion) return null;
        shine.repeat();
        return shine.stop;
      },
      [reduceMotion, shine],
    );

    final radius = BorderRadius.circular(borderRadius);

    Widget content = Stack(
      children: [
        // Il riflesso sta SOTTO il contenuto: attraversa l'oro mentre testo e
        // icone restano opachi. Sopra, schiarirebbe anche il testo e a ogni
        // passaggio la superficie diventerebbe illeggibile.
        if (!reduceMotion)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: shine,
                builder: (context, _) {
                  final t = Curves.easeInOut.transform(
                    (shine.value / _kSweep).clamp(0.0, 1.0),
                  );
                  return DecoratedBox(
                    decoration: BoxDecoration(gradient: _shine(t)),
                  );
                },
              ),
            ),
          ),
        child,
      ],
    );

    final tap = onTap;
    if (tap != null) {
      content = InkWell(
        onTap: tap,
        splashColor: AppColors.onProGold.withValues(alpha: 0.08),
        highlightColor: AppColors.onProGold.withValues(alpha: 0.05),
        child: content,
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppColors.proGold.withValues(alpha: 0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.proGoldLight, AppColors.proGold],
            ),
          ),
          child: content,
        ),
      ),
    );
  }
}
