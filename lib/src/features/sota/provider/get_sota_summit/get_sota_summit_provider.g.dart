// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sota_summit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getSotaSummit)
final getSotaSummitProvider = GetSotaSummitFamily._();

final class GetSotaSummitProvider extends $FunctionalProvider<
        AsyncValue<SotaSummit>, SotaSummit, FutureOr<SotaSummit>>
    with $FutureModifier<SotaSummit>, $FutureProvider<SotaSummit> {
  GetSotaSummitProvider._(
      {required GetSotaSummitFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'getSotaSummitProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getSotaSummitHash();

  @override
  String toString() {
    return r'getSotaSummitProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SotaSummit> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SotaSummit> create(Ref ref) {
    final argument = this.argument as String;
    return getSotaSummit(
      ref,
      summitCode: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetSotaSummitProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getSotaSummitHash() => r'1993b8a70e77301a1cd2a8c9334485038131f3a3';

final class GetSotaSummitFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SotaSummit>, String> {
  GetSotaSummitFamily._()
      : super(
          retry: null,
          name: r'getSotaSummitProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetSotaSummitProvider call({
    required String summitCode,
  }) =>
      GetSotaSummitProvider._(argument: summitCode, from: this);

  @override
  String toString() => r'getSotaSummitProvider';
}
