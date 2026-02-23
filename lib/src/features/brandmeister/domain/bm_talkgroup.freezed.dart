// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bm_talkgroup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BmTalkgroup {
  int get talkgroupId;
  int get slot;
  int get repeaterId;

  /// Create a copy of BmTalkgroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BmTalkgroupCopyWith<BmTalkgroup> get copyWith =>
      _$BmTalkgroupCopyWithImpl<BmTalkgroup>(this as BmTalkgroup, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BmTalkgroup &&
            (identical(other.talkgroupId, talkgroupId) ||
                other.talkgroupId == talkgroupId) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, talkgroupId, slot, repeaterId);

  @override
  String toString() {
    return 'BmTalkgroup(talkgroupId: $talkgroupId, slot: $slot, repeaterId: $repeaterId)';
  }
}

/// @nodoc
abstract mixin class $BmTalkgroupCopyWith<$Res> {
  factory $BmTalkgroupCopyWith(
          BmTalkgroup value, $Res Function(BmTalkgroup) _then) =
      _$BmTalkgroupCopyWithImpl;
  @useResult
  $Res call({int talkgroupId, int slot, int repeaterId});
}

/// @nodoc
class _$BmTalkgroupCopyWithImpl<$Res> implements $BmTalkgroupCopyWith<$Res> {
  _$BmTalkgroupCopyWithImpl(this._self, this._then);

  final BmTalkgroup _self;
  final $Res Function(BmTalkgroup) _then;

  /// Create a copy of BmTalkgroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? talkgroupId = null,
    Object? slot = null,
    Object? repeaterId = null,
  }) {
    return _then(_self.copyWith(
      talkgroupId: null == talkgroupId
          ? _self.talkgroupId
          : talkgroupId // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _self.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [BmTalkgroup].
extension BmTalkgroupPatterns on BmTalkgroup {
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
    TResult Function(_BmTalkgroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup() when $default != null:
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
    TResult Function(_BmTalkgroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup():
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
    TResult? Function(_BmTalkgroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup() when $default != null:
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
    TResult Function(int talkgroupId, int slot, int repeaterId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup() when $default != null:
        return $default(_that.talkgroupId, _that.slot, _that.repeaterId);
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
    TResult Function(int talkgroupId, int slot, int repeaterId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup():
        return $default(_that.talkgroupId, _that.slot, _that.repeaterId);
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
    TResult? Function(int talkgroupId, int slot, int repeaterId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BmTalkgroup() when $default != null:
        return $default(_that.talkgroupId, _that.slot, _that.repeaterId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BmTalkgroup implements BmTalkgroup {
  const _BmTalkgroup(
      {required this.talkgroupId,
      required this.slot,
      required this.repeaterId});

  @override
  final int talkgroupId;
  @override
  final int slot;
  @override
  final int repeaterId;

  /// Create a copy of BmTalkgroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BmTalkgroupCopyWith<_BmTalkgroup> get copyWith =>
      __$BmTalkgroupCopyWithImpl<_BmTalkgroup>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BmTalkgroup &&
            (identical(other.talkgroupId, talkgroupId) ||
                other.talkgroupId == talkgroupId) &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, talkgroupId, slot, repeaterId);

  @override
  String toString() {
    return 'BmTalkgroup(talkgroupId: $talkgroupId, slot: $slot, repeaterId: $repeaterId)';
  }
}

/// @nodoc
abstract mixin class _$BmTalkgroupCopyWith<$Res>
    implements $BmTalkgroupCopyWith<$Res> {
  factory _$BmTalkgroupCopyWith(
          _BmTalkgroup value, $Res Function(_BmTalkgroup) _then) =
      __$BmTalkgroupCopyWithImpl;
  @override
  @useResult
  $Res call({int talkgroupId, int slot, int repeaterId});
}

/// @nodoc
class __$BmTalkgroupCopyWithImpl<$Res> implements _$BmTalkgroupCopyWith<$Res> {
  __$BmTalkgroupCopyWithImpl(this._self, this._then);

  final _BmTalkgroup _self;
  final $Res Function(_BmTalkgroup) _then;

  /// Create a copy of BmTalkgroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? talkgroupId = null,
    Object? slot = null,
    Object? repeaterId = null,
  }) {
    return _then(_BmTalkgroup(
      talkgroupId: null == talkgroupId
          ? _self.talkgroupId
          : talkgroupId // ignore: cast_nullable_to_non_nullable
              as int,
      slot: null == slot
          ? _self.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
