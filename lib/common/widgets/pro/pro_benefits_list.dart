import 'package:flutter/material.dart';

/// Elenco spuntato dei vantaggi Pro.
///
/// Era già scritto tre volte, identico, in tre file diversi. Sta qui perché
/// ogni superficie di vendita deve poterlo mostrare: un elenco di benefici
/// accanto alla CTA è ciò che distingue una richiesta di soldi da una
/// proposta di valore.
class ProBenefitsList extends StatelessWidget {
  const ProBenefitsList({required this.items, this.alignment, super.key});

  final List<String> items;

  /// Allineamento delle righe. Le liste in colonna restano a sinistra
  /// (default), quelle dentro un dialog centrato passano `center`.
  final CrossAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(item, style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
