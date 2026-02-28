// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'need_to_show_disclaimer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(needToShowDisclaimer)
final needToShowDisclaimerProvider = NeedToShowDisclaimerProvider._();

final class NeedToShowDisclaimerProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  NeedToShowDisclaimerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'needToShowDisclaimerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$needToShowDisclaimerHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return needToShowDisclaimer(ref);
  }
}

String _$needToShowDisclaimerHash() =>
    r'a8aa700a851cf4809e1b71e1ea4345026149339c';
