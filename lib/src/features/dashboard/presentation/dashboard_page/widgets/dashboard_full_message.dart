import 'package:flutter/material.dart';

/// Guscio degli stati che **sostituiscono** il contenuto della home invece di
/// affiancarlo: offline senza cache, caricamento fallito.
///
/// Quando la home non ha dati veri da mostrare, mostrarne l'ombra — statistiche
/// a zero, liste vuote, tab da sfogliare — è peggio che non mostrare nulla:
/// sono numeri che sembrano risposte. Qui al loro posto c'è una cosa sola,
/// centrata, con l'azione che la risolve.
///
/// Condiviso fra mobile e tablet, e fra i due stati: la forma (cerchio, titolo,
/// spiegazione, azioni) è la stessa, cambiano parole e icona.
class DashboardFullMessage extends StatelessWidget {
  const DashboardFullMessage({
    required this.icon,
    required this.title,
    required this.message,
    required this.retryLabel,
    required this.onRetry,
    this.iconColor,
    this.action,
    super.key,
  });

  final IconData icon;
  final String title;
  final String message;
  final String retryLabel;
  final Future<void> Function() onRetry;

  /// Colore dell'icona; se assente resta il grigio neutro delle superfici.
  final Color? iconColor;

  /// Azione principale opzionale, sopra al riprova (per esempio "postazioni
  /// salvate" quando si è offline): ciò che resta possibile adesso.
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: iconColor ?? colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (action != null) ...[
              action!,
              const SizedBox(height: 4),
            ],
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
