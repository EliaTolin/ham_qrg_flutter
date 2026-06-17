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

@ProviderFor(isPro)
final isProProvider = IsProProvider._();

/// Whether the current user owns the HamQRG Pro entitlement.
///
/// Emits the initial entitlement state, then re-emits whenever RevenueCat
/// reports a change (purchase, restore, expiration, webhook refresh).
///
/// Read it as `ref.watch(isProProvider).value ?? false`.

final class IsProProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Whether the current user owns the HamQRG Pro entitlement.
  ///
  /// Emits the initial entitlement state, then re-emits whenever RevenueCat
  /// reports a change (purchase, restore, expiration, webhook refresh).
  ///
  /// Read it as `ref.watch(isProProvider).value ?? false`.
  IsProProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isProProvider',
          isAutoDispose: true,
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

String _$isProHash() => r'7dcdee09c29016621a97fcff02b83227cf339b40';
