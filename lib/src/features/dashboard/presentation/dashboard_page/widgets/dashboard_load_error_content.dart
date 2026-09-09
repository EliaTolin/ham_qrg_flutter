import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:hamqrg/src/features/dashboard/presentation/dashboard_page/widgets/dashboard_full_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Stato della home quando la rete c'è ma i dati non sono arrivati.
///
/// Prende il posto del contenuto invece di stargli sopra: statistiche a zero
/// e "nessun ripetitore nelle vicinanze" sotto un avviso di errore sono la
/// stessa notizia detta tre volte, e le prime due la dicono male — sembrano
/// risposte.
class DashboardLoadErrorContent extends ConsumerWidget {
  const DashboardLoadErrorContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;

    return DashboardFullMessage(
      icon: Icons.error_outline,
      iconColor: Theme.of(context).colorScheme.error,
      title: l10n.dashboardLoadError,
      message: l10n.dashboardLoadErrorMessage,
      retryLabel: l10n.retry,
      onRetry: () => ref.read(dashboardControllerProvider.notifier).reload(),
    );
  }
}
