import 'package:hamqrg/common/provider/dismissed_update_version_notifier/dismissed_update_version_notifier.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upgrader/upgrader.dart';

part 'update_available_provider.g.dart';

/// Oltre questo tempo la ricerca sullo store si considera persa: il banner è
/// un di più, non deve tenere impegnato nulla.
const _lookupTimeout = Duration(seconds: 8);

/// Versione pubblicata sullo store, se è più recente di quella installata e
/// l'utente non l'ha già messa da parte. `null` quando non c'è nulla da dire.
///
/// Lo stesso numero fa anche da gettone della chiusura: mettere via il banner
/// nasconde *quella* versione, non l'invito in sé — alla release successiva
/// torna da solo.
///
/// La lettura è automatica, senza parametri da tenere aggiornati a mano:
/// `upgrader` interroga l'API di ricerca di Apple su iOS e la scheda pubblica
/// del Play Store su Android. Sono due fonti che possono tacere — la scheda
/// Android non sempre espone un numero di versione, e le build sui canali di
/// test non sono pubbliche — e quando tacciono il banner semplicemente non
/// compare. È la direzione giusta in cui sbagliare: un invito mancato non
/// rompe nulla, un invito sbagliato manda l'utente a cercare un
/// aggiornamento che non esiste.
@riverpod
Future<String?> availableUpdateVersion(Ref ref) async {
  // Offline la ricerca non può che fallire, e fallirebbe spendendo il suo
  // timeout: si salta, e si rifà da sola quando torna la rete.
  final isOffline = ref.watch(offlineStatusProvider).value ?? false;
  if (isOffline) return null;

  // `checkOnResume: false`: il controllo lo rifà questo provider quando la
  // dashboard si rimonta. Lasciandolo attivo, `Upgrader` resterebbe in
  // ascolto del ciclo di vita per conto suo.
  final upgrader = Upgrader(checkOnResume: false);
  ref.onDispose(upgrader.dispose);

  try {
    await upgrader.initialize().timeout(_lookupTimeout);
    if (!upgrader.isUpdateAvailable()) return null;

    final storeVersion = upgrader.currentAppStoreVersion;
    if (storeVersion == null) return null;

    final dismissedVersion =
        await ref.watch(dismissedUpdateVersionProvider.future);
    if (dismissedVersion != null &&
        compareVersions(dismissedVersion, storeVersion) >= 0) {
      return null;
    }

    return storeVersion;
  } catch (_) {
    return null;
  }
}
