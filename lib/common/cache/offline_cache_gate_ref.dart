import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Wiring unico dei flag offline/Pro nei provider dei datasource.
extension OfflineCacheGateRef on Ref {
  /// Costruisce un [OfflineCacheGate] osservando entrambi i flag: al cambio di
  /// connettività o di entitlement il provider chiamante si ricostruisce con
  /// i valori aggiornati. I due provider sono keepAlive e tenuti vivi dal root
  /// widget, quindi `.value` è caldo dopo la splash; il primissimo frame vale
  /// `false`.
  OfflineCacheGate watchOfflineCacheGate({Duration? remoteTimeout}) =>
      OfflineCacheGate(
        isPro: watch(isProProvider).value ?? false,
        isOffline: watch(offlineStatusProvider).value ?? false,
        remoteTimeout: remoteTimeout,
      );
}
