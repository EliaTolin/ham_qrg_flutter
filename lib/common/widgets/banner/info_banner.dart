import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    required this.icon,
    required this.label,
    super.key,
    this.trailing,
    this.footer,
  });

  final Widget icon;
  final String label;
  final Widget? trailing;

  /// Riga opzionale sotto al messaggio, per un'azione che accanto al testo
  /// non ci starebbe: in una riga sola l'etichetta non può scendere sotto la
  /// sua parola più lunga, e nelle lingue lunghe il bottone la fa traboccare.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.shadow.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 12),
                  trailing!,
                ],
              ],
            ),
            if (footer != null) ...[
              const SizedBox(height: 4),
              footer!,
            ],
          ],
        ),
      ),
    );
  }
}
