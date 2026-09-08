import 'package:flutter/widgets.dart';
import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unit_system_notifier.g.dart';

const _unitSystemKey = 'unit_system';

/// Regioni che non usano il sistema metrico.
const _imperialRegions = {'US', 'LR', 'MM'};

/// Preferenza del sistema di misura, con la stessa forma di
/// `ThemeModeNotifier` e `LocaleNotifier`: vive sul dispositivo, non
/// sull'account, e funziona identica offline e da utente anonimo (FR-003).
@Riverpod(keepAlive: true)
class UnitSystemNotifier extends _$UnitSystemNotifier {
  @override
  Future<UnitSystem> build() async {
    final storageClient =
        await ref.watch(sharedPrefStorageClientProvider.future);
    final stored = await storageClient.read(_unitSystemKey);
    return UnitSystem.fromName(stored);
  }

  Future<void> setUnitSystem(UnitSystem system) async {
    final storageClient =
        await ref.read(sharedPrefStorageClientProvider.future);
    if (system == UnitSystem.auto) {
      await storageClient.delete(_unitSystemKey);
    } else {
      await storageClient.write(_unitSystemKey, system.name);
    }
    state = AsyncData(system);
  }
}

/// Risolve [UnitSystem.auto] nella **regione del dispositivo** (FR-002).
///
/// Va letta dal `platformDispatcher` e non da `Localizations.localeOf`:
/// quest'ultima restituisce la lingua *dell'app*, che l'utente può aver
/// forzato, e darebbe le miglia a un americano che usa l'app in italiano —
/// esattamente l'errore che la spec vieta.
///
/// Il valore risolto non viene mai persistito: `auto` resta `auto`, così un
/// cambio di regione continua a essere seguito.
/// La regione va passata dal chiamante — [deviceCountryCode] — invece di
/// essere letta qui: così la funzione resta pura e `null` significa davvero
/// "regione non determinabile", non "parametro dimenticato".
UnitSystem resolveUnitSystem(
  UnitSystem preference,
  String? deviceCountryCode,
) {
  if (preference != UnitSystem.auto) return preference;
  return _imperialRegions.contains(deviceCountryCode)
      ? UnitSystem.imperial
      : UnitSystem.metric;
}

/// Regione del dispositivo secondo il sistema operativo.
String? deviceCountryCode() =>
    WidgetsBinding.instance.platformDispatcher.locale.countryCode;
