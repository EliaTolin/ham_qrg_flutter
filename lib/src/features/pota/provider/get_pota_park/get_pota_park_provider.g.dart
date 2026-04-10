// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pota_park_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPotaPark)
final getPotaParkProvider = GetPotaParkFamily._();

final class GetPotaParkProvider extends $FunctionalProvider<
        AsyncValue<PotaPark>, PotaPark, FutureOr<PotaPark>>
    with $FutureModifier<PotaPark>, $FutureProvider<PotaPark> {
  GetPotaParkProvider._(
      {required GetPotaParkFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'getPotaParkProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPotaParkHash();

  @override
  String toString() {
    return r'getPotaParkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PotaPark> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PotaPark> create(Ref ref) {
    final argument = this.argument as String;
    return getPotaPark(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetPotaParkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPotaParkHash() => r'a790e687ce044a9e891c81e4b5d3abf892cf965b';

final class GetPotaParkFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PotaPark>, String> {
  GetPotaParkFamily._()
      : super(
          retry: null,
          name: r'getPotaParkProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetPotaParkProvider call(
    String reference,
  ) =>
      GetPotaParkProvider._(argument: reference, from: this);

  @override
  String toString() => r'getPotaParkProvider';
}
