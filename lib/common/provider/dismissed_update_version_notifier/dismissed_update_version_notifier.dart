import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dismissed_update_version_notifier.g.dart';

const _dismissedUpdateVersionKey = 'dismissed_update_version';

/// Ultima versione per cui l'utente ha chiuso il banner di aggiornamento.
///
/// Vive sul dispositivo come le altre preferenze di presentazione: chiudere
/// il banner nasconde *quella* versione, non l'invito in sé — alla release
/// successiva il banner torna, perché il confronto è sul numero di versione
/// e non su un flag booleano.
@Riverpod(keepAlive: true)
class DismissedUpdateVersionNotifier extends _$DismissedUpdateVersionNotifier {
  @override
  Future<String?> build() async {
    final storageClient =
        await ref.watch(sharedPrefStorageClientProvider.future);
    return storageClient.read(_dismissedUpdateVersionKey);
  }

  Future<void> dismiss(String version) async {
    final storageClient =
        await ref.read(sharedPrefStorageClientProvider.future);
    await storageClient.write(_dismissedUpdateVersionKey, version);
    state = AsyncData(version);
  }
}
