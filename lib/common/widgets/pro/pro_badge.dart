import 'package:flutter/material.dart';
import 'package:hamqrg/themes/app_colors.dart';

/// Pillola "PRO", il marchio che segnala una funzione a pagamento.
///
/// Esiste in due varianti perché il fondo su cui va cambia, non perché
/// cambi il marchio: [ProBadge] dorata sulle superfici neutre,
/// [ProBadge.onGold] scura quando sta già sopra l'oro (dove una pillola
/// dorata sparirebbe).
///
/// La parola `PRO` è un acronimo di marca: uno dei pochi literal ammessi
/// fuori dall'ARB, e non si traduce in nessuna lingua.
class ProBadge extends StatelessWidget {
  const ProBadge({super.key}) : _onGold = false;

  /// Variante da usare quando il badge poggia su una superficie dorata.
  const ProBadge.onGold({super.key}) : _onGold = true;

  final bool _onGold;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = _onGold ? AppColors.onProGold : AppColors.proGold;
    final foreground = _onGold ? AppColors.proGoldLight : AppColors.onProGold;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'PRO',
        style: theme.textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          height: 1,
        ),
      ),
    );
  }
}
