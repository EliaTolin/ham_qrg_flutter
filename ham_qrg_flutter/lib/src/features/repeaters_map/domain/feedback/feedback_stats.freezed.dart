// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackStats {
  String get repeaterId;
  int get likesTotal;
  int get downTotal;
  DateTime? get lastLikeAt;
  DateTime? get lastDownAt;

  /// Create a copy of FeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedbackStatsCopyWith<FeedbackStats> get copyWith =>
      _$FeedbackStatsCopyWithImpl<FeedbackStats>(
          this as FeedbackStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedbackStats &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.likesTotal, likesTotal) ||
                other.likesTotal == likesTotal) &&
            (identical(other.downTotal, downTotal) ||
                other.downTotal == downTotal) &&
            (identical(other.lastLikeAt, lastLikeAt) ||
                other.lastLikeAt == lastLikeAt) &&
            (identical(other.lastDownAt, lastDownAt) ||
                other.lastDownAt == lastDownAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, repeaterId, likesTotal, downTotal, lastLikeAt, lastDownAt);

  @override
  String toString() {
    return 'FeedbackStats(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class $FeedbackStatsCopyWith<$Res> {
  factory $FeedbackStatsCopyWith(
          FeedbackStats value, $Res Function(FeedbackStats) _then) =
      _$FeedbackStatsCopyWithImpl;
  @useResult
  $Res call(
      {String repeaterId,
      int likesTotal,
      int downTotal,
      DateTime? lastLikeAt,
      DateTime? lastDownAt});
}

/// @nodoc
class _$FeedbackStatsCopyWithImpl<$Res>
    implements $FeedbackStatsCopyWith<$Res> {
  _$FeedbackStatsCopyWithImpl(this._self, this._then);

  final FeedbackStats _self;
  final $Res Function(FeedbackStats) _then;

  /// Create a copy of FeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeaterId = null,
    Object? likesTotal = null,
    Object? downTotal = null,
    Object? lastLikeAt = freezed,
    Object? lastDownAt = freezed,
  }) {
    return _then(_self.copyWith(
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      likesTotal: null == likesTotal
          ? _self.likesTotal
          : likesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      downTotal: null == downTotal
          ? _self.downTotal
          : downTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lastLikeAt: freezed == lastLikeAt
          ? _self.lastLikeAt
          : lastLikeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDownAt: freezed == lastDownAt
          ? _self.lastDownAt
          : lastDownAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FeedbackStats].
extension FeedbackStatsPatterns on FeedbackStats {
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
    TResult Function(_FeedbackStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats() when $default != null:
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
    TResult Function(_FeedbackStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats():
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
    TResult? Function(_FeedbackStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats() when $default != null:
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
    TResult Function(String repeaterId, int likesTotal, int downTotal,
            DateTime? lastLikeAt, DateTime? lastDownAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats() when $default != null:
        return $default(_that.repeaterId, _that.likesTotal, _that.downTotal,
            _that.lastLikeAt, _that.lastDownAt);
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
    TResult Function(String repeaterId, int likesTotal, int downTotal,
            DateTime? lastLikeAt, DateTime? lastDownAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats():
        return $default(_that.repeaterId, _that.likesTotal, _that.downTotal,
            _that.lastLikeAt, _that.lastDownAt);
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
    TResult? Function(String repeaterId, int likesTotal, int downTotal,
            DateTime? lastLikeAt, DateTime? lastDownAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStats() when $default != null:
        return $default(_that.repeaterId, _that.likesTotal, _that.downTotal,
            _that.lastLikeAt, _that.lastDownAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FeedbackStats implements FeedbackStats {
  const _FeedbackStats(
      {required this.repeaterId,
      required this.likesTotal,
      required this.downTotal,
      this.lastLikeAt,
      this.lastDownAt});

  @override
  final String repeaterId;
  @override
  final int likesTotal;
  @override
  final int downTotal;
  @override
  final DateTime? lastLikeAt;
  @override
  final DateTime? lastDownAt;

  /// Create a copy of FeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackStatsCopyWith<_FeedbackStats> get copyWith =>
      __$FeedbackStatsCopyWithImpl<_FeedbackStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedbackStats &&
            (identical(other.repeaterId, repeaterId) ||
                other.repeaterId == repeaterId) &&
            (identical(other.likesTotal, likesTotal) ||
                other.likesTotal == likesTotal) &&
            (identical(other.downTotal, downTotal) ||
                other.downTotal == downTotal) &&
            (identical(other.lastLikeAt, lastLikeAt) ||
                other.lastLikeAt == lastLikeAt) &&
            (identical(other.lastDownAt, lastDownAt) ||
                other.lastDownAt == lastDownAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, repeaterId, likesTotal, downTotal, lastLikeAt, lastDownAt);

  @override
  String toString() {
    return 'FeedbackStats(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackStatsCopyWith<$Res>
    implements $FeedbackStatsCopyWith<$Res> {
  factory _$FeedbackStatsCopyWith(
          _FeedbackStats value, $Res Function(_FeedbackStats) _then) =
      __$FeedbackStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String repeaterId,
      int likesTotal,
      int downTotal,
      DateTime? lastLikeAt,
      DateTime? lastDownAt});
}

/// @nodoc
class __$FeedbackStatsCopyWithImpl<$Res>
    implements _$FeedbackStatsCopyWith<$Res> {
  __$FeedbackStatsCopyWithImpl(this._self, this._then);

  final _FeedbackStats _self;
  final $Res Function(_FeedbackStats) _then;

  /// Create a copy of FeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repeaterId = null,
    Object? likesTotal = null,
    Object? downTotal = null,
    Object? lastLikeAt = freezed,
    Object? lastDownAt = freezed,
  }) {
    return _then(_FeedbackStats(
      repeaterId: null == repeaterId
          ? _self.repeaterId
          : repeaterId // ignore: cast_nullable_to_non_nullable
              as String,
      likesTotal: null == likesTotal
          ? _self.likesTotal
          : likesTotal // ignore: cast_nullable_to_non_nullable
              as int,
      downTotal: null == downTotal
          ? _self.downTotal
          : downTotal // ignore: cast_nullable_to_non_nullable
              as int,
      lastLikeAt: freezed == lastLikeAt
          ? _self.lastLikeAt
          : lastLikeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastDownAt: freezed == lastDownAt
          ? _self.lastDownAt
          : lastDownAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

