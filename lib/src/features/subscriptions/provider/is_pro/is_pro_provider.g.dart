// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_pro_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.
///
/// `keepAlive`: Pro status is global, app-wide and rarely changes, so we keep
/// it warm. Otherwise each gate that mounts restarts the provider from
/// `AsyncLoading` (a one-frame false → flash of "locked") and a cold
/// `ref.read` from an event handler can read `false` before the stream
/// resolves. Kept alive, once it resolves to `true` every reader sees `true`.

@ProviderFor(isPro)
final isProProvider = IsProProvider._();

/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.
///
/// `keepAlive`: Pro status is global, app-wide and rarely changes, so we keep
/// it warm. Otherwise each gate that mounts restarts the provider from
/// `AsyncLoading` (a one-frame false → flash of "locked") and a cold
/// `ref.read` from an event handler can read `false` before the stream
/// resolves. Kept alive, once it resolves to `true` every reader sees `true`.

final class IsProProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Whether the current user owns the HamQRG Pro entitlement.
  ///
  /// Emits the initial entitlement state, then re-emits whenever RevenueCat
  /// reports a change (purchase, restore, expiration, webhook refresh).
  ///
  /// Read it as `ref.watch(isProProvider).value ?? false`.
  ///
  /// `keepAlive`: Pro status is global, app-wide and rarely changes, so we keep
  /// it warm. Otherwise each gate that mounts restarts the provider from
  /// `AsyncLoading` (a one-frame false → flash of "locked") and a cold
  /// `ref.read` from an event handler can read `false` before the stream
  /// resolves. Kept alive, once it resolves to `true` every reader sees `true`.
  IsProProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isProProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isProHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isPro(ref);
  }
}

String _$isProHash() => r'2f4efb5f362760c4cd99376914709efbf9324cdc';
