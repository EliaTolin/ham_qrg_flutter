// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_favorite_repeater_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(removeFavoriteRepeater)
final removeFavoriteRepeaterProvider = RemoveFavoriteRepeaterFamily._();

final class RemoveFavoriteRepeaterProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  RemoveFavoriteRepeaterProvider._(
      {required RemoveFavoriteRepeaterFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'removeFavoriteRepeaterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$removeFavoriteRepeaterHash();

  @override
  String toString() {
    return r'removeFavoriteRepeaterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return removeFavoriteRepeater(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveFavoriteRepeaterProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$removeFavoriteRepeaterHash() =>
    r'85d719e29a760940026740a64a90505dda8456fc';

final class RemoveFavoriteRepeaterFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  RemoveFavoriteRepeaterFamily._()
      : super(
          retry: null,
          name: r'removeFavoriteRepeaterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RemoveFavoriteRepeaterProvider call(
    String repeaterId,
  ) =>
      RemoveFavoriteRepeaterProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'removeFavoriteRepeaterProvider';
}
