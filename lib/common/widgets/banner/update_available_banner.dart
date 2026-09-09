import 'package:flutter/material.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/provider/dismissed_update_version_notifier/dismissed_update_version_notifier.dart';
import 'package:hamqrg/common/provider/update_available/update_available_provider.dart';
import 'package:hamqrg/common/utils/store_launcher.dart';
import 'package:hamqrg/common/widgets/banner/info_banner.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Banner "è disponibile una nuova versione": invito, non blocco.
///
/// Si mostra solo quando lo store ha una versione più recente di quella
/// installata e l'utente non l'ha già messa da parte. Finché il controllo non
/// ha risposto — o non c'è nulla da dire — occupa zero spazio.
class UpdateAvailableBanner extends ConsumerWidget {
  const UpdateAvailableBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(availableUpdateVersionProvider).value;
    if (version == null) return const SizedBox.shrink();

    final l10n = context.localization;
    final theme = Theme.of(context);
    final packageName = ref.watch(packageInfoProvider).value?.packageName;

    // Lo spazio sotto sta dentro il banner: fuori sarebbe un vuoto residuo
    // ogni volta che il banner non c'è.
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InfoBanner(
        icon: Icon(
          Icons.system_update_outlined,
          color: theme.colorScheme.primary,
        ),
        label: l10n.updateAvailableBannerMessage(version),
        trailing: IconButton(
          visualDensity: VisualDensity.compact,
          iconSize: 18,
          tooltip: l10n.updateAvailableDismiss,
          icon: const Icon(Icons.close),
          onPressed: () => ref
              .read(dismissedUpdateVersionProvider.notifier)
              .dismiss(version),
        ),
        // La CTA sta sotto al messaggio: accanto, nelle lingue lunghe, farebbe
        // traboccare la riga su schermi stretti (test/update_available_banner_test.dart).
        footer: Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: packageName == null
                ? null
                : () => openStoreListing(
                      context,
                      appStoreId: AppConfigs.getAppStoreId(),
                      playStorePackageName: packageName,
                    ),
            child: Text(l10n.updateAvailableAction),
          ),
        ),
      ),
    );
  }
}
