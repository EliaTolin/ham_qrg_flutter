// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repeater_feedback_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepeaterFeedbackStats {
  String get repeaterId;
  int get likesTotal;
  int get downTotal;
  DateTime? get lastLikeAt;
  DateTime? get lastDownAt;

  /// Create a copy of RepeaterFeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepeaterFeedbackStatsCopyWith<RepeaterFeedbackStats> get copyWith =>
      _$RepeaterFeedbackStatsCopyWithImpl<RepeaterFeedbackStats>(
          this as RepeaterFeedbackStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepeaterFeedbackStats &&
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
    return 'RepeaterFeedbackStats(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class $RepeaterFeedbackStatsCopyWith<$Res> {
  factory $RepeaterFeedbackStatsCopyWith(RepeaterFeedbackStats value,
          $Res Function(RepeaterFeedbackStats) _then) =
      _$RepeaterFeedbackStatsCopyWithImpl;
  @useResult
  $Res call(
      {String repeaterId,
      int likesTotal,
      int downTotal,
      DateTime? lastLikeAt,
      DateTime? lastDownAt});
}

/// @nodoc
class _$RepeaterFeedbackStatsCopyWithImpl<$Res>
    implements $RepeaterFeedbackStatsCopyWith<$Res> {
  _$RepeaterFeedbackStatsCopyWithImpl(this._self, this._then);

  final RepeaterFeedbackStats _self;
  final $Res Function(RepeaterFeedbackStats) _then;

  /// Create a copy of RepeaterFeedbackStats
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

/// Adds pattern-matching-related methods to [RepeaterFeedbackStats].
extension RepeaterFeedbackStatsPatterns on RepeaterFeedbackStats {
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
    TResult Function(_RepeaterFeedbackStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackStats() when $default != null:
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
    TResult Function(_RepeaterFeedbackStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackStats():
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
    TResult? Function(_RepeaterFeedbackStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RepeaterFeedbackStats() when $default != null:
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
      case _RepeaterFeedbackStats() when $default != null:
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
      case _RepeaterFeedbackStats():
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
      case _RepeaterFeedbackStats() when $default != null:
        return $default(_that.repeaterId, _that.likesTotal, _that.downTotal,
            _that.lastLikeAt, _that.lastDownAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RepeaterFeedbackStats implements RepeaterFeedbackStats {
  const _RepeaterFeedbackStats(
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

  /// Create a copy of RepeaterFeedbackStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepeaterFeedbackStatsCopyWith<_RepeaterFeedbackStats> get copyWith =>
      __$RepeaterFeedbackStatsCopyWithImpl<_RepeaterFeedbackStats>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepeaterFeedbackStats &&
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
    return 'RepeaterFeedbackStats(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class _$RepeaterFeedbackStatsCopyWith<$Res>
    implements $RepeaterFeedbackStatsCopyWith<$Res> {
  factory _$RepeaterFeedbackStatsCopyWith(_RepeaterFeedbackStats value,
          $Res Function(_RepeaterFeedbackStats) _then) =
      __$RepeaterFeedbackStatsCopyWithImpl;
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
class __$RepeaterFeedbackStatsCopyWithImpl<$Res>
    implements _$RepeaterFeedbackStatsCopyWith<$Res> {
  __$RepeaterFeedbackStatsCopyWithImpl(this._self, this._then);

  final _RepeaterFeedbackStats _self;
  final $Res Function(_RepeaterFeedbackStats) _then;

  /// Create a copy of RepeaterFeedbackStats
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
    return _then(_RepeaterFeedbackStats(
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
