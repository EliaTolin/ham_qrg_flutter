// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackStatsModel {
  @JsonKey(name: 'repeater_id')
  String get repeaterId;
  @JsonKey(name: 'likes_total')
  int get likesTotal;
  @JsonKey(name: 'down_total')
  int get downTotal;
  @JsonKey(name: 'last_like_at')
  String? get lastLikeAt;
  @JsonKey(name: 'last_down_at')
  String? get lastDownAt;

  /// Create a copy of FeedbackStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedbackStatsModelCopyWith<FeedbackStatsModel> get copyWith =>
      _$FeedbackStatsModelCopyWithImpl<FeedbackStatsModel>(
          this as FeedbackStatsModel, _$identity);

  /// Serializes this FeedbackStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedbackStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, repeaterId, likesTotal, downTotal, lastLikeAt, lastDownAt);

  @override
  String toString() {
    return 'FeedbackStatsModel(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class $FeedbackStatsModelCopyWith<$Res> {
  factory $FeedbackStatsModelCopyWith(
          FeedbackStatsModel value, $Res Function(FeedbackStatsModel) _then) =
      _$FeedbackStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'likes_total') int likesTotal,
      @JsonKey(name: 'down_total') int downTotal,
      @JsonKey(name: 'last_like_at') String? lastLikeAt,
      @JsonKey(name: 'last_down_at') String? lastDownAt});
}

/// @nodoc
class _$FeedbackStatsModelCopyWithImpl<$Res>
    implements $FeedbackStatsModelCopyWith<$Res> {
  _$FeedbackStatsModelCopyWithImpl(this._self, this._then);

  final FeedbackStatsModel _self;
  final $Res Function(FeedbackStatsModel) _then;

  /// Create a copy of FeedbackStatsModel
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
              as String?,
      lastDownAt: freezed == lastDownAt
          ? _self.lastDownAt
          : lastDownAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FeedbackStatsModel].
extension FeedbackStatsModelPatterns on FeedbackStatsModel {
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
    TResult Function(_FeedbackStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel() when $default != null:
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
    TResult Function(_FeedbackStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel():
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
    TResult? Function(_FeedbackStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel() when $default != null:
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
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'likes_total') int likesTotal,
            @JsonKey(name: 'down_total') int downTotal,
            @JsonKey(name: 'last_like_at') String? lastLikeAt,
            @JsonKey(name: 'last_down_at') String? lastDownAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'likes_total') int likesTotal,
            @JsonKey(name: 'down_total') int downTotal,
            @JsonKey(name: 'last_like_at') String? lastLikeAt,
            @JsonKey(name: 'last_down_at') String? lastDownAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel():
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
    TResult? Function(
            @JsonKey(name: 'repeater_id') String repeaterId,
            @JsonKey(name: 'likes_total') int likesTotal,
            @JsonKey(name: 'down_total') int downTotal,
            @JsonKey(name: 'last_like_at') String? lastLikeAt,
            @JsonKey(name: 'last_down_at') String? lastDownAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackStatsModel() when $default != null:
        return $default(_that.repeaterId, _that.likesTotal, _that.downTotal,
            _that.lastLikeAt, _that.lastDownAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FeedbackStatsModel implements FeedbackStatsModel {
  const _FeedbackStatsModel(
      {@JsonKey(name: 'repeater_id') required this.repeaterId,
      @JsonKey(name: 'likes_total') required this.likesTotal,
      @JsonKey(name: 'down_total') required this.downTotal,
      @JsonKey(name: 'last_like_at') this.lastLikeAt,
      @JsonKey(name: 'last_down_at') this.lastDownAt});
  factory _FeedbackStatsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackStatsModelFromJson(json);

  @override
  @JsonKey(name: 'repeater_id')
  final String repeaterId;
  @override
  @JsonKey(name: 'likes_total')
  final int likesTotal;
  @override
  @JsonKey(name: 'down_total')
  final int downTotal;
  @override
  @JsonKey(name: 'last_like_at')
  final String? lastLikeAt;
  @override
  @JsonKey(name: 'last_down_at')
  final String? lastDownAt;

  /// Create a copy of FeedbackStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackStatsModelCopyWith<_FeedbackStatsModel> get copyWith =>
      __$FeedbackStatsModelCopyWithImpl<_FeedbackStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeedbackStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedbackStatsModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, repeaterId, likesTotal, downTotal, lastLikeAt, lastDownAt);

  @override
  String toString() {
    return 'FeedbackStatsModel(repeaterId: $repeaterId, likesTotal: $likesTotal, downTotal: $downTotal, lastLikeAt: $lastLikeAt, lastDownAt: $lastDownAt)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackStatsModelCopyWith<$Res>
    implements $FeedbackStatsModelCopyWith<$Res> {
  factory _$FeedbackStatsModelCopyWith(
          _FeedbackStatsModel value, $Res Function(_FeedbackStatsModel) _then) =
      __$FeedbackStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'repeater_id') String repeaterId,
      @JsonKey(name: 'likes_total') int likesTotal,
      @JsonKey(name: 'down_total') int downTotal,
      @JsonKey(name: 'last_like_at') String? lastLikeAt,
      @JsonKey(name: 'last_down_at') String? lastDownAt});
}

/// @nodoc
class __$FeedbackStatsModelCopyWithImpl<$Res>
    implements _$FeedbackStatsModelCopyWith<$Res> {
  __$FeedbackStatsModelCopyWithImpl(this._self, this._then);

  final _FeedbackStatsModel _self;
  final $Res Function(_FeedbackStatsModel) _then;

  /// Create a copy of FeedbackStatsModel
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
    return _then(_FeedbackStatsModel(
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
              as String?,
      lastDownAt: freezed == lastDownAt
          ? _self.lastDownAt
          : lastDownAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

