// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_repeater_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addFavoriteRepeater)
final addFavoriteRepeaterProvider = AddFavoriteRepeaterFamily._();

final class AddFavoriteRepeaterProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddFavoriteRepeaterProvider._(
      {required AddFavoriteRepeaterFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'addFavoriteRepeaterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addFavoriteRepeaterHash();

  @override
  String toString() {
    return r'addFavoriteRepeaterProvider'
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
    return addFavoriteRepeater(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddFavoriteRepeaterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addFavoriteRepeaterHash() =>
    r'b11b390925683336aebbbcfb5b6cba9f03553357';

final class AddFavoriteRepeaterFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  AddFavoriteRepeaterFamily._()
      : super(
          retry: null,
          name: r'addFavoriteRepeaterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AddFavoriteRepeaterProvider call(
    String repeaterId,
  ) =>
      AddFavoriteRepeaterProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'addFavoriteRepeaterProvider';
}
