import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_status.freezed.dart';

/// Domain representation of a user's HamQRG Pro subscription state.
@freezed
abstract class SubscriptionStatus with _$SubscriptionStatus {
  const factory SubscriptionStatus({
    /// Whether the Pro entitlement is currently active.
    required bool isPro,

    /// When the current entitlement expires, if known.
    DateTime? expiresAt,

    /// Store/product identifier of the active subscription, if any.
    String? productId,

    /// Whether the subscription will auto-renew at the period end.
    @Default(false) bool willRenew,
  }) = _SubscriptionStatus;

  /// Convenience constant for a non-subscribed user.
  static const SubscriptionStatus free = SubscriptionStatus(isPro: false);
}
