// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_system_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Preferenza del sistema di misura, con la stessa forma di
/// `ThemeModeNotifier` e `LocaleNotifier`: vive sul dispositivo, non
/// sull'account, e funziona identica offline e da utente anonimo (FR-003).

@ProviderFor(UnitSystemNotifier)
final unitSystemProvider = UnitSystemNotifierProvider._();

/// Preferenza del sistema di misura, con la stessa forma di
/// `ThemeModeNotifier` e `LocaleNotifier`: vive sul dispositivo, non
/// sull'account, e funziona identica offline e da utente anonimo (FR-003).
final class UnitSystemNotifierProvider
    extends $AsyncNotifierProvider<UnitSystemNotifier, UnitSystem> {
  /// Preferenza del sistema di misura, con la stessa forma di
  /// `ThemeModeNotifier` e `LocaleNotifier`: vive sul dispositivo, non
  /// sull'account, e funziona identica offline e da utente anonimo (FR-003).
  UnitSystemNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'unitSystemProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$unitSystemNotifierHash();

  @$internal
  @override
  UnitSystemNotifier create() => UnitSystemNotifier();
}

String _$unitSystemNotifierHash() =>
    r'367d8545cc9f209c193140889bcac03085230fd9';

/// Preferenza del sistema di misura, con la stessa forma di
/// `ThemeModeNotifier` e `LocaleNotifier`: vive sul dispositivo, non
/// sull'account, e funziona identica offline e da utente anonimo (FR-003).

abstract class _$UnitSystemNotifier extends $AsyncNotifier<UnitSystem> {
  FutureOr<UnitSystem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UnitSystem>, UnitSystem>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UnitSystem>, UnitSystem>,
        AsyncValue<UnitSystem>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
