// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'need_to_show_telegram_invite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Returns true only for the Day-7 re-prompt scenario:
/// User completed onboarding, declined Telegram, and 7+ days have passed.

@ProviderFor(needToShowTelegramInvite)
final needToShowTelegramInviteProvider = NeedToShowTelegramInviteProvider._();

/// Returns true only for the Day-7 re-prompt scenario:
/// User completed onboarding, declined Telegram, and 7+ days have passed.

final class NeedToShowTelegramInviteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Returns true only for the Day-7 re-prompt scenario:
  /// User completed onboarding, declined Telegram, and 7+ days have passed.
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
    r'd92873dc4b32354054952239f5e2b5cb1a2c2e9f';
