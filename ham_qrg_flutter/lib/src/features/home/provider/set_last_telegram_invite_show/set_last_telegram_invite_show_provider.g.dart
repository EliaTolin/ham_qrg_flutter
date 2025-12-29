// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_last_telegram_invite_show_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setLastTelegramInviteShow)
final setLastTelegramInviteShowProvider = SetLastTelegramInviteShowProvider._();

final class SetLastTelegramInviteShowProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetLastTelegramInviteShowProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'setLastTelegramInviteShowProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setLastTelegramInviteShowHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return setLastTelegramInviteShow(ref);
  }
}

String _$setLastTelegramInviteShowHash() =>
    r'100275836b800a53b3722b0901409b25ea265b59';
