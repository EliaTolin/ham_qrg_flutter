// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydrate_station_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
///
/// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
/// identica online e offline e si apre in un istante (SC-005).

@ProviderFor(hydrateStation)
final hydrateStationProvider = HydrateStationFamily._();

/// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
///
/// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
/// identica online e offline e si apre in un istante (SC-005).

final class HydrateStationProvider extends $FunctionalProvider<
        AsyncValue<HydratedStation?>,
        HydratedStation?,
        FutureOr<HydratedStation?>>
    with $FutureModifier<HydratedStation?>, $FutureProvider<HydratedStation?> {
  /// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
  ///
  /// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
  /// identica online e offline e si apre in un istante (SC-005).
  HydrateStationProvider._(
      {required HydrateStationFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'hydrateStationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hydrateStationHash();

  @override
  String toString() {
    return r'hydrateStationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HydratedStation?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HydratedStation?> create(Ref ref) {
    final argument = this.argument as String;
    return hydrateStation(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HydrateStationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hydrateStationHash() => r'714025e63be346cad70b234d7cb7b177db7a33c3';

/// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
///
/// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
/// identica online e offline e si apre in un istante (SC-005).

final class HydrateStationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HydratedStation?>, String> {
  HydrateStationFamily._()
      : super(
          retry: null,
          name: r'hydrateStationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Una postazione salvata con i ripetitori risolti dalla cache condivisa.
  ///
  /// Lettura puramente locale: nessuna richiesta di rete, quindi funziona
  /// identica online e offline e si apre in un istante (SC-005).

  HydrateStationProvider call(
    String stationId,
  ) =>
      HydrateStationProvider._(argument: stationId, from: this);

  @override
  String toString() => r'hydrateStationProvider';
}
