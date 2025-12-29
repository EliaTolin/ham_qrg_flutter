// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'need_to_show_telegram_invite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(needToShowTelegramInvite)
final needToShowTelegramInviteProvider = NeedToShowTelegramInviteProvider._();

final class NeedToShowTelegramInviteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  NeedToShowTelegramInviteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'needToShowTelegramInviteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$needToShowTelegramInviteHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return needToShowTelegramInvite(ref);
  }
}

String _$needToShowTelegramInviteHash() =>
    r'bd8400ee079e0bdfc74115c57a24656466b5d911';
