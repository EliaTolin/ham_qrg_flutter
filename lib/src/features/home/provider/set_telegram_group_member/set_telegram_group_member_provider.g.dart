// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_telegram_group_member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setAlreadyInTelegramCommunity)
final setAlreadyInTelegramCommunityProvider =
    SetAlreadyInTelegramCommunityProvider._();

final class SetAlreadyInTelegramCommunityProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetAlreadyInTelegramCommunityProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'setAlreadyInTelegramCommunityProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setAlreadyInTelegramCommunityHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return setAlreadyInTelegramCommunity(ref);
  }
}

String _$setAlreadyInTelegramCommunityHash() =>
    r'ad8685a72926b007ebce469a33644b8b07abeb78';
