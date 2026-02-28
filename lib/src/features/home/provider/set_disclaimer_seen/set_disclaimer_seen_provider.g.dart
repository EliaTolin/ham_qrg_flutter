// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_disclaimer_seen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setDisclaimerSeen)
final setDisclaimerSeenProvider = SetDisclaimerSeenProvider._();

final class SetDisclaimerSeenProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetDisclaimerSeenProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'setDisclaimerSeenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setDisclaimerSeenHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return setDisclaimerSeen(ref);
  }
}

String _$setDisclaimerSeenHash() => r'be190508e578b427f4478e15c70e6fe56b9bc094';
