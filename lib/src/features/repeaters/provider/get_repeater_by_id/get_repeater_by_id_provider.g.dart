// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Un ripetitore per id, passando dalla cache condivisa.
///
/// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
/// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
/// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
/// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
/// nessuno abbia rieseguito alcun calcolo.
///
/// Offline la cache restituisce comunque la copia conservata, quindi la scheda
/// resta consultabile in campo.

@ProviderFor(getRepeaterById)
final getRepeaterByIdProvider = GetRepeaterByIdFamily._();

/// Un ripetitore per id, passando dalla cache condivisa.
///
/// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
/// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
/// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
/// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
/// nessuno abbia rieseguito alcun calcolo.
///
/// Offline la cache restituisce comunque la copia conservata, quindi la scheda
/// resta consultabile in campo.

final class GetRepeaterByIdProvider extends $FunctionalProvider<
        AsyncValue<Repeater?>, Repeater?, FutureOr<Repeater?>>
    with $FutureModifier<Repeater?>, $FutureProvider<Repeater?> {
  /// Un ripetitore per id, passando dalla cache condivisa.
  ///
  /// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
  /// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
  /// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
  /// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
  /// nessuno abbia rieseguito alcun calcolo.
  ///
  /// Offline la cache restituisce comunque la copia conservata, quindi la scheda
  /// resta consultabile in campo.
  GetRepeaterByIdProvider._(
      {required GetRepeaterByIdFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getRepeaterByIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeaterByIdHash();

  @override
  String toString() {
    return r'getRepeaterByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Repeater?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Repeater?> create(Ref ref) {
    final argument = this.argument as String;
    return getRepeaterById(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeaterByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeaterByIdHash() => r'8c29befa2b62f00015f6d386481fbf5ceecddfe5';

/// Un ripetitore per id, passando dalla cache condivisa.
///
/// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
/// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
/// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
/// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
/// nessuno abbia rieseguito alcun calcolo.
///
/// Offline la cache restituisce comunque la copia conservata, quindi la scheda
/// resta consultabile in campo.

final class GetRepeaterByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Repeater?>, String> {
  GetRepeaterByIdFamily._()
      : super(
          retry: null,
          name: r'getRepeaterByIdProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Un ripetitore per id, passando dalla cache condivisa.
  ///
  /// È il punto in cui avviene l'**aggiornamento indiretto**: ogni volta che
  /// l'utente apre una scheda ripetitore — da qualunque parte dell'app — la voce
  /// in cache viene riscritta col dato fresco. Una postazione salvata a ottobre
  /// che contiene quel ripetitore lo mostrerà aggiornato a febbraio, senza che
  /// nessuno abbia rieseguito alcun calcolo.
  ///
  /// Offline la cache restituisce comunque la copia conservata, quindi la scheda
  /// resta consultabile in campo.

  GetRepeaterByIdProvider call(
    String repeaterId,
  ) =>
      GetRepeaterByIdProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'getRepeaterByIdProvider';
}
