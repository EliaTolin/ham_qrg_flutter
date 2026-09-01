// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_status_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(OfflineStatusNotifier)
final offlineStatusProvider = OfflineStatusNotifierProvider._();

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
final class OfflineStatusNotifierProvider
    extends $AsyncNotifierProvider<OfflineStatusNotifier, bool> {
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
  OfflineStatusNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'offlineStatusProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$offlineStatusNotifierHash();

  @$internal
  @override
  OfflineStatusNotifier create() => OfflineStatusNotifier();
}

String _$offlineStatusNotifierHash() =>
    r'21555a99185d2586e5149550573a2911ace1d9ae';

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

abstract class _$OfflineStatusNotifier extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<bool>, bool>,
        AsyncValue<bool>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
