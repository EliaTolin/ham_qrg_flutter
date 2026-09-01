import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_status_notifier.g.dart';

/// Stato offline dell'app: `true` quando il backend non è raggiungibile.
///
/// Due segnali combinati:
/// 1. **Interfaccia di rete** (`connectivity_plus`): se non ce n'è alcuna,
///    offline senza bisogno di probe.
/// 2. **Probe di raggiungibilità**: con un'interfaccia attiva il device può
///    comunque essere isolato (Wi-Fi senza internet, captive portal) — una
///    richiesta leggera all'endpoint di health di Supabase, con timeout
///    stretto, decide lo stato reale. Qualunque risposta HTTP conta come
///    raggiungibile; solo l'assenza di risposta è offline.
///
/// Letto sincrono dai datasource come `.value ?? false`; la splash lo
/// risolve (`.future`) prima di qualsiasi chiamata dati, così il primo fetch
/// parte già con lo stato giusto. Si riaggiorna da solo al cambio di
/// connettività; [refresh] forza un nuovo probe.
@Riverpod(keepAlive: true)
class OfflineStatusNotifier extends _$OfflineStatusNotifier {
  static const _probeTimeout = Duration(seconds: 3);

  @override
  Future<bool> build() async {
    final connectivity = Connectivity();

    final subscription = connectivity.onConnectivityChanged.listen((results) {
      unawaited(_evaluate(results));
    });
    ref.onDispose(subscription.cancel);

    return _isOffline(await connectivity.checkConnectivity());
  }

  /// Forza una rivalutazione (probe incluso) dello stato corrente.
  Future<void> refresh() async {
    await _evaluate(await Connectivity().checkConnectivity());
  }

  Future<void> _evaluate(List<ConnectivityResult> results) async {
    state = AsyncData(await _isOffline(results));
  }

  Future<bool> _isOffline(List<ConnectivityResult> results) async {
    final noInterface =
        results.every((result) => result == ConnectivityResult.none);
    if (noInterface) return true;
    return !await _isBackendReachable();
  }

  Future<bool> _isBackendReachable() async {
    try {
      await Dio(
        BaseOptions(
          connectTimeout: _probeTimeout,
          receiveTimeout: _probeTimeout,
          // Qualunque status HTTP (anche 401/404) prova che il backend
          // risponde: interessa solo distinguere "risponde" da "irraggiungibile".
          validateStatus: (_) => true,
        ),
      ).get<dynamic>('${AppConfigs.getSupabaseUrl()}/auth/v1/health');
      return true;
    } on DioException {
      return false;
    }
  }
}
