// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionStatus {
  /// Whether the Pro entitlement is currently active.
  bool get isPro;

  /// When the current entitlement expires, if known.
  DateTime? get expiresAt;

  /// Store/product identifier of the active subscription, if any.
  String? get productId;

  /// Whether the subscription will auto-renew at the period end.
  bool get willRenew;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionStatusCopyWith<SubscriptionStatus> get copyWith =>
      _$SubscriptionStatusCopyWithImpl<SubscriptionStatus>(
          this as SubscriptionStatus, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionStatus &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.willRenew, willRenew) ||
                other.willRenew == willRenew));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isPro, expiresAt, productId, willRenew);

  @override
  String toString() {
    return 'SubscriptionStatus(isPro: $isPro, expiresAt: $expiresAt, productId: $productId, willRenew: $willRenew)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionStatusCopyWith<$Res> {
  factory $SubscriptionStatusCopyWith(
          SubscriptionStatus value, $Res Function(SubscriptionStatus) _then) =
      _$SubscriptionStatusCopyWithImpl;
  @useResult
  $Res call(
      {bool isPro, DateTime? expiresAt, String? productId, bool willRenew});
}

/// @nodoc
class _$SubscriptionStatusCopyWithImpl<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  _$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final SubscriptionStatus _self;
  final $Res Function(SubscriptionStatus) _then;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPro = null,
    Object? expiresAt = freezed,
    Object? productId = freezed,
    Object? willRenew = null,
  }) {
    return _then(_self.copyWith(
      isPro: null == isPro
          ? _self.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      willRenew: null == willRenew
          ? _self.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionStatus].
extension SubscriptionStatusPatterns on SubscriptionStatus {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubscriptionStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubscriptionStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubscriptionStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool isPro, DateTime? expiresAt, String? productId, bool willRenew)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus() when $default != null:
        return $default(
            _that.isPro, _that.expiresAt, _that.productId, _that.willRenew);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool isPro, DateTime? expiresAt, String? productId, bool willRenew)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus():
        return $default(
            _that.isPro, _that.expiresAt, _that.productId, _that.willRenew);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool isPro, DateTime? expiresAt, String? productId, bool willRenew)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStatus() when $default != null:
        return $default(
            _that.isPro, _that.expiresAt, _that.productId, _that.willRenew);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SubscriptionStatus implements SubscriptionStatus {
  const _SubscriptionStatus(
      {required this.isPro,
      this.expiresAt,
      this.productId,
      this.willRenew = false});

  /// Whether the Pro entitlement is currently active.
  @override
  final bool isPro;

  /// When the current entitlement expires, if known.
  @override
  final DateTime? expiresAt;

  /// Store/product identifier of the active subscription, if any.
  @override
  final String? productId;

  /// Whether the subscription will auto-renew at the period end.
  @override
  @JsonKey()
  final bool willRenew;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionStatusCopyWith<_SubscriptionStatus> get copyWith =>
      __$SubscriptionStatusCopyWithImpl<_SubscriptionStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionStatus &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.willRenew, willRenew) ||
                other.willRenew == willRenew));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isPro, expiresAt, productId, willRenew);

  @override
  String toString() {
    return 'SubscriptionStatus(isPro: $isPro, expiresAt: $expiresAt, productId: $productId, willRenew: $willRenew)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionStatusCopyWith<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  factory _$SubscriptionStatusCopyWith(
          _SubscriptionStatus value, $Res Function(_SubscriptionStatus) _then) =
      __$SubscriptionStatusCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isPro, DateTime? expiresAt, String? productId, bool willRenew});
}

/// @nodoc
class __$SubscriptionStatusCopyWithImpl<$Res>
    implements _$SubscriptionStatusCopyWith<$Res> {
  __$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final _SubscriptionStatus _self;
  final $Res Function(_SubscriptionStatus) _then;

  /// Create a copy of SubscriptionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isPro = null,
    Object? expiresAt = freezed,
    Object? productId = freezed,
    Object? willRenew = null,
  }) {
    return _then(_SubscriptionStatus(
      isPro: null == isPro
          ? _self.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      willRenew: null == willRenew
          ? _self.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
