// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeaterById)
final getRepeaterByIdProvider = GetRepeaterByIdFamily._();

final class GetRepeaterByIdProvider extends $FunctionalProvider<
        AsyncValue<Repeater?>, Repeater?, FutureOr<Repeater?>>
    with $FutureModifier<Repeater?>, $FutureProvider<Repeater?> {
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

String _$getRepeaterByIdHash() => r'df5a3bc5a6fbf5b1c2c79f287929a0557de4380e';

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

  GetRepeaterByIdProvider call(
    String repeaterId,
  ) =>
      GetRepeaterByIdProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'getRepeaterByIdProvider';
}
